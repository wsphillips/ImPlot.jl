# Histogram (Bar) plots
# Vertical bars
function PlotBars(label_id, x::AbstractArray{T1}, y::AbstractArray{T2},
                  args...) where {T1<:Real,T2<:Real}
    return PlotBars(label_id, promote(x, y)..., args...)
end

function PlotBars(values::AbstractArray{T}; count::Integer=length(values),
                  label_id::String="", width=0.67, shift=0.0, offset::Integer=0,
                  stride::Integer=1) where {T<:ImPlotData}
    return PlotBars(label_id, values, count, width, shift, offset, stride * sizeof(T))
end

function PlotBars(x::AbstractArray{T}, y::AbstractArray{T};
                  count::Integer=min(length(x), length(y)), label_id::String="", width=0.67,
                  offset::Integer=0, stride::Integer=1) where {T<:ImPlotData}
    return PlotBars(label_id, x, y, count, width, offset, stride * sizeof(T))
end

function PlotBars(x::AbstractArray{T1}, y::AbstractArray{T2};
                  kwargs...) where {T1<:Real,T2<:Real}
    return PlotBars(promote(x, y)..., kwargs...)
end

# Horizontal bars
function PlotBarsH(label_id, x::AbstractArray{T1}, y::AbstractArray{T2},
                   args...) where {T1<:Real,T2<:Real}
    return PlotBarsH(label_id, promote(x, y)..., args...)
end

function PlotBarsH(values::AbstractArray{T}; count::Integer=length(values),
                   label_id::String="", width=0.67, shift=0.0, offset::Integer=0,
                   stride::Integer=1) where {T<:ImPlotData}
    return PlotBarsH(label_id, values, count, width, shift, offset, stride * sizeof(T))
end

function PlotBarsH(x::AbstractArray{T}, y::AbstractArray{T};
                   count::Integer=min(length(x), length(y)), label_id::String="",
                   width=0.67, offset::Integer=0, stride::Integer=1) where {T<:ImPlotData}
    return PlotBarsH(label_id, x, y, count, width, offset, stride * sizeof(T))
end

function PlotBarsH(x::AbstractArray{T1}, y::AbstractArray{T2};
                   kwargs...) where {T1<:Real,T2<:Real}
    return PlotBarsH(promote(x, y)..., kwargs...)
end
