# Line plots

function PlotLine(x::AbstractArray{T,1}, y::AbstractArray{T,1};
                  count::Integer = min(length(x), length(y)),
                  xscale::Real = 1.0, x0::Real = 0.0,
                  offset::Integer = 0, stride::Integer = 1,
                  label::String = "") where {T}
    if eltype(x) == Int64 # add to another places
        ImPlot.LibCImPlot.PlotLineS64PtrS64Ptr(label, x, y, Cint(count), Cint(offset), Cint(stride * sizeof(Int64)))
    elseif eltype(x) == Int32
        ImPlot.LibCImPlot.PlotLineS32PtrS32Ptr(label, x, y, Cint(count), Cint(offset), Cint(stride * sizeof(Int32)))
    elseif eltype(x) == Float64
        LibCImPlot.PlotLinedoublePtrdoublePtr(label, x, y, Cint(count), Cint(offset), Cint(stride * sizeof(Float64)))
    elseif eltype(x) == Float32
        LibCImPlot.PlotLineFloatPtrFloatPtr(label, x, y, Cint(count), Cint(offset), Cint(stride * sizeof(Float32)))
    else
        x = convert.(Float64, x) #! Float32 leads to problems in big integers after 2^24
        y = convert.(Float64, y)
        LibCImPlot.PlotLinedoublePtrdoublePtr(label, x, y, Cint(count), Cint(offset), Cint(stride * sizeof(Float64)))
    end
end

function PlotLine(x::AbstractArray{T1,1}, y::AbstractArray{T2,1}; kwargs...) where {T1,T2}
    (x, y) = promote(x,y)
    PlotLine(x,y; kwargs...)
end

function PlotLine(y::AbstractArray{T,1}; label::String="", count::Integer=length(y),
                  xscale::Real = 1.0, x0::Real = 0.0,
                  offset::Integer=0, stride::Integer=1) where {T}
    if eltype(y) == Float32
        LibCImPlot.PlotLineFloatPtrInt(label, y, Cint(count),  Float64(xscale), Float64(x0), Cint(offset),
                                    Cint(stride * sizeof(Float32)))
    elseif eltype(y) == Float64
        LibCImPlot.PlotLinedoublePtrInt(label, y, Cint(count),  Float64(xscale), Float64(x0), Cint(offset),
                                    Cint(stride * sizeof(Float64)))
    else
        y = convert.(Float64, y)
        LibCImPlot.PlotLinedoublePtrInt(label, y, Cint(count), Float64(xscale), Float64(x0), Cint(offset),
                                    Cint(stride * sizeof(Float32)))
    end
end

function PlotLine(x::UnitRange{<:Integer}, y::AbstractArray{T,1};
                  xscale::Real = 1.0, x0::Real = 0.0,
                  label::String="") where {T}

        count::Cint = length(x)
        offset::Cint = x.start >= 1 ? x.start - 1 : throw("Range out of bounds")

    if eltype(y) == Float32
        stride = Cint(sizeof(Float32))
        LibCImPlot.PlotLineFloatPtrInt(label, y, count,  Float64(xscale), Float64(x0), offset, stride)
    elseif eltype(y) == Float64
        stride = Cint(sizeof(Float64))
        LibCImPlot.PlotLinedoublePtrInt(label, y, count,  Float64(xscale), Float64(x0), offset, stride)
    else
        y = convert.(Float64, y)
        stride = Cint(sizeof(Float64))
        LibCImPlot.PlotLinedoublePtrInt(label, y, count,  Float64(xscale), Float64(x0), offset, stride)
    end
end

function PlotLine(x::StepRange, y::AbstractArray{T,1};
                  xscale::Real = 1.0, x0::Real = 0.0,
                  label::String="") where {T}
    
    x.stop < 1 && throw("Range out of bounds")
    count::Cint = length(x)
    offset::Cint = x.start >= 1 ? x.start - 1 : throw("Range out of bounds")
    
    if eltype(y) == Float64
        stride = Cint(x.step * sizeof(Float64))
        LibCImPlot.PlotLinedoublePtrInt(label, y, count, Float64(xscale), Float64(x0), offset, stride)
    elseif eltype(y) == Float32
        stride = Cint(x.step * sizeof(Float32))
        LibCImPlot.PlotLineFloatPtrInt(label, y, count,  Float64(xscale), Float64(x0), offset, stride)
    else
        y = convert.(Float64, y)
        stride = Cint(x.step * sizeof(Float64))
        LibCImPlot.PlotLinedoublePtrInt(label, y, count,  Float64(xscale), Float64(x0), offset, stride)
    end
end
