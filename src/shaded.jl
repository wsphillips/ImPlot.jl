# Shaded line plots

function PlotShaded(label_id, values::AbstractArray{T}, count::Integer, y_ref::Real = 0., xscale::Real = 1., x0::Real = 0., offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:ImPlotData}
    LibCImPlot.PlotShaded(label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, y_ref::Real = 0., offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:ImPlotData}
    LibCImPlot.PlotShaded(label_id, x, y, count, y_ref, offset, stride)
end

function PlotShaded(label_id, x::AbstractArray{T}, y1::AbstractArray{T}, y2::AbstractArray{T}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(T)) where {T<:ImPlotData}
    LibCImPlot.PlotShaded(label_id, x, y1, y2, count, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{T}, count::Integer, y_ref::Real = 0., xscale::Real = 1., x0::Real = 0., offset::Integer = 0, stride::Integer = sizeof(Float64)) where {T<:Real}
    LibCImPlot.PlotShaded(label_id, Float64.(values), count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, x::AbstractArray{T}, y::AbstractArray{T}, count::Integer, y_ref::Real = 0., offset::Integer = 0, stride::Integer = sizeof(Float64)) where {T<:Real}
    LibCImPlot.PlotShaded(label_id, Float64.(x), Float64.(y), count, y_ref, offset, stride)
end

function PlotShaded(label_id, x::AbstractArray{T}, y1::AbstractArray{T}, y2::AbstractArray{T}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Float64)) where {T<:Real}
    LibCImPlot.PlotShaded(label_id, Float64.(x), Float64.(y1), Float64.(y2), count, offset, stride)
end

function PlotShaded(x::AbstractArray{T,1}, y1::AbstractArray{T,1}, y2::AbstractArray{T,1};
                               label_id::String = "", count::Integer = min(length(x), length(y2),
                               length(y2)), offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    LibCImPlot.PlotShaded(label_id, x, y1, y2, count, offset, stride * sizeof(T))
end

function PlotShaded(x::AbstractArray{T1}, y1::AbstractArray{T2}, y2::AbstractArray{T3};
                    kwargs...) where {T1<:Real, T2<:Real, T3<:Real}
    PlotShaded(promote(x,y1,y2)...; kwargs...)
end

function PlotShaded(x::AbstractArray{T}, y::AbstractArray{T}, y_ref::T;
                    count::Integer = min(length(x),length(y)), offset::Integer = 0,
                    stride::Integer = 1, label_id::String = "") where {T <: ImPlotData}

    LibCImPlot.PlotShaded(label_id, x, y, count, y_ref, offset, stride * sizeof(T))
end

function PlotShaded(x::AbstractArray{T1}, y::AbstractArray{T2}, y_ref::T3;
                    kwargs...) where {T1<:Real, T2<:Real, T3<:Real}
    (x, y) = promote(x, y)
    y_ref = eltype(x)(y_ref)
    PlotShaded(x, y, y_ref; kwargs...)
end

function PlotShaded(x::UnitRange{<:Integer}, y1::AbstractArray{T}, y2::AbstractArray{T}; label_id::String="") where {T<:ImPlotData}
    count = length(x)
    offset = x.start >= 1 ? x.start - 1 : throw("Offset out of bounds")
    x = collect(T, x)
    LibCImPlot.PlotShaded(label_id, x, y1, y2, count, offset, sizeof(T))
end

function PlotShaded(x::UnitRange{<:Integer}, y::AbstractArray{T}, y_ref::T; label_id::String="") where {T <: ImPlotData}
    count = length(x)
    offset = x.start >= 1 ? x.start - 1 : throw("Offset out of bounds")
    x = collect(T, x)
    LibCImPlot.PlotShaded(label_id, x, y, count, y_ref, offset, sizeof(T))
end

function PlotShaded(x::StepRange, y1::AbstractArray{T}, y2::AbstractArray{T}; label_id::String="") where {T <: ImPlotData}
    x.stop < 1 && throw("Range out of bounds")
    count = length(x)
    offset = x.start >= 1 ? x.start -1 : throw("Range out of bounds")
    stride = x.step >= 1 ? x.step : throw("Stride must be greater than zero.")
    x = collect(T, x)
    LibCImPlot.PlotShaded(label_id, x, y1, y2, count, offset, stride * sizeof(T))
end

function PlotShaded(x::StepRange, y::AbstractArray{T}, y_ref::T; label_id::String = "") where {T <: ImPlotData}
    x.stop < 1 && throw("Range out of bounds")
    count = length(x)
    offset = x.start >= 1 ? x.start -1 : throw("Range out of bounds")
    stride = x.step >= 1 ? x.step : throw("Stride must be greater than zero.")

    x = collect(T, x)
    LibCImPlot.PlotShaded(label_id, x, y, count, y_ref, offset, stride * sizeof(T))
end

function PlotShaded(x::OrdinalRange, y1::AbstractArray{T1}, y2::AbstractArray{T2};
                    kwargs...) where {T1<:Real, T2<:Real}
    PlotShaded(x, promote(y1,y2)...; kwargs...)
end

function PlotShaded(x::OrdinalRange, y::AbstractArray{T1}, y_ref::T2;
                    kwargs...) where {T1<:Real, T2<:Real}
    y_ref = eltype(y)(y_ref)
    PlotShaded(x, y, y_ref; kwargs...)
end

# xfield, yfield should be propertynames of eltype(structvec)
function PlotShaded(
    structvec::Vector{T}, xfield::Symbol, yfield::Symbol, y_ref::Real; 
    count::Integer = length(structvec), offset::Integer = 0,
    stride::Integer = 1, label_id::String = ""
) where T

    Tx = fieldtype(T, xfield)
    Ty = fieldtype(T, yfield)
    x_offset = fieldoffset(T, Base.fieldindex(T, xfield))
    y_offset = fieldoffset(T, Base.fieldindex(T, yfield))
    x_ptr = (pointer(structvec, 1) + x_offset) |> Ptr{Tx}
    y_ptr = (pointer(structvec, 1) + y_offset) |> Ptr{Ty} 

    if !ismutable(T)
        # this is somewhat illegal and is used only to pass a pointer through AbstractArray argument into ccall
        x = unsafe_wrap(Vector{Tx}, x_ptr, size(structvec); own = false)
        y = unsafe_wrap(Vector{Ty}, y_ptr, size(structvec); own = false)
        stride = stride * sizeof(T)
    else # two new vectors every 1/60 second...
        x = Vector{Tx}(undef, length(structvec))
        y = Vector{Ty}(undef, length(structvec))
        for (i, val) in enumerate(structvec)
            x[i] = getproperty(val, xfield)
            y[i] = getproperty(val, yfield)
        end
        if Tx !== Ty
            x, y = promote(x, y)
        end
        stride = stride * sizeof(eltype(x))
    end

    LibCImPlot.PlotShaded(label_id, x, y, count, y_ref, offset, stride * sizeof(T))
end



# function test_fieldvec(structvec::Vector{T}, field::Symbol) where T
#     Tf = fieldtype(T, field)
#     offset = fieldoffset(T, Base.fieldindex(T, field))
#     ptr = (pointer(structvec, 1) + offset) |> Ptr{Tf}

#     x = unsafe_wrap(Vector{Tf}, ptr, size(structvec); own = false)
#     return x[1]
# end
