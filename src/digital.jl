# Digital signal plots

function PlotDigital(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:ImPlotData}
    LibCImPlot.PlotDigital(label_id, x, y, count, offset, stride)
end

function PlotDigital(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:Real}
    LibCImPlot.PlotDigital(label_id, Float64.(x), Float64.(y), count, offset, stride)
end

function PlotDigital(x::AbstractArray{T}, y::AbstractArray{T}; label_id::String = "",
                     count::Integer = min(length(x),length(y)), offset::Integer = 0,
                     stride::Integer = 1) where {T<:ImPlotData}

    LibCImPlot.PlotDigital(label_id, x, y, count, offset, stride * sizeof(T))
end

function PlotDigital(x::AbstractArray{T1}, y::AbstractArray{T2}; kwargs...) where {T1<:Real,T2<:Real}
    PlotDigital(promote(x,y)...; kwargs...)
end


