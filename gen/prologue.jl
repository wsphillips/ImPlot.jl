using CImPlot_jll

import CImGui: 
    ImVec2, ImVec4,
    ImGuiMouseButton, ImGuiKeyModFlags, ImGuiCond, ImGuiDragDropFlags,
    ImU8, ImS16, ImU16, ImS32, ImU32, ImS64, ImU64,
    ImTextureID,
    ImDrawList,
    ImGuiContext
            
#Temporary patch; CImGui.jl v1.79.0 aliases ImS8 incorrectly; add to imports in new versions
const ImS8 = Int8
const IMPLOT_AUTO = Cint(-1)
const IMPLOT_AUTO_COL = ImVec4(0,0,0,-1)
export IMPLOT_AUTO, IMPLOT_AUTO_COL
