module CImPlot

using CEnum

include("implot/implot.jl")

using .ImPlot
import .ImPlot: ImPlotFlags, ImPlotAxisFlags
import .ImPlot: ImPlotAxisFlags_Default, ImPlotFlags_Default, ImPlotAxisFlags_NULL
import CImGui: ImVec2

function BeginPlot(title_id::String, x_label::String, y_label::String, size::ImVec2;
                   flags::ImPlotFlags = ImPlotFlags_Default,
                   x_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y2_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL,
                   y3_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL)::Bool

    ImPlot.BeginPlot(title_id, x_label, y_label, size,
                     flags, x_flags, y_flags, y2_flags, y3_flags)
end

BeginPlot() = BeginPlot("","","",ImVec2(-1,300))

function EndPlot()
    ImPlot.EndPlot()
end
include("lines.jl")
end # module
