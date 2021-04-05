# Histogram (Bar) plots
import .LibCImPlot: PlotBars, PlotBarsH
# Vertical bars
function PlotBars(values::AbstractArray{T}; count::Integer = length(values),
                  label_id::String = "", width = 0.67, shift = 0.0, offset::Integer = 0,
                  stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotBars(label_id, values, count, width, shift, offset, stride * sizeof(T))
end

function PlotBars(x::AbstractArray{T}, y::AbstractArray{T};
                  count::Integer = min(length(x),length(y)), label_id::String = "",
                  width = 0.67, offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotBars(label_id, x, y, count, width, offset, stride * sizeof(T))
end

function PlotBars(x::AbstractArray{T1}, y::AbstractArray{T2}; 
                  kwargs...) where {T1<:Real, T2<:Real}

    PlotBars(promote(x, y)..., kwargs...)
end

# Horizontal bars
function PlotBarsH(values::AbstractArray{T}; count::Integer = length(values),
                  label_id::String = "", width = 0.67, shift = 0.0, offset::Integer = 0,
                  stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotBarsH(label_id, values, count, width, shift, offset, stride * sizeof(T))
end

function PlotBarsH(x::AbstractArray{T}, y::AbstractArray{T};
                  count::Integer = min(length(x),length(y)), label_id::String = "",
                  width = 0.67, offset::Integer = 0, stride::Integer = 1) where {T<:ImPlotData}

    LibCImPlot.PlotBarsH(label_id, x, y, count, width, offset, stride * sizeof(T))
end

function PlotBarsH(x::AbstractArray{T1}, y::AbstractArray{T2}; 
                   kwargs...) where {T1<:Real, T2<:Real}

    PlotBarsH(promote(x, y)..., kwargs...)
end

