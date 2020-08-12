module LibCImPlot

using CImPlot_jll
#export CImPlot_jll

using CEnum
import CImGui: ImVec2, ImVec4

include("libcimplot_common.jl")
include("libcimplot_api.jl")

for i in [ImPlotFlags, ImPlotAxisFlags]
    for j in instances(i)
        @eval export $(Symbol(j))
    end
end

end # module
