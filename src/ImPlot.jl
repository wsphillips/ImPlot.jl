module ImPlot

using CEnum

include("libcimplot/libcimplot.jl")

import CImGui.ImVec2
using .LibCImPlot

# Import default flags 
import .LibCImPlot: ImPlotFlags, ImPlotAxisFlags
import .LibCImPlot: ImPlotAxisFlags_Default, ImPlotFlags_Default, ImPlotAxisFlags_NULL

# Import some API functions that don't need special handling
import .LibCImPlot: EndPlot
import .LibCImPlot: SetNextPlotLimits, SetNextPlotLimitsX, SetNextPlotLimitsY 
import .LibCImPlot: IsPlotHovered, GetPlotMousePos, GetPlotLimits, IsPlotQueried, GetPlotQuery

function BeginPlot(title_id::String, x_label::String, y_label::String, size::ImVec2;
                   flags::ImPlotFlags = ImPlotFlags_Default,
                   x_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y2_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL,
                   y3_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL)::Bool

    LibCImPlot.BeginPlot(title_id, x_label, y_label, size,
                         flags, x_flags, y_flags, y2_flags, y3_flags)
end

include("lines.jl")
include("scatter.jl")
include("heatmap.jl")
include("digital.jl")
#include("shaded.jl") # not implemented in v0.3 -> available implot v0.4
include("barchart.jl")
include("piechart.jl")
include("errorbars.jl")
include("text.jl")
include("util.jl")
end # module
