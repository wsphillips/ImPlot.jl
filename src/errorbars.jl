# Error bar plotting/annotation

import .LibCImPlot: PlotErrorBars, PlotErrorBarsH

function PlotErrorBars(x::AbstractArray{T}, y::AbstractArray{T},
                       error::Vector{Float32}; label_id::String = "",
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotErrorBars(label_id, x, y, error, count, offset, stride * sizeof(T))
end

function PlotErrorBars(x::AbstractArray{T}, y::AbstractArray{T},
                       negative::AbstractArray{T}, positive::AbstractArray{T}; label_id::String = "",
                       count::Integer = min(length(x), length(y), length(negative), length(positive)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotErrorBars(label_id, x, y, neg, pos, count, offset, stride * sizeof(T))
end

function PlotErrorBars(x::AbstractArray{T1}, y::AbstractArray{T2}, neg::AbstractArray{T3},
                       pos::AbstractArray{T4}; kwargs...) where {T1<:Real,T2<:Real,T3<:Real,T4<:Real}
    
    LibCImPlot.PlotErrorBars(label_id, promote(x,y,pos,neg)...; kwargs...)
end

PlotErrorBars(x::Vector{T1}, y::Vector{T2}, error::Vector{T3}; kwargs...) where {T1,T2,T3} =
PlotErrorBars(promote(x,y,error)...;kwargs...)

function PlotErrorBarsH(x::AbstractArray{T}, y::AbstractArray{T},
                       error::Vector{Float32}; label_id::String = "",
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotErrorBarsH(label_id, x, y, error, count, offset, stride * sizeof(T))
end

function PlotErrorBarsH(x::AbstractArray{T}, y::AbstractArray{T},
                       negative::AbstractArray{T}, positive::AbstractArray{T}; label_id::String = "",
                       count::Integer = min(length(x), length(y), length(negative), length(positive)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotErrorBarsH(label_id, x, y, neg, pos, count, offset, stride * sizeof(T))
end

function PlotErrorBarsH(x::AbstractArray{T1}, y::AbstractArray{T2}, neg::AbstractArray{T3},
                       pos::AbstractArray{T4}; kwargs...) where {T1<:Real,T2<:Real,T3<:Real,T4<:Real}
    
    LibCImPlot.PlotErrorBarsH(label_id, promote(x,y,pos,neg)...; kwargs...)
end

