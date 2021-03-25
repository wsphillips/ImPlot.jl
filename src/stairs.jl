# Stairs plots

#=
maybe a macro will handle this?..

    PlotStairsFloatPtrInt
    PlotStairsdoublePtrInt
    PlotStairsS8PtrInt
    PlotStairsU8PtrInt
    PlotStairsS16PtrInt
    PlotStairsU16PtrInt
    PlotStairsS32PtrInt
    PlotStairsU32PtrInt
    PlotStairsS64PtrInt
    PlotStairsU64PtrInt

    PlotStairsFloatPtrFloatPtr
    PlotStairsdoublePtrdoublePtr
    PlotStairsS8PtrS8Ptr
    PlotStairsU8PtrU8Ptr
    PlotStairsS16PtrS16Ptr
    PlotStairsU16PtrU16Ptr
    PlotStairsS32PtrS32Ptr
    PlotStairsU32PtrU32Ptr
    PlotStairsS64PtrS64Ptr
    PlotStairsU64PtrU64Ptr

    PlotStairsG
=#

function PlotStairs(y::AbstractArray{T,1}; 
    label::String="", 
    count::Integer=length(y),
    xscale::Real = 1.0, x0::Real = 0.0,
    offset::Integer=0,
    stride::Integer=1
) where {T}

    T_ = eltype(y)
    if T_ == Float32
        fcn = LibCImPlot.PlotStairsFloatPtrInt
    elseif T_ == Float64
        fcn = LibCImPlot.PlotStairsdoublePtrInt
    elseif T_ == Int32
        fcn = LibCImPlot.PlotStairsS32PtrInt
    elseif T_ == Int64
        fcn = LibCImPlot.PlotStairsS64PtrInt
    else
        T_ = Float64
        y = convert.(T_, y)
        fcn = LibCImPlot.PlotStairsdoublePtrInt
    end

    fcn(label, y, Cint(count), T_(xscale), T_(x0), Cint(offset), Cint(stride * sizeof(T_)))
end

function PlotStairs(x::AbstractArray{T,1}, y::AbstractArray{T,1};
    count::Integer = min(length(x), length(y)),
    offset::Integer = 0, 
    stride::Integer = 1,
    label::String = ""
) where {T}

    T_ = eltype(y)
    if T_ == Int64
        fcn = LibCImPlot.PlotStairsS64PtrS64Ptr
    elseif T_ == Int32
        fcn = LibCImPlot.PlotStairsS32PtrS32Ptr
    elseif T_ == Float64
        fcn = LibCImPlot.PlotStairsdoublePtrdoublePtr
    elseif T_ == Float32
        fcn = LibCImPlot.PlotStairsFloatPtrFloatPtr
    else
        T_ = Float64
        x = convert.(T_, x)
        y = convert.(T_, y)
        fcn = LibCImPlot.PlotStairsdoublePtrdoublePtr
    end

    fcn(label, x, y, Cint(count), Cint(offset), Cint(stride * sizeof(T_)))
end