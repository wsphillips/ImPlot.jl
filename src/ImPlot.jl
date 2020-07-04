module ImPlot

using CEnum

include("libcimplot/libcimplot.jl")

using .LibCImPlot
import .LibCImPlot: ImPlotFlags, ImPlotAxisFlags
import .LibCImPlot: ImPlotAxisFlags_Default, ImPlotFlags_Default, ImPlotAxisFlags_NULL
import .LibCImPlot: EndPlot
import CImGui: ImVec2

function BeginPlot(title_id::String, x_label::String, y_label::String, size::ImVec2;
                   flags::ImPlotFlags = ImPlotFlags_Default,
                   x_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y2_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL,
                   y3_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL)::Bool

    LibCImPlot.BeginPlot(title_id, x_label, y_label, size,
                     flags, x_flags, y_flags, y2_flags, y3_flags)
end

BeginPlot() = BeginPlot("","","",ImVec2(-1,300))

include("lines.jl")
include("scatter.jl")
include("heatmap.jl")

end # module
