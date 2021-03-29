# Histogram (Bar) plots
#
# Vertical bars
const ImPlotData = Union{Float32, Float64, Int8, UInt8, Int16, UInt16, Int32, UInt32, Int64, UInt64}

const plot_bars_count = IdDict(Float32 => LibCImPlot.PlotBarsFloatPtrInt,
                               Float64 => LibCImPlot.PlotBarsdoublePtrInt,
                               Int8    => LibCImPlot.PlotBarsS8PtrInt,
                               UInt8   => LibCImPlot.PlotBarsU8PtrInt,
                               Int16   => LibCImPlot.PlotBarsS16PtrInt,
                               UInt16  => LibCImPlot.PlotBarsU16PtrInt,
                               Int32   => LibCImPlot.PlotBarsS32PtrInt,
                               UInt32  => LibCImPlot.PlotBarsU32PtrInt,
                               Int64   => LibCImPlot.PlotBarsS64PtrInt,
                               UInt64  => LibCImPlot.PlotBarsU64PtrInt)

const plot_bars_pointers = IdDict(Float32 => LibCImPlot.PlotBarsFloatPtrFloatPtr,
                                  Float64 => LibCImPlot.PlotBarsdoublePtrdoublePtr,
                                  Int8    => LibCImPlot.PlotBarsS8PtrS8Ptr,
                                  UInt8   => LibCImPlot.PlotBarsU8PtrU8Ptr,
                                  Int16   => LibCImPlot.PlotBarsS16PtrS16Ptr,
                                  UInt16  => LibCImPlot.PlotBarsU16PtrU16Ptr,
                                  Int32   => LibCImPlot.PlotBarsS32PtrS32Ptr,
                                  UInt32  => LibCImPlot.PlotBarsU32PtrU32Ptr,
                                  Int64   => LibCImPlot.PlotBarsS64PtrS64Ptr,
                                  UInt64  => LibCImPlot.PlotBarsU64PtrU64Ptr)

function PlotBars(values::Vector{T}; count::Integer = length(values),
                  label_id::String = "", width = 0.67, shift = 0.0, offset::Integer = 0,
                  stride::Integer = 1) where {T <: ImPlotData}

    plot_bars_count[T](label_id, values, Cint(count), Float64(width), Float64(shift),
                       Cint(offset), Cint(stride * sizeof(T)))
end

function PlotBars(values::Vector{T}; count::Integer = length(values),
                  label_id::String = "", width = 0.67, shift = 0.0, offset::Integer = 0,
                  stride::Integer = 1) where {T <: Real}

    LibCImPlot.PlotBarsdoublePtrInt(label_id, Float64.(values), Cint(count), Float64(width),
                                    Float64(shift), Cint(offset),
                                    Cint(stride * sizeof(Float64)))
end

function PlotBars(x::Vector{T}, y::Vector{T}; count::Integer = min(length(x),length(y)),
                  label_id::String = "", width = 0.67, offset::Integer = 0,
                  stride::Integer = 1) where {T <: ImPlotData}

    plot_bars_pointers[T](label_id, x, y, Cint(count), Float64(width), Cint(offset),
                          Cint(stride * sizeof(T)))
end

function PlotBars(x::Vector{T}, y::Vector{T};
                  count::Integer = min(length(x), length(y)), label_id::String = "",
                  width = 0.67, offset::Integer = 0, stride::Integer = 1) where {T <: Real}

    LibCImPlot.PlotBarsdoublePtrdoublePtr(label_id, Float64.(x), Float64.(y), Cint(count),
                                          Float64(width), Cint(offset),
                                          Cint(stride * sizeof(Float64)))
end

PlotBars(x::Vector{T1}, y::Vector{T2}; kwargs...) where {T1,T2} = PlotBars(promote(x, y)...; kwargs...)

# Horizontal bars

const plot_hbars_count = IdDict(Float32 => LibCImPlot.PlotBarsHFloatPtrInt,
                                Float64 => LibCImPlot.PlotBarsHdoublePtrInt,
                                Int8    => LibCImPlot.PlotBarsHS8PtrInt,
                                UInt8   => LibCImPlot.PlotBarsHU8PtrInt,
                                Int16   => LibCImPlot.PlotBarsHS16PtrInt,
                                UInt16  => LibCImPlot.PlotBarsHU16PtrInt,
                                Int32   => LibCImPlot.PlotBarsHS32PtrInt,
                                UInt32  => LibCImPlot.PlotBarsHU32PtrInt,
                                Int64   => LibCImPlot.PlotBarsHS64PtrInt,
                                UInt64  => LibCImPlot.PlotBarsHU64PtrInt)

const plot_hbars_pointers = IdDict(Float32 => LibCImPlot.PlotBarsHFloatPtrFloatPtr,
                                   Float64 => LibCImPlot.PlotBarsHdoublePtrdoublePtr,
                                   Int8    => LibCImPlot.PlotBarsHS8PtrS8Ptr,
                                   UInt8   => LibCImPlot.PlotBarsHU8PtrU8Ptr,
                                   Int16   => LibCImPlot.PlotBarsHS16PtrS16Ptr,
                                   UInt16  => LibCImPlot.PlotBarsHU16PtrU16Ptr,
                                   Int32   => LibCImPlot.PlotBarsHS32PtrS32Ptr,
                                   UInt32  => LibCImPlot.PlotBarsHU32PtrU32Ptr,
                                   Int64   => LibCImPlot.PlotBarsHS64PtrS64Ptr,
                                   UInt64  => LibCImPlot.PlotBarsHU64PtrU64Ptr)

function PlotBarsH(values::Vector{T}; count::Integer = length(values),
                  label_id::String = "", width = 0.67, shift = 0.0, offset::Integer = 0,
                  stride::Integer = 1) where {T <: ImPlotData}

    plot_hbars_count[T](label_id, values, Cint(count), Float64(width),
                                        Float64(shift), Cint(offset),
                                        Cint(stride * sizeof(T)))
end

function PlotBarsH(values::Vector{T}; count::Integer = length(values),
                  label_id::String = "", width = 0.67, shift = 0.0, offset::Integer = 0,
                  stride::Integer = 1) where {T <: Real}

    LibCImPlot.PlotBarsHdoublePtrInt(label_id, Float64.(values), Cint(count), Float64(width),
                                          Float64(shift), Cint(offset),
                                          Cint(stride * sizeof(Float64)))
end

function PlotBarsH(x::Vector{T}, y::Vector{T};
                  count::Integer = min(length(x),length(y)), label_id::String = "",
                  width = 0.67, offset::Integer = 0, stride::Integer = 1) where {T <: ImPlotData}
    plot_hbars_pointers[T](label_id, x, y, Cint(count), Float64(width), Cint(offset), Cint(stride * sizeof(Float32)))
end

function PlotBarsH(x::Vector{T}, y::Vector{T};
                  count::Integer = min(length(x), length(y)), label_id::String = "",
                  width = 0.67, offset::Integer = 0, stride::Integer = 1) where {T <: Real}

    LibCImPlot.PlotBarsHdoublePtrdoublePtr(label_id, Float64.(x), Float64.(y), Cint(count), Float64(width),
                                        Cint(offset), Cint(stride * sizeof(Float64)))
end

PlotBarsH(x::Vector{T1}, y::Vector{T2}; kwargs...) where {T1,T2} = PlotBarsH(promote(x, y)...; kwargs...)

