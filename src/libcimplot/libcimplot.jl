module LibCImPlot

using CImPlot_jll
#export CImPlot_jll

using CEnum
import CImGui: ImVec2, ImVec4, ImGuiMouseButton, ImGuiKeyModFlags
import CImGui.LibCImGui: ImGuiContext

include("libcimplot_common.jl")
include("libcimplot_api.jl")

enums = [ImPlotFlags, 
         ImPlotAxisFlags, 
         ImPlotCol,
         ImPlotStyleVar,
         ImPlotMarker,
         ImPlotColormap,
         ImPlotLocation,
         ImPlotOrientation,
         ImPlotYAxis]

for i in enums
    @eval export $(Symbol(i))
    for j in instances(i)
        @eval export $(Symbol(j))
    end
end

export CreateContext, DestroyContext, SetImGuiContext, ImPlotPoint

end # module
