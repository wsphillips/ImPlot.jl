# Scatter plots

import .LibCImPlot: PlotScatter

function PlotScatter(x::AbstractArray{T}, y::AbstractArray{T};
                  count::Integer = min(length(x), length(y)),
                  offset::Integer = 0, stride::Integer = 1,
                  label_id::String = "") where {T<:ImPlotData}
    
    LibCImPlot.PlotScatter(label_id, x, y, count, offset, stride * sizeof(T))
end

function PlotScatter(x::AbstractArray{T1}, y::AbstractArray{T2}; kwargs...) where {T1<:Real,T2<:Real}
    PlotScatter(promote(x,y)...; kwargs...)
end

function PlotScatter(y::AbstractArray{T}; label_id::String="", count::Integer=length(y),
                  xscale::Real = 1.0, x0::Real = 0,
                  offset::Integer=0, stride::Integer=1) where {T<:ImPlotData}
    LibCImPlot.PlotScatter(label_id, y, count, xscale, x0, offset, stride * sizeof(T))
end

function PlotScatter(x::UnitRange{<:Integer}, y::AbstractArray{T};
                  xscale::Real = 1.0, x0::Real = 0,
                  label_id::String="") where {T<:ImPlotData}

    count::Cint = length(x)
    offset::Cint = x.start >= 1 ? x.start - 1 : throw("Range out of bounds")
    stride = Cint(sizeof(T))
    LibCImPlot.PlotScatter(label_id, y, count, xscale, x0, offset, stride)
end

function PlotScatter(x::StepRange, y::AbstractArray{T};
                     xscale::Real = 1.0, x0::Real = 0,
                     label_id::String="") where {T<:ImPlotData}
    
    x.stop < 1 && throw("Range out of bounds")
    count::Cint = length(x)
    offset::Cint = x.start >= 1 ? x.start - 1 : throw("Range out of bounds")
    stride = Cint(x.step * sizeof(T))
    LibCImPlot.PlotScatter(label_id, y, count, xscale, x0, offset, stride)
end
