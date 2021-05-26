
function PlotStems(label_id, values::AbstractArray{T}, count::Integer, y_ref::Real = 0., xscale::Real = 1., x0::Real = 0., offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:ImPlotData}
    LibCImPlot.PlotStems(label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, y_ref::Integer = 0, offset::Integer = 0, stride::Integer = sizeof(T)) where {T>:ImPlotData}
    LibCImPlot.PlotStems(label_id, x, y, count, y_ref, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{T}, count::Integer, y_ref::Real = 0., xscale::Real = 1., x0::Real = 0., offset::Integer = 0, stride::Integer = sizeof(Float64)) where {T<:Real}
    LibCImPlot.PlotStems(label_id, Float64.(values), count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, y_ref::Integer = 0, offset::Integer = 0, stride::Integer = sizeof(Float64)) where {T<:Real}
    LibCImPlot.PlotStems(label_id, Float64.(x), Float64.(y), count, y_ref, offset, stride)
end

function PlotStems(values::AbstractArray{T}; count::Integer = length(values), label_id::String = "",
                   y_ref = 0.0, xscale = 1.0, x0 = 0.0, offset::Integer = 0,
                   stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotStems(label_id, values, count, y_ref, xscale, x0, offset, stride * sizeof(T))
end

function PlotStems(values::AbstractArray{T}; count::Integer = length(values), label_id::String = "",
                   y_ref = 0.0, xscale = 1.0, x0 = 0.0, offset::Integer = 0,
                   stride::Integer = 1) where {T <: Real}

    LibCImPlot.PlotStems(label_id, Float64.(values), count, y_ref, xscale, x0, offset, stride * sizeof(Float64))
end

function PlotStems(x::AbstractArray{T}, y::AbstractArray{T};
                   count::Integer = min(length(x), length(y)), label_id::String = "",
                   y_ref = 0.0, offset::Integer = 0, stride::Integer = 1) where {T<:ImPlotData}

    LibCImPlot.PlotStems(label_id, x, y, count, y_ref, offset, stride * sizeof(T))
end

function PlotStems(x::AbstractArray{T}, y::AbstractArray{T}; count::Integer = min(length(x), length(y)),
                   label_id::String = "", y_ref = 0.0, offset::Integer = 0, stride::Integer = 1) where {T<:Real}

    LibCImPlot.PlotStems(label_id, Float64.(x), Float64.(y), count, y_ref, offset, stride * sizeof(Float64))
end

PlotStems(x::AbstractArray{T1}, y::AbstractArray{T2}; kwargs...) where {T1<:Real,T2<:Real} = PlotBars(promote(x, y)...; kwargs...)
