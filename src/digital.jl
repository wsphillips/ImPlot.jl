# Digital signal plots

import .LibCImPlot: PlotDigital

function PlotDigital(x::AbstractArray{T}, y::AbstractArray{T}; label::String = "",
                     count::Integer = min(length(x),length(y)), offset::Integer = 0,
                     stride::Integer = 1) where {T<:ImPlotData}

    LibCImPlot.PlotDigital(label, x, y, count, offset, stride * sizeof(T))
end

function PlotDigital(x::AbstractArray{T1}, y::AbstractArray{T2}; kwargs...) where {T1<:Real,T2<:Real}
    PlotDigital(promote(x,y)...; kwargs...)
end


