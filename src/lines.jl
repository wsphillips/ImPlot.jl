# Line plots
import .LibCImPlot: PlotLine

function PlotLine(x::AbstractArray{T}, y::AbstractArray{T};
                  count::Integer = min(length(x), length(y)), offset::Integer = 0,
                  stride::Integer = 1, label_id::String = "") where {T<:ImPlotData}
    LibCImPlot.PlotLine(label_id, x, y, count, offset, stride * sizeof(T))
end

function PlotLine(x::AbstractArray{T1}, y::AbstractArray{T2}; kwargs...) where {T1<:Real, T2<:Real}
    PlotLine(promote(x,y)...; kwargs...)
end

function PlotLine(y::AbstractArray{T}; label_id::String="", count::Integer=length(y),
                  xscale::Real = 1.0, x0::Real = 0.0, offset::Integer=0,
                  stride::Integer=1) where {T<:ImPlotData}
    LibCImPlot.PlotLine(label_id, y, count, xscale, x0, offset, stride * sizeof(T))
end

function PlotLine(x::UnitRange{<:Integer}, y::AbstractArray{T}; xscale::Real = 1.0,
                  x0::Real = 0.0, label_id::String="") where {T<:ImPlotData}

    count::Cint = length(x) <= length(y) ? length(x) : throw("Range out of bounds")
    offset::Cint = x.start >= 1 ? x.start - 1 : throw("Range out of bounds")
    stride::Cint = sizeof(T)
    LibCImPlot.PlotLine(label_id, y, count,  xscale, x0, offset, stride)
end

function PlotLine(x::StepRange, y::AbstractArray{T}; xscale::Real = 1.0, x0::Real = 0.0,
                  label_id::String= "") where {T<:ImPlotData}

    x.stop < 1 && throw("Range out of bounds")
    count::Cint = length(x) <= length(y) ? length(x) : throw("Range out of bounds")
    offset::Cint = x.start >= 1 ? x.start - 1 : throw("Range out of bounds")
    stride = Cint(x.step * sizeof(T))
    LibCImPlot.PlotLine(label_id, y, count, xscale, x0, offset, stride)
end

PlotLine(x::UnitRange{<:Integer}, y::AbstractArray{<:Real}; kwargs...) = PlotLine(x, Float64.(y); kwargs...)
PlotLine(x::StepRange, y::AbstractArray{<:Real}; kwargs...) = PlotLine(x, Float64.(y); kwargs...)
