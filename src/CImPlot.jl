module CImPlot

using CEnum

include("LibCImPlot.jl")

using .LibCImPlot
import .LibCImPlot: ImPlot_Begin2dPlot, ImPlot_EndPlot, ImPlot_PlotFloatPtrFloatPtr
import .LibCImPlot: ImPlotFlags, ImPlotAxisFlags
import .LibCImPlot: ImPlotAxisFlags_Default, ImPlotFlags_Default
import CImGui: ImVec2

function BeginPlot(title::String, x_label::String, y_label::String, size::ImVec2,
                   flags::ImPlotFlags, x_flags::ImPlotAxisFlags, y_flags::ImPlotAxisFlags)::Bool

    ImPlot_Begin2dPlot(title, x_label, y_label, size, flags, x_flags, y_flags)
end

BeginPlot() = BeginPlot("test","foo","bar",ImVec2(-1,300), ImPlotFlags_Default,
                        ImPlotAxisFlags_Default, ImPlotAxisFlags_Default)
function EndPlot()
    ImPlot_EndPlot()
end

function Plot(x::Vector{T1}, y::Vector{T2};
              count::Integer=length(x), offset::Integer=0, stride::Integer=1,
              label::String="") where {T1 <: AbstractFloat, T2 <: AbstractFloat}

    T1 !== Float32 && (x = Float32.(x))
    T2 !== Float32 && (y = Float32.(y))
    
    ImPlot_PlotFloatPtrFloatPtr(label, pointer(x, offset + 1), pointer(y, offset + 1),
                                count, offset, stride * sizeof(Float32))
end


end # module
