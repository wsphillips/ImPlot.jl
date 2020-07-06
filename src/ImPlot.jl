module ImPlot

using CEnum

include("libcimplot/libcimplot.jl")

# Types
import CImGui: ImVec2, ImVec4
import .LibCImPlot: ImPlotStyleVar, ImPlotPoint, ImPlotColormap, ImPlotCol
import .LibCImPlot: ImPlotFlags, ImPlotAxisFlags

# Import default flags 
import .LibCImPlot: ImPlotAxisFlags_Default, ImPlotFlags_Default, ImPlotAxisFlags_NULL

function BeginPlot(title_id::String, x_label::String, y_label::String, size::ImVec2;
                   flags::ImPlotFlags = ImPlotFlags_Default,
                   x_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y2_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL,
                   y3_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL)::Bool

    LibCImPlot.BeginPlot(title_id, x_label, y_label, size,
                         flags, x_flags, y_flags, y2_flags, y3_flags)
end

import .LibCImPlot: EndPlot

include("lines.jl")
include("scatter.jl")
include("heatmap.jl")
include("digital.jl")
include("barchart.jl")
include("piechart.jl")
include("errorbars.jl")
include("text.jl")
include("util.jl")
include("color.jl")
include("styling.jl")

end # module
