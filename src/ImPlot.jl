module ImPlot

using CEnum

include("libcimplot/libcimplot.jl")

# Types
using .LibCImPlot
import CImGui: ImVec2, ImVec4, ImGuiCond_Always, ImGuiCond_Appearing, ImGuiCond_FirstUseEver,
               ImGuiCond_Once

import .LibCImPlot: ImPlotStyleVar, ImPlotPoint, ImPlotColormap, ImPlotCol
import .LibCImPlot: ImPlotFlags, ImPlotAxisFlags

# Export plot flags 
for i in [ImPlotFlags, ImPlotAxisFlags]
    for j in instances(i)
        @eval export $(Symbol(j))
    end
end

function BeginPlot(title_id::String, x_label, y_label, size::ImVec2 = ImVec2(-1,0);
                    flags::ImPlotFlags = ImPlotFlags_None,
                    x_flags::ImPlotAxisFlags = ImPlotAxisFlags_None,
                    y_flags::ImPlotAxisFlags = ImPlotAxisFlags_None,
                    y2_flags::ImPlotAxisFlags = ImPlotAxisFlags_None,
                    y3_flags::ImPlotAxisFlags = ImPlotAxisFlags_None)::Bool
 
    LibCImPlot.BeginPlot(title_id, x_label, y_label, size,
                         flags, x_flags, y_flags, y2_flags, y3_flags)
end

import .LibCImPlot: EndPlot

const ImPlotData = Union{Float32, Float64, Int8, UInt8, Int16, UInt16, Int32, UInt32, Int64, UInt64}

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
