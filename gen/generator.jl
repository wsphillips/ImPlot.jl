
cd(@__DIR__)

using Clang.Generators
using ExprTools, MacroTools, JSON3, JuliaFormatter

const CIMGUI_INCLUDE_DIR = joinpath(@__DIR__,"cimgui-pack","cimgui")
const CIMPLOT_INCLUDE_DIR = joinpath(@__DIR__,"cimgui-pack", "cimplot")
const CIMPLOT_H = normpath(CIMPLOT_INCLUDE_DIR, "cimplot.h")

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
pushfirst!(args, "-DCIMGUI_DEFINE_ENUMS_AND_STRUCTS")
pushfirst!(args, "-isystem$CIMGUI_INCLUDE_DIR")
push!(args, "-I$CIMPLOT_INCLUDE_DIR")

# add definitions
@add_def ImVec2
@add_def ImVec4
@add_def ImGuiMouseButton
@add_def ImGuiKeyModFlags
@add_def ImS8 
@add_def ImU8
@add_def ImS16
@add_def ImU16
@add_def ImS32
@add_def ImU32
@add_def ImS64
@add_def ImU64
@add_def ImTextureID
@add_def ImGuiCond
@add_def ImGuiDragDropFlags
@add_def ImDrawList
@add_def ImGuiContext

@add_def ImGuiStyleVar
@add_def ImGuiStyleMod
@add_def ImGuiCol
@add_def ImGuiColorMod
@add_def ImGuiID
@add_def ImGuiStoragePair
@add_def ImGuiTextBuffer
@add_def ImGuiStorage

@add_def ImVector_float
@add_def ImVector_ImU32
@add_def ImVector_ImGuiStyleMod
@add_def ImRect
@add_def ImPoolIdx
@add_def ImVector_ImGuiColorMod

const METADATA_DIR = joinpath(@__DIR__, "cimgui-pack","cimplot","generator", "output")

json_enums = read(joinpath(METADATA_DIR, "structs_and_enums.json"), String);
json_defs = read(joinpath(METADATA_DIR, "definitions.json"), String);
json_typedefs = read(joinpath(METADATA_DIR, "typedefs_dict.json"), String);
enums = JSON3.read(json_enums);
types = JSON3.read(json_typedefs);
FUNCTION_METADATA = JSON3.read(json_defs);
const ENUMS = Symbol.(chop.(string.(propertynames(enums.enums))))
const DESPECIALIZE = ["LinkNextPlotLimits"]

# Check if originally from implot_internal.h; this filters most internal functions
function internal_check(x)
    if hasproperty(x, :location)
        startswith(x.location, "implot_internal") && return true
    end
    return false
end

# Find and extract metadata for specific cimplot function
for objfield in propertynames(FUNCTION_METADATA)
    indexes = nothing
    objvec = getproperty(FUNCTION_METADATA, objfield)
    indexes = findall(internal_check, objvec)
    if !isnothing(indexes)
        append!(options["general"]["printer_blacklist"], getproperty.(objvec[indexes],:ov_cimguiname))
    end
end
#
#for (obj, location) in enums.locations
#    if startswith(location, "implot_internal")
#        push!(options["general"]["printer_blacklist"], String(obj))
#    end
#end

imdatatypes = [:Cfloat, :Cdouble, :ImS8, :ImU8, :ImS16, :ImU16, :ImS32, :ImU32, :ImS64, :ImU64]
jldatatypes = [:Float32, :Float64, :Int8, :UInt8, :Int16, :UInt16, :Int32, :UInt32, :Int64, :UInt64] 
imtojl_lookup = Dict(zip(imdatatypes, jldatatypes))
const PRIMITIVE_TYPES = [:ImPlotPoint, :ImPlotRange, :ImVec2, :ImVec4, :ImPlotLimits]
ctx = create_context(CIMPLOT_H, args, options)
build!(ctx, BUILDSTAGE_NO_PRINTING)

function split_ccall(body)
    local funsymbol, rettype, argtypes, argnames
    for ex in body.args
        @capture(ex, ccall((funsymbol_, libcimgui), rettype_, (argtypes__,), argnames__)) && break
    end
    return (funsymbol, rettype, argtypes, argnames)
end

function parse_default(T::DataType, str, ptr_type = :notparsed)
    str == "((void*)0)" && return :C_NULL
    T <: Integer && return (startswith(str, "sizeof") ? :(sizeof($ptr_type)) : Meta.parse(str))
    T <: AbstractFloat && return Meta.parse(str) 
    T <: Cstring && return Meta.parse(str)
    T <: Bool && return Meta.parse(str)
    T <: Symbol && return Symbol(str)
    return @warn "Not parsing default value of: $str"
end

function revise_arg(def, metadata, i, sym, jltype, ptr_type = :notparsed)
    if jltype ∈ (:Cint, :Clong, :Cshort, :Cushort, :Culong, :Cuchar, :Cchar,
                 :Int8, :UInt8, :Int16, :UInt16, :Int32, :UInt32, :Int64, :UInt64)
        if hasproperty(metadata.defaults, sym)
            val = parse_default(eval(jltype), getproperty(metadata.defaults,sym), ptr_type)
            def[:args][i] = :($( Expr(:kw, :($sym::Integer), val)) )
        else
            def[:args][i] = :($sym::Integer) 
        end
        return
    elseif jltype ∈ (:Cfloat, :Cdouble, :Float64, :Float32)
        if hasproperty(metadata.defaults, sym)
            val = parse_default(eval(jltype), getproperty(metadata.defaults,sym))
            def[:args][i] = :($( Expr(:kw, :($sym::Real), val)) )
        else
            def[:args][i] = :($sym::Real)
        end
        return
    elseif jltype ∈ (:Cstring,:Bool)
        # Don't annotate string arguments--we want to be able to pass C_NULL
        if hasproperty(metadata.defaults, sym)
            val = parse_default(eval(jltype), getproperty(metadata.defaults, sym))
            def[:args][i] = :($(Expr(:kw, sym, val)))
        end

        return
    elseif startswith(string(jltype), "Im")
        if hasproperty(metadata.defaults, sym)
            raw_val = getproperty(metadata.defaults,sym)
            if  raw_val == "((void*)0)"
                val = :C_NULL
                def[:args][i] = :($(Expr(:kw, sym, val)) )
                return
            elseif startswith(raw_val, "Im")
                #if jltype in PRIMITIVE_TYPES && endswith(raw_val, r"\(.+\)")
                #    rx = match(r"\(.+\)",raw_val)
                #    tupex = Meta.parse(rx.match)
                #    def[:args][i] = :($( Expr(:kw, :($sym::$jltype), :($jltype($(tupex.args...))) )))
                #else 
                #    def[:args][i] =  :($( Expr(:kw, sym, :($(Symbol(raw_val))))) )
                #end
                if jltype in PRIMITIVE_TYPES
                    def[:args][i] = :($(Expr(:kw, :($sym::$jltype), Meta.parse(raw_val))))
                else
                    def[:args][i] = :($(Expr(:kw, sym, Meta.parse(raw_val))))
                end
                return
            elseif jltype in ENUMS
                def[:args][i] = :($(Expr(:kw, :($sym::Union{$(Symbol(string(jltype)*"_")),Integer}), Meta.parse(raw_val))))
                return
            else
                def[:args][i] = :($(Expr(:kw, sym, Meta.parse(raw_val))))
                return
            end
        elseif jltype in ENUMS
            def[:args][i] = :($sym::Union{$(Symbol(string(jltype)*"_")),Integer})
            return
        else
                #println("Raw value: $raw_val not processed for $sym :: $jltype in $(def[:name])")
            def[:args][i] = :($sym::$jltype)
            return
        end
    elseif @capture(jltype, Ptr{ptrtype_})
        if hasproperty(metadata.defaults, sym)
            raw_val = getproperty(metadata.defaults,sym)
            if raw_val !== "((void*)0)" && endswith(raw_val, r"\(.+\)")
                rx = match(r"\(.+\)",raw_val)
                println("matched ptr default: $(rx.match)")
                tupex = Meta.parse(rx.match)
                def[:args][i] = :($(Expr(:kw,
                :($sym::Union{$ptrtype,AbstractArray{$ptrtype}}), :($ptrtype($(tupex.args...))))))
            end
        elseif ptrtype == :Cstring
            def[:args][i] = :($sym::Union{Ptr{Nothing},String,AbstractArray{String}})
        elseif ptrtype == :Cvoid
            return
        else
           def[:args][i] = :($sym::Union{$ptrtype,AbstractArray{$ptrtype}}) 
        end
        return
    end
        @info "Not processing argument: $sym::$jltype from $(def[:name])"
        return
end

function make_plotmethod(def, metadata)
    def[:name] = Symbol(metadata.funcname)
    (funsymbol, rettype, argtypes, argnames) = split_ccall(def[:body]) 
    datatype = :notparsed
    for (i, argtype) in enumerate(argtypes)
        sym = argnames[i]
        jltype = argtype ∈ imdatatypes ? imtojl_lookup[argtype] : argtype
        if @capture(jltype, Ptr{ptrtype_}) && ptrtype ∈ imdatatypes
            datatype = ptrtype 
            def[:args][i] = :($sym::Union{Ptr{$ptrtype},Ref{$ptrtype},AbstractArray{$ptrtype}})
        else
            revise_arg(def, metadata, i, sym, jltype, datatype)
        end
    end 
    def[:body] = Expr(:block, 
                      :(ccall(($funsymbol, libcimgui), $rettype, ($(argtypes...),), $(argnames...))))
end             

function make_finalizer!(def, metadata)
    def[:name] = :(Base.finalizer)
    (funsymbol, rettype, argtypes, argnames) = split_ccall(def[:body]) 
    argtype, argname = only(argtypes), only(argnames)
    @capture(argtype, Ptr{ptrtype_})
    def[:args] = [:($argname::Union{$argtype,$ptrtype})]
    new_ccall = :(ccall(($funsymbol, libcimgui), $rettype, ($argtype,), $argname))
    new_body = Expr(:block, :(ptr = pointer_from_objref($argname)), :(GC.@preserve $argname $new_ccall))
    def[:body] = MacroTools.prewalk(rmlines, new_body)
end

function make_constructor!(def, metadata)
    def[:name] = Symbol(metadata.stname)
    (funsymbol, rettype, argtypes, argnames) = split_ccall(def[:body])
    new_ccall = :(ccall(($funsymbol, libcimgui), $rettype, ($(argtypes...),), $(argnames...)))
    def[:body] = Expr(:block, new_ccall)
end

function make_objmethod!(def, metadata)
    def[:name] = Symbol(metadata.funcname)
    (funsymbol, rettype, argtypes, argnames) = split_ccall(def[:body])
    sym, argtype = first(argnames), first(argtypes)

    @capture(argtype, Ptr{ptr_type_})
    def[:args][1] = :($sym::Union{$ptr_type,$argtype})
    for (i, argtype) in enumerate(argtypes)
        i == 1 && continue
        sym = argnames[i]
        jltype = argtype ∈ imdatatypes ? imtojl_lookup[argtype] : argtype
        # Skip pointer types
        if @capture(jltype, Ptr{ptrtype_})
            ptrtype ∉ vcat(PRIMITIVE_TYPES, imdatatypes) && continue
            if ptrtype in (imdatatypes..., :Cstring)
                if ptrtype == :Cstring
                    def[:args][i] = :($sym::Union{Ptr{Nothing},String,AbstractArray{String}})
                else   
                    def[:args][i] = :($sym::Union{Ptr{$ptrtype},Ref{$ptrtype},AbstractArray{$ptrtype}})
                end
                continue
            end
        end
        revise_arg(def, metadata, i, sym, jltype) # offset bc we pop off first arg above
     end  
end

function make_nonudt(def, metadata)
    def[:name] = Symbol(metadata.funcname)
    (funsymbol, rettype, argtypes, argnames) = split_ccall(def[:body])
    sym = popfirst!(def[:args]) 
    @capture(first(argtypes), Ptr{ptr_type_})
    argtypes[1] = :(Ref{$ptr_type})
    def[:body] = Expr(:block,
                      :($sym = Ref{$ptr_type}()),
                      :(ccall(($funsymbol, libcimgui), $rettype, ($(argtypes...),), $(argnames...))),
                      ptr_type in PRIMITIVE_TYPES ? :($sym[]) : :($sym))
    
   for (i, argtype) in enumerate(argtypes)
       i == 1 && continue
       sym = argnames[i]
       jltype = argtype ∈ imdatatypes ? imtojl_lookup[argtype] : argtype
       # Skip pointer types
       if @capture(jltype, Ptr{ptrtype_})
            ptrtype ∉ vcat(PRIMITIVE_TYPES, imdatatypes) && continue
            if ptrtype in (imdatatypes..., :Cstring)
                if ptrtype == :Cstring
                    def[:args][i] = :($sym::Union{Ptr{Nothing},String,AbstractArray{String}})
                else   
                    def[:args][i] = :($sym::Union{Ptr{$ptrtype},Ref{$ptrtype},AbstractArray{$ptrtype}})
                end
                continue
            end
       end
       revise_arg(def, metadata, i-1, sym, jltype) # offset bc we pop off first arg above
    end  
end

function make_generic(def, metadata)
    def[:name] = Symbol(metadata.funcname)
    (funsymbol, rettype, argtypes, argnames) = split_ccall(def[:body])
    def[:body] = Expr(:block,
                      :(ccall(($funsymbol, libcimgui), $rettype, ($(argtypes...),), $(argnames...))))
    for (i, argtype) in enumerate(argtypes)
        sym = argnames[i]
        jltype = argtype ∈ imdatatypes ? imtojl_lookup[argtype] : argtype

        # Remove all type annotations from marked functions
        if metadata.funcname in DESPECIALIZE
            def[:args][i] = :($sym)  
            continue
        end

        # Skip pointer types
        if @capture(jltype, Ptr{ptrtype_})
            ptrtype ∉ vcat(PRIMITIVE_TYPES, imdatatypes) && continue
            if ptrtype in (imdatatypes..., :Cstring)
                if ptrtype == :Cstring
                    def[:args][i] = :($sym::Union{Ptr{Nothing},String,AbstractArray{String}})
                else   
                    def[:args][i] = :($sym::Union{Ptr{$ptrtype},Ref{$ptrtype},AbstractArray{$ptrtype}})
                end
                continue
            end
        end
        revise_arg(def, metadata, i, sym, jltype)
   end
end

function revise_function(ex::Expr, all_metadata, options) 
    def = ExprTools.splitdef(ex)
    # Skip Expr function names (e.g. :(Base.getproperty))
    # FIXME: sometimes getting functors??!!
    def[:name] isa Symbol || return ex
    fun_name = string(def[:name])
    # Skip functions not in the JSON metadata
    any(startswith.(fun_name,string.(propertynames(all_metadata)))) || return ex
    local metadata
    # Find and extract metadata for specific cimplot function
    for objfield in propertynames(all_metadata)
        objvec = getproperty(all_metadata, objfield)
        idx = findfirst(x -> isequal(x.ov_cimguiname, fun_name), objvec)
        if !isnothing(idx)
            metadata = objvec[idx]
            break
        end
    end
    if !@isdefined(metadata) 
        @warn "Could not find function: $fun_name in JSON metadata"
        return ex #throw("Could not find cimgui function in JSON metadata")
    end
    # Check if it's for a type
    if metadata.stname !== ""
        # Skip constructors/destructors for primitive types--we can handle these with Julia
        if metadata.stname ∉ String.(PRIMITIVE_TYPES)
            if hasproperty(metadata, :destructor)
                make_finalizer!(def, metadata)
                return ExprTools.combinedef(def)
            elseif hasproperty(metadata, :constructor)
                # write contructor...
                make_constructor!(def, metadata)
                return ExprTools.combinedef(def)
            end
        end
        # Fall through to object method
        if !(hasproperty(metadata, :destructor) || hasproperty(metadata, :constructor))
            make_objmethod!(def,metadata)
            return ExprTools.combinedef(def)
        else
            return ex
        end
    elseif startswith(metadata.funcname, "Plot") && !startswith(metadata.funcname, "PlotToPixels")
        # Since Plot functions are templated, dispatch on pointer (data input) arguments
        make_plotmethod(def, metadata)
        return ExprTools.combinedef(def)
    elseif hasproperty(metadata, :nonUDT)
        # Pop the pOut argument and insert a Ref creation and unload...
        make_nonudt(def, metadata)
        return ExprTools.combinedef(def)
    else
        make_generic(def, metadata)
        out = ExprTools.combinedef(def)
        return out
    end
    @warn "function $(def[:name]) not parsed"
        return ex
end

function rewrite!(dag::ExprDAG, metadata, options)
    for node in get_nodes(dag)
        expressions = get_exprs(node)
        for (i, expr) in enumerate(expressions)
            if Meta.isexpr(expr, :function)
                    expressions[i] = revise_function(expr, metadata, options)
            end
        end
    end
end

ctx = create_context(CIMPLOT_H, args, options)
build!(ctx, BUILDSTAGE_NO_PRINTING)
rewrite!(ctx.dag, FUNCTION_METADATA, options)
build!(ctx, BUILDSTAGE_PRINTING_ONLY)
#format(normpath(@__DIR__,"..","src"), YASStyle())

