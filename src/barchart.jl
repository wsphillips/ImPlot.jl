# Histogram (Bar) plots
# Vertical bars

function PlotBars(label_id, values::AbstractArray{T}, count::Integer, width::Real = 0.67, shift::Real = 0.0, offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:ImPlotData}
    LibCImPlot.PlotBars(label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:ImPlotData}
    LibCImPlot.PlotBars(label_id, x, y, count, width, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{T}, count::Integer, width::Real = 0.67, shift::Real = 0.0, offset::Integer = 0, stride::Integer = sizeof(Float64)) where {T<:Real}
    LibCImPlot.PlotBars(label_id, Float64.(values), count, width, shift, offset, stride)
end

function PlotBars(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(Float64)) where {T<:Real}
    LibCImPlot.PlotBars(label_id, Float64.(x), Float64.(y), count, width, offset, stride)
end

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

function PlotBarsH(label_id, values::AbstractArray{T}, count::Integer, height::Real = 0.67, shift::Real = 0.0, offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:ImPlotData}
    LibCImPlot.PlotBarsH(label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:ImPlotData}
    LibCImPlot.PlotBarsH(label_id, x, y, count, height, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{T}, count::Integer, height::Real = 0.67, shift::Real = 0.0, offset::Integer = 0, stride::Integer = sizeof(Float64)) where {T<:Real}
    LibCImPlot.PlotBarsH(label_id, Float64.(values), count, height, shift, offset, stride)
end

function PlotBarsH(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(Float64)) where {T<:Real}
    LibCImPlot.PlotBarsH(label_id, Float64.(x), Float64.(y), count, height, offset, stride)
end

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

PlotBarsG(label_id, getter, data, count, width, offset = 0) =
LibCImPlot.PlotBarsG(label_id, getter, data, count, offset)
