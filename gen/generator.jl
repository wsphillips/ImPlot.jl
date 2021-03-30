using Clang.Generators

# using ImPlot.LibCImPlot.CImPlot_jll

using CImGui_jll

include_dir = joinpath(CImGui_jll.artifact_dir, "include")

cd(@__DIR__)

const CIMPLOT_H = joinpath(@__DIR__, "cimplot_patched.h") |> normpath

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = ["-I$include_dir", "-DCIMGUI_DEFINE_ENUMS_AND_STRUCTS"]

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

ctx = create_context(CIMPLOT_H, args, options)

build!(ctx)
