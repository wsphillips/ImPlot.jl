
function PlotStairs(label_id, values::AbstractArray{T}, count::Integer, xscale::Real = 1.0, x0::Real = 0.0, offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:ImPlotData}
    LibCImPlot.PlotStairs(label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{T}, count::Integer, xscale::Real = 1.0, x0::Real = 0.0, offset::Integer = 0, stride::Integer = sizeof(Float64)) where {T<:Real}
    LibCImPlot.PlotStairs(label_id, Float64.(values), count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:ImPlotData}
    LibCImPlot.PlotStairs(label_id, x, y, count, offset, stride)
end

function PlotStairs(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Float64)) where {T<:Real}
    LibCImPlot.PlotStairs(label_id, Float64.(x), Float64.(y), count, offset, stride)
end

function PlotStairs(y::AbstractArray{T}; 
    label_id::String="", 
    count::Integer=length(y),
    xscale::Real = 1.0, x0::Real = 0.0,
    offset::Integer=0,
    stride::Integer=1
) where {T <: ImPlotData}

    LibCImPlot.PlotStairs(label_id, y, count, xscale, x0, offset, stride * sizeof(T))
end

function PlotStairs(x::AbstractArray{T}, y::AbstractArray{T};
    count::Integer = min(length(x), length(y)),
    offset::Integer = 0, 
    stride::Integer = 1,
    label_id::String = ""
) where {T <: ImPlotData}

    LibCImPlot.PlotStairs(label_id, x, y, count, offset, stride * sizeof(T))
end 
