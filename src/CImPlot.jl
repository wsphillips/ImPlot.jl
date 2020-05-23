module CImPlot

using CEnum

include("LibCImPlot.jl")

using .LibCImPlot
import .LibCImPlot: ImPlot_BeginPlot, ImPlot_EndPlot, ImPlot_PlotFloatPtrFloatPtr
import .LibCImPlot: ImPlot_PlotFloatPtrInt
import .LibCImPlot: ImPlotFlags, ImPlotAxisFlags, ImPlotAxisFlags_NULL
import .LibCImPlot: ImPlotAxisFlags_Default, ImPlotFlags_Default
import CImGui: ImVec2

function BeginPlot(title::String, x_label::String, y_label::String, size::ImVec2,
                   flags::ImPlotFlags = ImPlotFlags_Default,
                   x_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y_flags::ImPlotAxisFlags = ImPlotAxisFlags_Default,
                   y2_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL,
                   y3_flags::ImPlotAxisFlags = ImPlotAxisFlags_NULL)::Bool

    ImPlot_BeginPlot(title, x_label, y_label, size,
                     flags, x_flags, y_flags, y2_flags, y3_flags)
end

BeginPlot() = BeginPlot("","","",ImVec2(-1,300))

function EndPlot()
    ImPlot_EndPlot()
end

function Plot(x::Vector{T1}, y::Vector{T2};
              count::Integer=min(length(x), length(y)),
              offset::Integer=0, stride::Integer=1,
              label::String="") where {T1 <: AbstractFloat, T2 <: AbstractFloat}

    T1 !== Float32 && (x = Float32.(x))
    T2 !== Float32 && (y = Float32.(y))
    
    ImPlot_PlotFloatPtrFloatPtr(label, x, y, count, offset, stride * sizeof(Float32))
end

function Plot(x::UnitRange{<:Integer}, y::Vector{T2};
              label::String="") where {T2 <: AbstractFloat}

        count = length(x)
        stride = sizeof(Float32)
        offset = x.start - 1
        T2 !== Float32 && (y = Float32.(y))

        ImPlot_PlotFloatPtrInt(label, y, count, offset, stride)
end

function Plot(y::Vector{T}; label::String="", count::Integer=length(y), offset::Integer=0,
              stride::Integer=1) where {T <: AbstractFloat}

    T !== Float32 && (y = Float32.(y))

    ImPlot_PlotFloatPtrInt(label, y, count, offset, stride * sizeof(Float32))
end

end # module
