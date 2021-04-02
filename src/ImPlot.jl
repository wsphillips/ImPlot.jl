module ImPlot

include("libcimplot.jl")

# Types
using .LibCImPlot
import CImGui: ImVec2, ImVec4

const IMPLOT_ENUMS = [ImPlotFlags_, ImPlotAxisFlags_, ImPlotCol_, ImPlotStyleVar_, ImPlotMarker_,
          ImPlotColormap_, ImPlotLocation_, ImPlotOrientation_, ImPlotYAxis_]

# Export plot flags
for i in IMPLOT_ENUMS
    for j in instances(i)
        @eval export $(Symbol(j))
    end
end

function BeginPlot(title_id::String, x_label, y_label, size::ImVec2;
                    flags = ImPlotFlags_None,
                    x_flags = ImPlotAxisFlags_None,
                    y_flags = ImPlotAxisFlags_None,
                    y2_flags = ImPlotAxisFlags_None,
                    y3_flags = ImPlotAxisFlags_None)::Bool

    LibCImPlot.BeginPlot(title_id, x_label, y_label, size,
                         flags, x_flags, y_flags, y2_flags, y3_flags)
end

include("lines.jl")
include("shaded.jl")
include("scatter.jl")
include("heatmap.jl")
include("digital.jl")
include("barchart.jl")
include("piechart.jl")
include("errorbars.jl")
include("other.jl")
include("util.jl")
include("color.jl")
include("styling.jl")

end # module
