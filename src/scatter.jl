# Scatter plots
function PlotScatter(label_id, x::AbstractArray{<:Real}, y::AbstractArray{<:Real}, args...)
    return PlotScatter(label_id, promote(x, y), args...)
end

function PlotScatter(label_id, x::AbstractArray{T}, y::AbstractArray{T};
                     count::Integer=min(length(x), length(y)), offset::Integer=0,
                     stride::Integer=1) where {T<:ImPlotData}
    return PlotScatter(label_id, x, y, count, offset, stride * sizeof(T))
end

function PlotScatter(label_id, x::AbstractArray{T1}, y::AbstractArray{T2};
                     kwargs...) where {T1<:Real,T2<:Real}
    return PlotScatter(label_id, promote(x, y)...; kwargs...)
end

function PlotScatter(label_id, y::AbstractArray{T}; count::Integer=length(y),
                     xscale::Real=1.0, x0::Real=0, offset::Integer=0,
                     stride::Integer=1) where {T<:ImPlotData}
    return PlotScatter(label_id, y, count, xscale, x0, offset, stride * sizeof(T))
end

function PlotScatter(label_id, x::UnitRange{<:Integer}, y::AbstractArray{T};
                     xscale::Real=1.0, x0::Real=0) where {T<:ImPlotData}
    count::Cint = length(x)
    offset::Cint = x.start >= 1 ? x.start - 1 : throw("Range out of bounds")
    stride = Cint(sizeof(T))
    return PlotScatter(label_id, y, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, x::StepRange, y::AbstractArray{T};
                     xscale::Real=1.0, x0::Real=0) where {T<:ImPlotData}
    x.stop < 1 && throw("Range out of bounds")
    count::Cint = length(x)
    offset::Cint = x.start >= 1 ? x.start - 1 : throw("Range out of bounds")
    stride = Cint(x.step * sizeof(T))
    return PlotScatter(label_id, y, count, xscale, x0, offset, stride)
end

# xfield, yfield should be propertynames of eltype(structvec)
function PlotScatter(label_id, structvec::Vector{T}, xfield::Symbol, yfield::Symbol;
                     count::Integer=length(structvec), offset::Integer=0, stride::Integer=1,
                    ) where {T}
    Tx = fieldtype(T, xfield)
    Ty = fieldtype(T, yfield)
    x_offset = fieldoffset(T, Base.fieldindex(T, xfield))
    y_offset = fieldoffset(T, Base.fieldindex(T, yfield))
    x_ptr = Ptr{Tx}((pointer(structvec, 1) + x_offset))
    y_ptr = Ptr{Ty}((pointer(structvec, 1) + y_offset))
    p = pointer(structvec, 1)

    if !ismutabletype(T)
        # this is somewhat illegal and is used only to pass a pointer through AbstractArray argument into ccall
        x = unsafe_wrap(Vector{Tx}, x_ptr, size(structvec); own=false)
        y = unsafe_wrap(Vector{Ty}, y_ptr, size(structvec); own=false)
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

    return PlotScatter(label_id, x, y, count, ImPlotScatterFlags_None, offset, stride)
end
