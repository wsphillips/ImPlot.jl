module LibCImPlot

using CImPlot_jll
export CImPlot_jll

using CEnum
import CImGui.ImVec2

include(joinpath(@__DIR__, "..", "gen", "libcimplot_common.jl"))
include(joinpath(@__DIR__, "..", "gen", "libcimplot_api.jl"))

end # module
