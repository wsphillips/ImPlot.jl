module ImPlot

using CImGui
import CImGui: ImVec2, ImVec4

for i in instances(CImGui.ImGuiCond_)
    @eval import CImGui.LibCImGui: $(Symbol(i))
end

include("libcimplot.jl")

using .LibCImPlot
import .LibCImPlot: BeginPlot

const ImPlotData = Union{Float32, Float64, Int8, UInt8, Int16, UInt16, Int32, UInt32, Int64, UInt64}
const IMPLOT_ENUMS = [ImPlotFlags_, ImPlotAxisFlags_, ImPlotCol_, ImPlotStyleVar_, ImPlotMarker_,
          ImPlotColormap_, ImPlotLocation_, ImPlotOrientation_, ImPlotYAxis_]

# Export plot flags
for i in IMPLOT_ENUMS
    for j in instances(i)
        @eval export $(Symbol(j))
    end
end

function LibCImPlot.BeginPlot(title_id::String, x_label = C_NULL, y_label = C_NULL, size::ImVec2 = ImVec2(-1,0);
                    flags = ImPlotFlags_None,
                    x_flags = ImPlotAxisFlags_None,
                    y_flags = ImPlotAxisFlags_None,
                    y2_flags = ImPlotAxisFlags_None,
                    y3_flags = ImPlotAxisFlags_None)::Bool

    LibCImPlot.BeginPlot(title_id, x_label, y_label, size,
                         flags, x_flags, y_flags, y2_flags, y3_flags)
end

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
include("other.jl")
include("util.jl")
include("color.jl")
include("styling.jl")

end # module
