# Shaded line plots -- to be added after implot v0.4

function PlotShaded(x::AbstractArray{T,1}, y1::AbstractArray{T,1}, y2::AbstractArray{T,1};
                    label::String = "", count::Integer = min(length(x), length(y2),
                    length(y2)), offset::Integer = 0, stride::Integer = 1) where {T}

    if eltype(x) == Float32
        LibCImPlot.PlotShadedFloatPtrFloatPtrFloatPtr(label, x, y1, y2, count, offset,
                                                      stride * sizeof(Float32))
    elseif eltype(x) == Float64
        LibCImPlot.PlotShadeddoublePtrdoublePtrdoublePtr(label, x, y1, y2, count, offset,
                                                         stride * sizeof(Float64))
    else
        x = convert.(Float32, x)
        y1 = convert.(Float32, y1)
        y2 = convert.(Float32, y2)
        LibCImPlot.PlotShadedFloatPtrFloatPtrFloatPtr(label, x, y1, y2, count, offset,
                                                         stride * sizeof(Float32))
    end
end

function PlotShaded(x::AbstractArray{T1,1}, y1::AbstractArray{T2,1}, y2::AbstractArray{T3,1};
                    kwargs...) where {T1, T2, T3}
    (x, y1, y2) = promote(x,y1,y2)
    PlotShaded(x,y1,y2; kwargs...)
end

function PlotShaded(x::AbstractArray{T,1}, y::AbstractArray{T,1}, y_ref::T;
                    count::Integer = min(length(x),length(y)), offset::Integer = 0,
                    stride::Integer = 1, label_id::String = "") where {T}
    if eltype(x) == Float32
        LibCImPlot.PlotShadedFloatPtrFloatPtrIntFloat(label, x, y, count, y_ref, offset,
                                                      stride * sizeof(Float32))
    elseif eltype(x) == Float64
        LibCImPlot.PlotShadeddoublePtrdoublePtrIntdouble(label, x, y, count, y_ref,
                                                         offset, stride * sizeof(Float64))
    else
        x = convert.(Float32, x)
        y = convert.(Float32, y)
        y_ref = Float32(y_ref)
        LibCImPlot.PlotShadedFloatPtrFloatPtrIntFloat(label, x, y, count, y_ref,
                                                         offset, stride * sizeof(Float32))
    end
end

function PlotShaded(x::AbstractArray{T1,1}, y::AbstractArray{T2,1}, y_ref::T3;
                    kwargs...) where {T1, T2, T3}
    (x, y) = promote(x, y)
    y_ref = eltype(x)(y_ref)
    PlotShaded(x, y, y_ref; kwargs...)
end

function PlotShaded(x::UnitRange{<:Integer}, y1::AbstractArray{T,1}, y2::AbstractArray{T,1}; label::String="") where {T}
    count = length(x)
    offset = x.start >= 1 ? x.start - 1 : throw("Offset out of bounds")

    if eltype(y1) == Float32
        x = collect(Float32, x)
        LibCImPlot.PlotShadedFloatPtrFloatPtrFloatPtr(label, x, y1, y2, count, offset,
                                                      sizeof(Float32))
    elseif eltype(y1) == Float64
        x = collect(Float64, x)
        LibCImPlot.PlotShadeddoublePtrdoublePtrdoublePtr(label, x, y1, y2, count, offset,
                                                         sizeof(Float64))
    else
        y1 = convert.(Float32, y1)
        y2 = convert.(Float32, y2)
        x = collect(Float32, x)
        LibCImPlot.PlotShadedFloatPtrFloatPtrFloatPtr(label, x, y1, y2, count, offset,
                                                         sizeof(Float32))
    end
end

function PlotShaded(x::UnitRange{<:Integer}, y::AbstractArray{T,1}, y_ref::T; label::String="") where {T}
    count = length(x)
    offset = x.start >= 1 ? x.start - 1 : throw("Offset out of bounds")

    if eltype(y) == Float32
        x = collect(Float32, x)
        LibCImPlot.PlotShadedFloatPtrFloatPtrIntFloat(label, x, y, count, y_ref, offset,
                                                      sizeof(Float32))
    elseif eltype(y) == Float64
        x = collect(Float64, x)
        LibCImPlot.PlotShadeddoublePtrdoublePtrIntdouble(label, x, y, count, y_ref,
                                                         offset,sizeof(Float64))
    else
        x = collect(Float32, x)
        y = convert.(Float32, y)
        y_ref = Float32(y_ref)
        LibCImPlot.PlotShadeddoublePtrdoublePtrIntdouble(label, x, y, count, y_ref,
                                                         offset, sizeof(Float32))
    end
end

function PlotShaded(x::StepRange, y1::AbstractArray{T,1}, y2::AbstractArray{T,1}; label::String="") where {T}
    x.stop < 1 && throw("Range out of bounds")
    count = length(x)
    offset = x.start >= 1 ? x.start -1 : throw("Range out of bounds")
    stride = x.step >= 1 ? x.step : throw("Stride must be greater than zero.")
    if eltype(y1) == Float32
        x = collect(Float32, x)
        LibCImPlot.PlotShadedFloatPtrFloatPtrFloatPtr(label, x, y1, y2, count, offset,
                                                      stride * sizeof(Float32))
    elseif eltype(y1) == Float64
        x = collect(Float64, x)
        LibCImPlot.PlotShadeddoublePtrdoublePtrdoublePtr(label, x, y1, y2, count, offset,
                                                         stride * sizeof(Float64))
    else
        y1 = convert.(Float32, y1)
        y2 = convert.(Float32, y2)
        x = collect(Float32, x)
        LibCImPlot.PlotShadedFloatPtrFloatPtrFloatPtr(label, x, y1, y2, count, offset,
                                                         stride * sizeof(Float32))
    end
end

function PlotShaded(x::StepRange, y::AbstractArray{T,1}, y_ref::T; label::String = "") where {T}
    x.stop < 1 && throw("Range out of bounds")
    count = length(x)
    offset = x.start >= 1 ? x.start -1 : throw("Range out of bounds")
    stride = x.step >= 1 ? x.step : throw("Stride must be greater than zero.")

    if eltype(y) == Float32
        x = collect(Float32, x)
        LibCImPlot.PlotShadedFloatPtrFloatPtrIntFloat(label, x, y, count, y_ref, offset,
                                                      stride * sizeof(Float32))
    elseif eltype(y) == Float64
        x = collect(Float64, x)
        LibCImPlot.PlotShadeddoublePtrdoublePtrIntdouble(label, x, y, count, y_ref,
                                                         offset, stirde * sizeof(Float64))
    else
        x = collect(Float32, x)
        y = convert.(Float32, y)
        y_ref = Float32(y_ref)
        LibCImPlot.PlotShadedFloatPtrFloatPtrIntFloat(label, x, y, count, y_ref,
                                                         offset, stride * sizeof(Float32))
    end
end

function PlotShaded(x::OrdinalRange, y1::AbstractArray{T1,1}, y2::AbstractArray{T2,1};
                    kwargs...) where {T1, T2}
    (y1, y2) = promote(y1, y2)
    PlotShaded(x,y1,y2; kwargs...)
end

function PlotShaded(x::OrdinalRange, y::AbstractArray{T1,1}, y_ref::T2;
                    kwargs...) where {T1, T2}
    y_ref = eltype(y)(y_ref)
    PlotShaded(x, y, y_ref; kwargs...)
end

