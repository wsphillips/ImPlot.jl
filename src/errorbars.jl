# Error bar plotting/annotation

const error_bars_mag = IdDict(
    Float32 => LibCImPlot.PlotErrorBarsFloatPtrFloatPtrFloatPtrInt,
    Float64 => LibCImPlot.PlotErrorBarsdoublePtrdoublePtrdoublePtrInt,
    Int8    => LibCImPlot.PlotErrorBarsS8PtrS8PtrS8PtrInt,
    UInt8   => LibCImPlot.PlotErrorBarsU8PtrU8PtrU8PtrInt,
    Int16   => LibCImPlot.PlotErrorBarsS16PtrS16PtrS16PtrInt,
    UInt16  => LibCImPlot.PlotErrorBarsU16PtrU16PtrU16PtrInt,
    Int32   => LibCImPlot.PlotErrorBarsS32PtrS32PtrS32PtrInt,
    UInt32  => LibCImPlot.PlotErrorBarsU32PtrU32PtrU32PtrInt,
    Int64   => LibCImPlot.PlotErrorBarsS64PtrS64PtrS64PtrInt,
    UInt64  => LibCImPlot.PlotErrorBarsU64PtrU64PtrU64PtrInt)

const error_bars_negpos = IdDict(
    Float32 => LibCImPlot.PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr,
    Float64 => LibCImPlot.PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr,
    Int8    => LibCImPlot.PlotErrorBarsS8PtrS8PtrS8PtrS8Ptr,
    UInt8   => LibCImPlot.PlotErrorBarsU8PtrU8PtrU8PtrU8Ptr,
    Int16   => LibCImPlot.PlotErrorBarsS16PtrS16PtrS16PtrS16Ptr,
    UInt16  => LibCImPlot.PlotErrorBarsU16PtrU16PtrU16PtrU16Ptr,
    Int32   => LibCImPlot.PlotErrorBarsS32PtrS32PtrS32PtrS32Ptr,
    UInt32  => LibCImPlot.PlotErrorBarsU32PtrU32PtrU32PtrU32Ptr,
    Int64   => LibCImPlot.PlotErrorBarsS64PtrS64PtrS64PtrS64Ptr,
    UInt64  => LibCImPlot.PlotErrorBarsU64PtrU64PtrU64PtrU64Ptr)

function PlotErrorBars(x::Vector{T}, y::Vector{T}, error::Vector{T}; label_id::String = "",
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    error_bars_mag[T](label_id, x, y, error, Cint(count), Cint(offset), Cint(stride * sizeof(T)))
end

function PlotErrorBars(x::Vector{T}, y::Vector{T}, error::Vector{T}; label_id::String = "",
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: Real}

    error_bars_mag[Float64](label_id, Float64.(x), Float64.(y), Float64.(error), Cint(count),
                            Cint(offset), Cint(stride * sizeof(Float64)))
end

function PlotErrorBars(x::Vector{T}, y::Vector{T}, neg::Vector{T}, pos::Vector{T};
                       label_id::String = "", count::Integer = min(length(x), length(y),
                       length(neg), length(pos)), offset::Integer = 0,
                       stride::Integer = 1) where {T <: ImPlotData}

    error_bars_negpos[T](label_id, x, y, neg, pos, Cint(count), Cint(offset),
                         Cint(stride * sizeof(T)))
end

function PlotErrorBars(x::Vector{T}, y::Vector{T}, neg::Vector{T}, pos::Vector{T};
                       label_id::String = "", count::Integer = min(length(x), length(y),
                       length(neg), length(pos)), offset::Integer = 0,
                       stride::Integer = 1) where {T <: Real}

error_bars_negpos[T](label_id, Float64.(x), Float64.(y), Float64.(neg), Float64.(pos),
                     Cint(count), Cint(offset), Cint(stride * sizeof(Float64)))
end

PlotErrorBars(x::Vector{T1}, y::Vector{T2}, error::Vector{T3}; kwargs...) where {T1,T2,T3} =
PlotErrorBars(promote(x,y,error)...;kwargs...)

# Horizontal error bars/annotations
const error_barsh_mag = IdDict(
    Float32 => LibCImPlot.PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt,
    Float64 => LibCImPlot.PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt,
    Int8    => LibCImPlot.PlotErrorBarsHS8PtrS8PtrS8PtrInt,
    UInt8   => LibCImPlot.PlotErrorBarsHU8PtrU8PtrU8PtrInt,
    Int16   => LibCImPlot.PlotErrorBarsHS16PtrS16PtrS16PtrInt,
    UInt16  => LibCImPlot.PlotErrorBarsHU16PtrU16PtrU16PtrInt,
    Int32   => LibCImPlot.PlotErrorBarsHS32PtrS32PtrS32PtrInt,
    UInt32  => LibCImPlot.PlotErrorBarsHU32PtrU32PtrU32PtrInt,
    Int64   => LibCImPlot.PlotErrorBarsHS64PtrS64PtrS64PtrInt,
    UInt64  => LibCImPlot.PlotErrorBarsHU64PtrU64PtrU64PtrInt)

const error_barsh_negpos = IdDict(
    Float32 => LibCImPlot.PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr,
    Float64 => LibCImPlot.PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr,
    Int8    => LibCImPlot.PlotErrorBarsHS8PtrS8PtrS8PtrS8Ptr,
    UInt8   => LibCImPlot.PlotErrorBarsHU8PtrU8PtrU8PtrU8Ptr,
    Int16   => LibCImPlot.PlotErrorBarsHS16PtrS16PtrS16PtrS16Ptr,
    UInt16  => LibCImPlot.PlotErrorBarsHU16PtrU16PtrU16PtrU16Ptr,
    Int32   => LibCImPlot.PlotErrorBarsHS32PtrS32PtrS32PtrS32Ptr,
    UInt32  => LibCImPlot.PlotErrorBarsHU32PtrU32PtrU32PtrU32Ptr,
    Int64   => LibCImPlot.PlotErrorBarsHS64PtrS64PtrS64PtrS64Ptr,
    UInt64  => LibCImPlot.PlotErrorBarsHU64PtrU64PtrU64PtrU64Ptr)

function PlotErrorBarsH(x::Vector{T}, y::Vector{T}, error::Vector{T}; label_id::String = "",
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}

    error_barsh_mag[T](label_id, x, y, error, Cint(count), Cint(offset), Cint(stride * sizeof(T)))
end

function PlotErrorBarsH(x::Vector{T}, y::Vector{T}, error::Vector{T}; label_id::String = "",
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1) where {T <: Real}

    error_barsh_mag[Float64](label_id, Float64.(x), Float64.(y), Float64.(error), Cint(count),
                            Cint(offset), Cint(stride * sizeof(Float64)))
end

function PlotErrorBarsH(x::Vector{T}, y::Vector{T}, neg::Vector{T}, pos::Vector{T};
                       label_id::String = "", count::Integer = min(length(x), length(y),
                       length(neg), length(pos)), offset::Integer = 0,
                       stride::Integer = 1) where {T <: ImPlotData}

    error_barsh_negpos[T](label_id, x, y, neg, pos, Cint(count), Cint(offset),
                         Cint(stride * sizeof(T)))
end

function PlotErrorBarsH(x::Vector{T}, y::Vector{T}, neg::Vector{T}, pos::Vector{T};
                       label_id::String = "", count::Integer = min(length(x), length(y),
                       length(neg), length(pos)), offset::Integer = 0,
                       stride::Integer = 1) where {T <: Real}

error_barsh_negpos[T](label_id, Float64.(x), Float64.(y), Float64.(neg), Float64.(pos),
                     Cint(count), Cint(offset), Cint(stride * sizeof(Float64)))
end

PlotErrorBarsH(x::Vector{T1}, y::Vector{T2}, error::Vector{T3}; kwargs...) where {T1,T2,T3} =
PlotErrorBarsH(promote(x,y,error)...;kwargs...)
