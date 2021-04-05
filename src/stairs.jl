import .LibCImPlot.PlotStairs

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
