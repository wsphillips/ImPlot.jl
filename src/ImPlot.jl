module ImPlot
import LibCImGui
for i in instances(LibCImGui.ImGuiCond_)
    @eval import LibCImGui: $(Symbol(i))
end
import LibCImGui: libcimgui

const ImPlotData = Union{Float32,Float64,Int8,UInt8,Int16,UInt16,Int32,UInt32,Int64,UInt64}

include("libcimplot.jl")

function BeginPlot(title_id::String, x_label = C_NULL, y_label = C_NULL, size::ImVec2 = ImVec2(-1,0);
                    flags = ImPlotFlags_None,
                    x_flags = ImPlotAxisFlags_None,
                    y_flags = ImPlotAxisFlags_None,
                    y2_flags = ImPlotAxisFlags_None,
                    y3_flags = ImPlotAxisFlags_None)::Bool

    BeginPlot(title_id, x_label, y_label, size,
                         flags, x_flags, y_flags, y2_flags, y3_flags)
end

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
