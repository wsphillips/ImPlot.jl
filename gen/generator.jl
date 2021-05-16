using Clang.Generators
# using ImPlot.LibCImPlot.CImPlot_jll
using CImGui_jll

include_dir = joinpath(CImGui_jll.artifact_dir, "include")

cd(@__DIR__)

const CIMPLOT_H = joinpath(@__DIR__, "cimplot_patched.h") |> normpath

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-isystem$include_dir", "-DCIMGUI_DEFINE_ENUMS_AND_STRUCTS")

# add definitions
# @add_def ImVec2
# @add_def ImVec4
# @add_def ImGuiMouseButton
# @add_def ImGuiKeyModFlags
# @add_def ImS8
# @add_def ImU8
# @add_def ImS16
# @add_def ImU16
# @add_def ImS32
# @add_def ImU32
# @add_def ImS64
# @add_def ImU64
# @add_def ImTextureID
# @add_def ImGuiCond
# @add_def ImGuiDragDropFlags
# @add_def ImDrawList
# @add_def ImGuiContext

#=
jltypes = [Float32, Float64, Int8, UInt8, Int16, UInt16, Int32, UInt32, Int64, UInt64]
typedict = Dict(zip(imtypes,jltypes))
=#
#type_names = ["FloatPtr", "doublePtr", "S8Ptr", "U8Ptr", "S16Ptr", "U16Ptr", "S32Ptr", "U32Ptr", "S64Ptr", "U64Ptr"]

imdatatypes = [:Cfloat, :Cdouble, :ImS8, :ImU8, :ImS16, :ImU16, :ImS32, :ImU32, :ImS64, :ImU64]
plot_types = ["Line", "Scatter", "Stairs", "Shaded", "BarsH", "Bars", "ErrorBarsH", "ErrorBars", "Stems", "VLines", "HLines", "PieChart", "Heatmap", "Histogram", "Histogram2D", "Digital"]

ctx = create_context(CIMPLOT_H, args, options)

build!(ctx, BUILDSTAGE_NO_PRINTING)

function revise_function!(e::Expr)

    # Get name of the function
    fname = string(e.args[1].args[1])

    # Skip if it's not a prefix added by cimplot
    startswith(fname,"ImPlot_") || return e

    # Strip off the prefix to match C++ (since we have a namespace)
    fname = fname[8:end] # remove first 7 characters == 'ImPlot_'

    # Plot functions are templated and have a regular structure
    if startswith(fname, "Plot")

        # iterate the tuple of C argument types in the function's ccall
        cargtypes = e.args[2].args[1].args[4].args
        for (i, cargtype) in enumerate(cargtypes)

            # All pointers in plot functions (where eltype ∈ imdatatypes) are array inputs
            if (Meta.isexpr(cargtype, :curly) && cargtype.args[1] == :Ptr) && cargtype.args[2] ∈ imdatatypes

                # Input arrays allocated in Julia should be passed as Ref: https://docs.julialang.org/en/v1/manual/calling-c-and-fortran-code/#When-to-use-T,-Ptr{T}-and-Ref{T}
                e.args[2].args[1].args[4].args[i].args[1] = :Ref

                # Annotate the Julia method signature
                sym = e.args[1].args[i+1]
                e.args[1].args[i+1] = Expr(:(::), sym, Expr(:curly, :AbstractArray, cargtype.args[2]))
                # Used if you want to calculate stride size below
                #= if cargtype.args[2] ∈ keys(typedict)
                    global stridesize = sizeof(typedict[cargtype.args[2]])
                end =#
            elseif cargtype == :Cint
                sym = e.args[1].args[i+1]
                #= it's possible to set default arg values from DAG expressions too. Examples below are unused for now.
                if sym == :stride
                    e.args[1].args[1+i] = Expr(:call, :(=), Expr(:(::), sym, :Integer), Expr(:call, :Int32, stridesize))
                elseif sym == :offset
                    e.args[1].args[1+i] = Expr(:call, :(=), Expr(:(::), sym, :Integer), Expr(:call, :zero, :Int32))
                else =#
                    e.args[1].args[1+i] = Expr(:(::), sym, :Integer)
                # end
            elseif cargtype ∈ [:Cdouble, :Cfloat]
                sym = e.args[1].args[i+1]
                e.args[1].args[i+1] = Expr(:(::), sym, :Real)
            end
        end

        for ptype in plot_types
            fullname = "Plot" * ptype
            if startswith(fname, fullname)
                if fname[length(fullname)+1] == 'G' || fname[length(fullname)+1] == 'H'
                    fname = fname[1:length(fullname)+1]
                else
                    fname = fname[1:length(fullname)]
                end
            end
        end
    end

    e.args[1].args[1] = Symbol(fname)
    return e
end

function rewrite!(dag::ExprDAG)
    for node in get_nodes(dag)
        for expr in get_exprs(node)
            Meta.isexpr(expr, :function) && revise_function!(expr)
        end
    end
end

rewrite!(ctx.dag)
build!(ctx, BUILDSTAGE_PRINTING_ONLY)
