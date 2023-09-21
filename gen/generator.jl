using Clang.Generators
using ExprTools, MacroTools, JSON3, JuliaFormatter, LibGit2

if "cimgui-pack" ∉ readdir(@__DIR__)
    cimgui_pack_repo = "https://github.com/JuliaImGui/cimgui-pack"
    repo = LibGit2.clone(cimgui_pack_repo, joinpath(@__DIR__, "cimgui-pack"))
    cd(joinpath(@__DIR__, "cimgui-pack")) do
        run(`git submodule update --init --recursive`)
    end
end

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

include(joinpath(@__DIR__, "helpers.jl"))

# GLOBALS
const DESPECIALIZE = ["LinkNextPlotLimits"]
const IMDATATYPES = [:Cfloat, :Cdouble, :ImS8, :ImU8, :ImS16, :ImU16, :ImS32, :ImU32, :ImS64, :ImU64]
const JLDATATYPES = [:Float32, :Float64, :Int8, :UInt8, :Int16, :UInt16, :Int32, :UInt32, :Int64, :UInt64] 
const IMTOJL_LOOKUP = Dict(zip(IMDATATYPES, JLDATATYPES))
const IMGUI_ISBITS_TYPES = [:ImPlotPoint, :ImPlotRange, :ImVec2, :ImVec4, :ImPlotRect]

# Read in JSON metadata
const METADATA_DIR = joinpath(@__DIR__, "cimgui-pack","cimplot","generator", "output")
FUNCTION_METADATA, ENUMS = read_metadata(METADATA_DIR);

# Find and extract metadata for specific cimplot function
filter_internal_functions!(options, FUNCTION_METADATA)

cd(@__DIR__) do
    ctx = create_context(CIMPLOT_H, args, options)
    build!(ctx, BUILDSTAGE_NO_PRINTING)
    rewrite!(ctx.dag, FUNCTION_METADATA, options)
    build!(ctx, BUILDSTAGE_PRINTING_ONLY)
end
#format(normpath(@__DIR__,"..","src"), YASStyle())

