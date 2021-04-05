# Error bar plotting/annotation

import .LibCImPlot: PlotErrorBars, PlotErrorBarsH

function PlotErrorBars(x::AbstractArray{T}, y::AbstractArray{T}, error::AbstractArray{T}; 
                       label_id::String = "",
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotErrorBars(label_id, x, y, error, count, offset, stride * sizeof(T))
end

function PlotErrorBars(x::AbstractArray{T}, y::AbstractArray{T},
                       negative::AbstractArray{T}, positive::AbstractArray{T}; 
                       label_id::String = "",
                       count::Integer = min(length(x), length(y), length(negative), length(positive)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotErrorBars(label_id, x, y, negative, positive, count, offset, stride * sizeof(T))
end

function PlotErrorBars(x::AbstractArray{T1}, y::AbstractArray{T2}, error::AbstractArray{T3}; 
                       kwargs...) where {T1<:Real,T2<:Real,T3<:Real}

    PlotErrorBars(promote(x,y,error)...; kwargs...)
end

function PlotErrorBars(x::AbstractArray{T1}, y::AbstractArray{T2}, neg::AbstractArray{T3},
                       pos::AbstractArray{T4}; kwargs...) where {T1<:Real,T2<:Real,T3<:Real,T4<:Real}
    
    PlotErrorBars(promote(x,y,pos,neg)...; kwargs...)
end


function PlotErrorBarsH(x::AbstractArray{T}, y::AbstractArray{T}, error::AbstractArray{T}; 
                       label_id::String = "",
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotErrorBarsH(label_id, x, y, error, count, offset, stride * sizeof(T))
end

function PlotErrorBarsH(x::AbstractArray{T}, y::AbstractArray{T},
                       negative::AbstractArray{T}, positive::AbstractArray{T}; 
                       label_id::String = "",
                       count::Integer = min(length(x), length(y), length(negative), length(positive)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotErrorBarsH(label_id, x, y, negative, positive, count, offset, stride * sizeof(T))
end

function PlotErrorBarsH(x::AbstractArray{T1}, y::AbstractArray{T2}, error::AbstractArray{T3}; 
                       kwargs...) where {T1<:Real,T2<:Real,T3<:Real}
    
    PlotErrorBarsH(promote(x,y,error)...; kwargs...)
end

function PlotErrorBarsH(x::AbstractArray{T1}, y::AbstractArray{T2}, neg::AbstractArray{T3}, 
                       pos::AbstractArray{T4}; kwargs...) where {T1<:Real,T2<:Real,T3<:Real,T4<:Real}

    PlotErrorBarsH(promote(x,y,neg,pos)...; kwargs...)
end