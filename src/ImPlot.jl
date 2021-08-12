module ImPlot

using CImGui

for i in instances(CImGui.ImGuiCond_)
    @eval import CImGui.LibCImGui: $(Symbol(i))
end

const ImPlotData = Union{Float32,Float64,Int8,UInt8,Int16,UInt16,Int32,UInt32,Int64,UInt64}

include("libcimplot.jl")

include("constructors.jl")
include("lines.jl")
include("stairs.jl")
include("shaded.jl")
include("scatter.jl")
include("heatmap.jl")
include("digital.jl")
include("barchart.jl")
include("piechart.jl")
include("errorbars.jl")
include("stems.jl")
#include("other.jl")
include("util.jl")
#include("color.jl")
#include("styling.jl")

end # module
