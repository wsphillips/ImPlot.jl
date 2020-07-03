# Line plots

const ImPlotFloat = Union{Float32, Float64}

function plotline(x::AbstractArray{T,1}, y::AbstractArray{T,1};
                  count::Integer = min(length(x), length(y)),
                  offset::Integer = 0, stride::Integer = 1,
                  label::String = "") where {T}
    
    if eltype(x) == Float64
        ImPlot.PlotLinedoublePtrdoublePtr(label, x, y, Cint(count), Cint(offset),
                                          Cint(stride * sizeof(Float64)))
    elseif eltype(x) == Float32
        ImPlot.PlotLineFloatPtrFloatPtr(label, x, y, Cint(count), Cint(offset),
                                        Cint(stride * sizeof(Float32)))
    else
        x = convert.(Float32, x)
        y = convert.(Float32, y)
        ImPlot.PlotLineFloatPtrFloatPtr(label, x, y, Cint(count), Cint(offset),
                                        Cint(stride * sizeof(Float32)))
    end
end

function plotline(x::AbstractArray{T1,1}, y::AbstractArray{T2,1}; kwargs...) where {T1,T2}
    (x, y) = promote(x,y)
    plotline(x,y; kwargs...)
end

function plotline(y::AbstractArray{T,1}; label::String="", count::Integer=length(y),
                  offset::Integer=0, stride::Integer=1) where {T}
    if eltype(y) == Float32
        ImPlot.PlotLineFloatPtrInt(label, y, Cint(count), Cint(offset),
                                   Cint(stride * sizeof(Float32)))
    elseif eltype(y) == Float64
        ImPlot.PlotLinedoublePtrInt(label, y, Cint(count), Cint(offset),
                                    Cint(stride * sizeof(Float64)))
    else
        y = convert.(Float32, y)
        ImPlot.PlotLineFloatPtrInt(label, y, Cint(count), Cint(offset),
                                   Cint(stride * sizeof(Float32)))
    end
end

function plotline(x::UnitRange{<:Integer}, y::AbstractArray{T,1};
                  label::String="") where {T}

        count::Cint = length(x)
        offset::Cint = x.start >= 1 ? x.start - 1 : throw("Range out of bounds")

    if eltype(y) == Float32
        stride = Cint(sizeof(Float32))
        ImPlot.PlotLineFloatPtrInt(label, y, count, offset, stride)
    elseif eltype(y) == Float64
        stride = Cint(sizeof(Float64))
        ImPlot.PlotLinedoublePtrInt(label, y, count, offset, stride)
    else
        y = convert.(Float32, y)
        stride = Cint(sizeof(Float32))
        ImPlot.PlotLineFloatPtrInt(label, y, count, offset, stride)
    end
end

function plotline(x::StepRange, y::AbstractArray{T,1};
                  label::String="") where {T}
    
    x.stop < 1 && throw("Range out of bounds")
    count::Cint = length(x)
    offset::Cint = x.start >= 1 ? x.start - 1 : throw("Range out of bounds")
    
    if eltype(y) == Float64
        stride = Cint(x.step * sizeof(Float64))
        ImPlot.PlotLinedoublePtrInt(label, y, count, offset, stride)
    elseif eltype(y) == Float32
        stride = Cint(x.step * sizeof(Float32))
        ImPlot.PlotLineFloatPtrInt(label, y, count, offset, stride)
    else
        y = convert.(Float32, y)
        stride = Cint(x.step * sizeof(Float32))
        ImPlot.PlotLineFloatPtrInt(label, y, count, offset, stride)
    end
end
