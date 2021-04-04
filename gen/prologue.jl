using CImPlot_jll

using CImGui

import CImGui: 
    # Vector primitives:
    ImVec2, ImVec4,
    # Enums
    ImGuiMouseButton, ImGuiKeyModFlags, ImGuiCond, ImGuiDragDropFlags,
    # Primitive type aliases; uncomment after CImGui update
    #=ImS8,=# ImU8, ImS16, ImU16, ImS32, ImU32, ImS64, ImU64,
    ImTextureID,
    ImDrawList,
    ImGuiContext
            
#Temporary patch; CImGui.jl v1.79.0 aliases ImS8 incorrectly
const ImS8 = Int8

const IMPLOT_AUTO = Cint(-1)
const IMPLOT_AUTO_COL = ImVec4(0,0,0,-1)
