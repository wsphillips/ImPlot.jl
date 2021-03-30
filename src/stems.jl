const plot_stems_count = IdDict(Float32 => LibCImPlot.PlotStemsFloatPtrInt,
                               Float64 => LibCImPlot.PlotStemsdoublePtrInt,
                               Int8    => LibCImPlot.PlotStemsS8PtrInt,
                               UInt8   => LibCImPlot.PlotStemsU8PtrInt,
                               Int16   => LibCImPlot.PlotStemsS16PtrInt,
                               UInt16  => LibCImPlot.PlotStemsU16PtrInt,
                               Int32   => LibCImPlot.PlotStemsS32PtrInt,
                               UInt32  => LibCImPlot.PlotStemsU32PtrInt,
                               Int64   => LibCImPlot.PlotStemsS64PtrInt,
                               UInt64  => LibCImPlot.PlotStemsU64PtrInt)

const plot_stems_pointers = IdDict(Float32 => LibCImPlot.PlotStemsFloatPtrFloatPtr,
                                   Float64 => LibCImPlot.PlotStemsdoublePtrdoublePtr,
                                   Int8    => LibCImPlot.PlotStemsS8PtrS8Ptr,
                                   UInt8   => LibCImPlot.PlotStemsU8PtrU8Ptr,
                                   Int16   => LibCImPlot.PlotStemsS16PtrS16Ptr,
                                   UInt16  => LibCImPlot.PlotStemsU16PtrU16Ptr,
                                   Int32   => LibCImPlot.PlotStemsS32PtrS32Ptr,
                                   UInt32  => LibCImPlot.PlotStemsU32PtrU32Ptr,
                                   Int64   => LibCImPlot.PlotStemsS64PtrS64Ptr,
                                   UInt64  => LibCImPlot.PlotStemsU64PtrU64Ptr)

function PlotStems(values::Vector{T}; count::Integer = length(values), label_id::String = "",
                   y_ref = 0.0, xscale = 1.0, x0 = 0.0, offset::Integer = 0,
                   stride::Integer = 1) where {T <: ImPlotData}

    plot_stems_count[T](label_id, values, Cint(count), Float64(y_ref), Float64(xscale),
                        Float64(x0), Cint(offset), Cint(stride * sizeof(T)))
end

function PlotStems(values::Vector{T}; count::Integer = length(values),
                  label_id::String = "", y_ref = 0.0, xscale = 1.0, x0 = 0.0, offset::Integer = 0,
                  stride::Integer = 1) where {T <: Real}

    plot_stems_count[Float64](label_id, Float64.(values), Cint(count), Float64(y_ref),
                              Float64(xscale), Float64(x0), Cint(offset), Cint(stride * sizeof(Float64)))
end

function PlotStems(x::Vector{T}, y::Vector{T}; count::Integer = min(length(x),length(y)),
                  label_id::String = "", y_ref = 0.0, offset::Integer = 0,
                  stride::Integer = 1) where {T <: ImPlotData}

    plot_stems_pointers[T](label_id, x, y, Cint(count), Float64(y_ref), Cint(offset),
                           Cint(stride * sizeof(T)))
end

function PlotStems(x::Vector{T}, y::Vector{T}; count::Integer = min(length(x), length(y)),
                   label_id::String = "", y_ref = 0.0, offset::Integer = 0,
                   stride::Integer = 1) where {T <: Real}

    plot_stems_pointers[Float64](label_id, Float64.(x), Float64.(y), Cint(count),
                                 Float64(y_ref), Cint(offset), Cint(stride * sizeof(Float64)))
end

PlotStems(x::Vector{T1}, y::Vector{T2}; kwargs...) where {T1,T2} = PlotBars(promote(x, y)...; kwargs...)

