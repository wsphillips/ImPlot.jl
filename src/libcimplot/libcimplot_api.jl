# Julia wrapper for header: cimplot.h
# Automatically generated using Clang.jl

# ImPlot Context management

function CreateContext()
    ccall((:ImPlot_CreateContext, libcimplot), Ptr{ImPlotContext}, ())
end

function DestroyContext(ctx)
    ccall((:ImPlot_DestroyContext, libcimplot), Cvoid, (Ptr{ImPlotContext},), ctx)
end

function GetCurrentContext()
    ccall((:ImPlot_GetCurrentContext, libcimplot), Ptr{ImPlotContext}, ())
end

function SetCurrentContext(ctx)
    ccall((:ImPlot_SetCurrentContext, libcimplot), Cvoid, (Ptr{ImPlotContext},), ctx)
end

# Plot creation

function BeginPlot(title_id, x_label, y_label, size,
                   flags, x_flags, y_flags, y2_flags, y3_flags)::Bool
    ccall((:ImPlot_BeginPlot, libcimplot), Bool,
          (Cstring, Cstring, Cstring, ImVec2,
           ImPlotFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags),
          title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags)
end

function EndPlot()
    ccall((:ImPlot_EndPlot, libcimplot), Cvoid, ())
end

# Line plots

# Array + integer count
function PlotLineFloatPtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineFloatPtrInt, libcimplot), Cvoid,
          (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint),
          label_id, values, count, xscale, x0, offset, stride)
end

function PlotLinedoublePtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLinedoublePtrInt, libcimplot), Cvoid,
        (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLineS8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cchar}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLineU8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cuchar}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLineS16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cshort}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLineU16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cushort}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLineS32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLineU32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLineS64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLineU64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

# Array x, array y
function PlotLineFloatPtrFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLinedoublePtrdoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLinedoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLineS8PtrS8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLineU8PtrU8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLineS16PtrS16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLineU16PtrU16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLineS32PtrS32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLineU32PtrU32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLineS64PtrS64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLineU64PtrU64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

# Plot Shaded

function PlotShadedFloatPtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedFloatPtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShadeddoublePtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadeddoublePtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShadedS8PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedS8PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShadedU8PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedU8PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShadedS16PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedS16PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShadedU16PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedU16PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShadedS32PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedS32PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShadedU32PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedU32PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShadedS64PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedS64PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShadedU64PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedU64PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShadedFloatPtrFloatPtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedFloatPtrFloatPtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShadeddoublePtrdoublePtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadeddoublePtrdoublePtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShadedS8PtrS8PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedS8PtrS8PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShadedU8PtrU8PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedU8PtrU8PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShadedS16PtrS16PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedS16PtrS16PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShadedU16PtrU16PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedU16PtrU16PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShadedS32PtrS32PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedS32PtrS32PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShadedU32PtrU32PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedU32PtrU32PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShadedS64PtrS64PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedS64PtrS64PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShadedU64PtrU64PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedU64PtrU64PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShadedFloatPtrFloatPtrFloatPtr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShadeddoublePtrdoublePtrdoublePtr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadeddoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShadedS8PtrS8PtrS8Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShadedU8PtrU8PtrU8Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShadedS16PtrS16PtrS16Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShadedU16PtrU16PtrU16Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShadedS32PtrS32PtrS32Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShadedU32PtrU32PtrU32Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShadedS64PtrS64PtrS64Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShadedU64PtrU64PtrU64Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

# Scatter plots
function PlotScatterFloatPtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatterdoublePtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatterS8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatterU8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatterS16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatterU16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatterS32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatterU32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatterS64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatterU64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatterFloatPtrFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatterdoublePtrdoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatterS8PtrS8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatterU8PtrU8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatterS16PtrS16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatterU16PtrU16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatterS32PtrS32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatterU32PtrU32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatterS64PtrS64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatterU64PtrU64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

# Stair plots

function PlotStairsFloatPtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairsdoublePtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairsS8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairsU8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairsS16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairsU16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairsS32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairsU32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairsS64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairsU64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairsFloatPtrFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsdoublePtrdoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsS8PtrS8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsU8PtrU8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsS16PtrS16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsU16PtrU16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsS32PtrS32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsU32PtrU32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsS64PtrS64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsU64PtrU64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsG(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotStairsG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

# Bar plots

function PlotBarsFloatPtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsdoublePtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsS8PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsU8PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsS16PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsU16PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsS32PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsU32PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsS64PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsU64PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsFloatPtrFloatPtr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsdoublePtrdoublePtr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsS8PtrS8Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsU8PtrU8Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsS16PtrS16Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsU16PtrU16Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsS32PtrS32Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsU32PtrU32Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsS64PtrS64Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsU64PtrU64Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsHFloatPtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHdoublePtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHS8PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHU8PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHS16PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHU16PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHS32PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHU32PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHS64PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHU64PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHFloatPtrFloatPtr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsHdoublePtrdoublePtr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsHS8PtrS8Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsHU8PtrU8Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsHS16PtrS16Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsHU16PtrU16Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsHS32PtrS32Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsHU32PtrU32Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsHS64PtrS64Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsHU64PtrU64Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

# Error bar plotting

function PlotErrorBarsFloatPtrFloatPtrFloatPtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsdoublePtrdoublePtrdoublePtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsS8PtrS8PtrS8PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS8PtrS8PtrS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsU8PtrU8PtrU8PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU8PtrU8PtrU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsS16PtrS16PtrS16PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS16PtrS16PtrS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsU16PtrU16PtrU16PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU16PtrU16PtrU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsS32PtrS32PtrS32PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS32PtrS32PtrS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsU32PtrU32PtrU32PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU32PtrU32PtrU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsS64PtrS64PtrS64PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS64PtrS64PtrS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsU64PtrU64PtrU64PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU64PtrU64PtrU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsS8PtrS8PtrS8PtrS8Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS8PtrS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsU8PtrU8PtrU8PtrU8Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU8PtrU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsS16PtrS16PtrS16PtrS16Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS16PtrS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsU16PtrU16PtrU16PtrU16Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU16PtrU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsS32PtrS32PtrS32PtrS32Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS32PtrS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsU32PtrU32PtrU32PtrU32Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU32PtrU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsS64PtrS64PtrS64PtrS64Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS64PtrS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsU64PtrU64PtrU64PtrU64Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU64PtrU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHS8PtrS8PtrS8PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS8PtrS8PtrS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHU8PtrU8PtrU8PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU8PtrU8PtrU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHS16PtrS16PtrS16PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS16PtrS16PtrS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHU16PtrU16PtrU16PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU16PtrU16PtrU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHS32PtrS32PtrS32PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS32PtrS32PtrS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHU32PtrU32PtrU32PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU32PtrU32PtrU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHS64PtrS64PtrS64PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS64PtrS64PtrS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHU64PtrU64PtrU64PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU64PtrU64PtrU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHS8PtrS8PtrS8PtrS8Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS8PtrS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHU8PtrU8PtrU8PtrU8Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU8PtrU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHS16PtrS16PtrS16PtrS16Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS16PtrS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHU16PtrU16PtrU16PtrU16Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU16PtrU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHS32PtrS32PtrS32PtrS32Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS32PtrS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHU32PtrU32PtrU32PtrU32Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU32PtrU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHS64PtrS64PtrS64PtrS64Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS64PtrS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHU64PtrU64PtrU64PtrU64Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU64PtrU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

# Plot stems

function PlotStemsFloatPtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStemsdoublePtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStemsS8PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStemsU8PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStemsS16PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStemsU16PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStemsS32PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStemsU32PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStemsS64PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStemsU64PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStemsFloatPtrFloatPtr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStemsdoublePtrdoublePtr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStemsS8PtrS8Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStemsU8PtrU8Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStemsS16PtrS16Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStemsU16PtrU16Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStemsS32PtrS32Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStemsU32PtrU32Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStemsS64PtrS64Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStemsU64PtrU64Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

# Pie charts

function PlotPieChartFloatPtr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartFloatPtr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChartdoublePtr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartdoublePtr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChartS8Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartS8Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChartU8Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartU8Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChartS16Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartS16Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChartU16Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartU16Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChartS32Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartS32Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChartU32Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartU32Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChartS64Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartS64Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChartU64Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartU64Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cint}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

# Heat maps

function PlotHeatmapFloatPtr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmapdoublePtr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmapS8Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmapU8Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmapS16Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmapU16Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmapS32Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmapU32Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmapS64Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmapU64Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

# Digital signal plots

function PlotDigitalFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigitaldoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitaldoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigitalS8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigitalU8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigitalS16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigitalU16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigitalS32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigitalU32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigitalS64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigitalU64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Ptr{Cint}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

# Text labels for plots; the text is placed at the coordinates x, y

function PlotImage(label_id, user_texture_id, bounds_min, bounds_max, uv0, uv1, tint_col)
    ccall((:ImPlot_PlotImage, libcimplot), Cvoid, (Cstring, Cint, ImPlotPoint, ImPlotPoint, Cint, Cint, Cint), label_id, user_texture_id, bounds_min, bounds_max, uv0, uv1, tint_col)
end

function PlotText(text, x, y, vertical, pix_offset)
    ccall((:ImPlot_PlotText, libcimplot), Cvoid, (Cstring, Cdouble, Cdouble, Bool, Cint), text, x, y, vertical, pix_offset)
end

function PlotDummy(label_id)
    ccall((:ImPlot_PlotDummy, libcimplot), Cvoid, (Cstring,), label_id)
end

# Plot limits

function SetNextPlotLimits(x_min, x_max, y_min, y_max, cond)
    ccall((:ImPlot_SetNextPlotLimits, libcimplot), Cvoid,
          (Cdouble, Cdouble, Cdouble, Cdouble, Cint),
          Float64(x_min), Float64(x_max), Float64(y_min), Float64(y_max), Cint(cond))
end

function SetNextPlotLimitsX(x_min, x_max, cond)
    ccall((:ImPlot_SetNextPlotLimitsX, libcimplot), Cvoid,
          (Cdouble, Cdouble, Cint),
          Float64(x_min), Float64(x_max), Cint(cond))
end

function SetNextPlotLimitsY(y_min, y_max, cond, y_axis)
    ccall((:ImPlot_SetNextPlotLimitsY, libcimplot), Cvoid,
          (Cdouble, Cdouble, Cint, Cint),
          Float64(y_min), Float64(y_max), Cint(cond), Cint(y_axis))
end

function SetNextPlotTicksXdoublePtr(values, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdoublePtr, libcimplot), Cvoid,
          (Ref{Cdouble}, Cint, Ref{Cstring}, Bool),
          values, n_ticks, labels, show_default)
end

function SetNextPlotTicksXdouble(x_min, x_max, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdouble, libcimplot), Cvoid,
          (Cdouble, Cdouble, Cint, Ref{Cstring}, Bool),
          x_min, x_max, n_ticks, labels, show_default)
end

function SetNextPlotTicksYdoublePtr(values, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdoublePtr, libcimplot), Cvoid,
          (Ref{Cdouble}, Cint, Ref{Cstring}, Bool, Cint),
          values, n_ticks, labels, show_default, y_axis)
end

function SetNextPlotTicksYdouble(y_min, y_max, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdouble, libcimplot), Cvoid,
          (Cdouble, Cdouble, Cint, Ref{Cstring}, Bool, Cint),
          y_min, y_max, n_ticks, labels, show_default, y_axis)
end

# Selects the Y axis to which the next plot should be bound. y_axis = 0 = y1 ...
function SetPlotYAxis(y_axis::Integer)
    ccall((:ImPlot_SetPlotYAxis, libcimplot), Cvoid, (Cint,), Cint(y_axis))
end

function HideNextItem(hidden, cond)
    ccall((:ImPlot_HideNextItem, libcimplot), Cvoid, (Bool, Cint), hidden, cond)
end

function PixelsToPlotVec2(pOut, pix, y_axis)
    ccall((:ImPlot_PixelsToPlotVec2, libcimplot), Cvoid, (Ptr{ImPlotPoint}, Cint, ImPlotYAxis), pOut, pix, y_axis)
end

function PixelsToPlotFloat(pOut, x, y, y_axis)
    ccall((:ImPlot_PixelsToPlotFloat, libcimplot), Cvoid, (Ptr{ImPlotPoint}, Cfloat, Cfloat, ImPlotYAxis), pOut, x, y, y_axis)
end

function PlotToPixelsPlotPoInt(pOut, plt, y_axis)
    ccall((:ImPlot_PlotToPixelsPlotPoInt, libcimplot), Cvoid, (Ptr{Cint}, ImPlotPoint, ImPlotYAxis), pOut, plt, y_axis)
end

function PlotToPixelsdouble(pOut, x, y, y_axis)
    ccall((:ImPlot_PlotToPixelsdouble, libcimplot), Cvoid, (Ptr{Cint}, Cdouble, Cdouble, ImPlotYAxis), pOut, x, y, y_axis)
end

function GetPlotPos(pOut)
    ccall((:ImPlot_GetPlotPos, libcimplot), Cvoid, (Ref{ImVec2},), pOut)
end

function GetPlotSize(pOut)
    ccall((:ImPlot_GetPlotSize, libcimplot), Cvoid, (Ref{ImVec2},), pOut)
end

# Plot interaction

function IsPlotHovered()
    ccall((:ImPlot_IsPlotHovered, libcimplot), Bool, ())
end

function IsPlotXAxisHovered()
    ccall((:ImPlot_IsPlotXAxisHovered, libcimplot), Bool, ())
end

function IsPlotYAxisHovered(y_axis)
    ccall((:ImPlot_IsPlotYAxisHovered, libcimplot), Bool, (Cint,), Cint(y_axis))
end

function GetPlotMousePos(y_axis)
    ccall((:ImPlot_GetPlotMousePos, libcimplot), ImPlotPoint, (Cint,), Cint(y_axis))
end

function GetPlotLimits(y_axis)
    ccall((:ImPlot_GetPlotLimits, libcimplot), ImPlotLimits, (Cint,), Cint(y_axis))
end

function IsPlotQueried()
    ccall((:ImPlot_IsPlotQueried, libcimplot), Bool, ())
end

function GetPlotQuery(y_axis)
    ccall((:ImPlot_GetPlotQuery, libcimplot), ImPlotLimits, (Cint,), Cint(y_axis))
end

function DragLineX(id, x_value, show_label, col, thickness)
    ccall((:ImPlot_DragLineX, libcimplot), Bool, (Cstring, Ptr{Cdouble}, Bool, Cint, Cfloat), id, x_value, show_label, col, thickness)
end

function DragLineY(id, y_value, show_label, col, thickness)
    ccall((:ImPlot_DragLineY, libcimplot), Bool, (Cstring, Ptr{Cdouble}, Bool, Cint, Cfloat), id, y_value, show_label, col, thickness)
end

function DragPoint(id, x, y, show_label, col, radius)
    ccall((:ImPlot_DragPoint, libcimplot), Bool, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Bool, Cint, Cfloat), id, x, y, show_label, col, radius)
end

function SetLegendLocation(location, orientation, outside)
    ccall((:ImPlot_SetLegendLocation, libcimplot), Cvoid, (ImPlotLocation, ImPlotOrientation, Bool), location, orientation, outside)
end

function SetMousePosLocation(location)
    ccall((:ImPlot_SetMousePosLocation, libcimplot), Cvoid, (ImPlotLocation,), location)
end


function IsLegendEntryHovered(label_id::String)
    ccall((:ImPlot_IsLegendEntryHovered, libcimplot), Bool, (Cstring,), label_id)
end

#=
function GetInputMap()
    ccall((:ImPlot_GetInputMap, libcimplot), Ref{ImPlotInputMap}, ())
end
=#

function BeginLegendDragDropSource(label_id, flags)
    ccall((:ImPlot_BeginLegendDragDropSource, libcimplot), Bool, (Cstring, Cint), label_id, flags)
end

function EndLegendDragDropSource()
    ccall((:ImPlot_EndLegendDragDropSource, libcimplot), Cvoid, ())
end

function BeginLegendPopup(label_id, mouse_button)
    ccall((:ImPlot_BeginLegendPopup, libcimplot), Bool, (Cstring, Cint), label_id, mouse_button)
end

function EndLegendPopup()
    ccall((:ImPlot_EndLegendPopup, libcimplot), Cvoid, ())
end


# Plot styling

function GetStyle()
    ccall((:ImPlot_GetStyle, libcimplot), Ref{ImPlotStyle}, ())
end

function StyleColorsAuto(dst)
    ccall((:ImPlot_StyleColorsAuto, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function StyleColorsClassic(dst)
    ccall((:ImPlot_StyleColorsClassic, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function StyleColorsDark(dst)
    ccall((:ImPlot_StyleColorsDark, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function StyleColorsLight(dst)
    ccall((:ImPlot_StyleColorsLight, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function PushStyleColorU32(idx, col)
    ccall((:ImPlot_PushStyleColorU32, libcimplot), Cvoid, (ImPlotCol, Cuint), idx, col)
end

function PushStyleColorVec4(idx, col)
    ccall((:ImPlot_PushStyleColorVec4, libcimplot), Cvoid, (ImPlotCol, ImVec4), idx, col)
end

function PopStyleColor(count::Integer = 1)
    ccall((:ImPlot_PopStyleColor, libcimplot), Cvoid, (Cint,), Cint(count))
end

function PushStyleVarFloat(idx, val)
    ccall((:ImPlot_PushStyleVarFloat, libcimplot), Cvoid, (ImPlotStyleVar, Cfloat), idx, val)
end

function PushStyleVarInt(idx, val)
    ccall((:ImPlot_PushStyleVarInt, libcimplot), Cvoid, (ImPlotStyleVar, Cint), idx, val)
end

function PushStyleVarVec2(idx, val)
    ccall((:ImPlot_PushStyleVarVec2, libcimplot), Cvoid, (ImPlotStyleVar, Cint), idx, val)
end

function PopStyleVar(count::Integer = 1)
    ccall((:ImPlot_PopStyleVar, libcimplot), Cvoid, (Cint,), Cint(count))
end

# Color mapping

function SetNextLineStyle(col, weight)
    ccall((:ImPlot_SetNextLineStyle, libcimplot), Cvoid, (Cint, Cfloat), col, weight)
end

function SetNextFillStyle(col, alpha_mod)
    ccall((:ImPlot_SetNextFillStyle, libcimplot), Cvoid, (Cint, Cfloat), col, alpha_mod)
end

function SetNextMarkerStyle(marker, size, fill, weight, outline)
    ccall((:ImPlot_SetNextMarkerStyle, libcimplot), Cvoid, (ImPlotMarker, Cfloat, Cint, Cfloat, Cint), marker, size, fill, weight, outline)
end

function SetNextErrorBarStyle(col, size, weight)
    ccall((:ImPlot_SetNextErrorBarStyle, libcimplot), Cvoid, (Cint, Cfloat, Cfloat), col, size, weight)
end

function GetLastItemColor(pOut)
    ccall((:ImPlot_GetLastItemColor, libcimplot), Cvoid, (Ptr{Cint},), pOut)
end

function GetStyleColorName(idx)
    ccall((:ImPlot_GetStyleColorName, libcimplot), Cstring, (ImPlotCol,), idx)
end

function GetMarkerName(idx)
    ccall((:ImPlot_GetMarkerName, libcimplot), Cstring, (ImPlotMarker,), idx)
end

function PushColormapPlotColormap(colormap)
    ccall((:ImPlot_PushColormapPlotColormap, libcimplot), Cvoid, (ImPlotColormap,), colormap)
end

function PushColormapVec4Ptr(colormap, size)
    ccall((:ImPlot_PushColormapVec4Ptr, libcimplot), Cvoid, (Ptr{Cint}, Cint), colormap, size)
end

function PopColormap(count)
    ccall((:ImPlot_PopColormap, libcimplot), Cvoid, (Cint,), count)
end


function SetColormapPlotColormap(colormap, samples)
    ccall((:ImPlot_SetColormapPlotColormap, libcimplot), Cvoid,
          (ImPlotColormap, Cint),
          colormap, samples)
end

function SetColormapVec4Ptr(colors, num_colors)
    ccall((:ImPlot_SetColormapVec4Ptr, libcimplot), Cvoid,
          (ImVec4, Cint),
          colors, num_colors)
end

function GetColormapSize()
    ccall((:ImPlot_GetColormapSize, libcimplot), Cint, ())
end

function GetColormapColor(pOut, index)
    ccall((:ImPlot_GetColormapColor, libcimplot), Cvoid, (Ref{ImVec4}, Cint), pOut, index)
end

function LerpColormap(pOut, t)
    ccall((:ImPlot_LerpColormap, libcimplot), Cvoid, (Ref{ImVec4}, Cfloat), pOut, t)
end

function NextColormapColor(pOut)
    ccall((:ImPlot_NextColormapColor, libcimplot), Cvoid, (Ptr{Cint},), pOut)
end

function ShowColormapScale(scale_min, scale_max, height)
    ccall((:ImPlot_ShowColormapScale, libcimplot), Cvoid, (Cdouble, Cdouble, Cfloat), scale_min, scale_max, height)
end

function GetColormapName(colormap)
    ccall((:ImPlot_GetColormapName, libcimplot), Cstring, (ImPlotColormap,), colormap)
end

function GetInputMap()
    ccall((:ImPlot_GetInputMap, libcimplot), Ptr{ImPlotInputMap}, ())
end

function GetPlotDrawList()
    ccall((:ImPlot_GetPlotDrawList, libcimplot), Ptr{Cint}, ())
end

function PushPlotClipRect()
    ccall((:ImPlot_PushPlotClipRect, libcimplot), Cvoid, ())
end

function PopPlotClipRect()
    ccall((:ImPlot_PopPlotClipRect, libcimplot), Cvoid, ())
end

function ShowStyleSelector(label)
    ccall((:ImPlot_ShowStyleSelector, libcimplot), Bool, (Cstring,), label)
end

function ShowColormapSelector(label)
    ccall((:ImPlot_ShowColormapSelector, libcimplot), Bool, (Cstring,), label)
end

function ShowStyleEditor(ref)
    ccall((:ImPlot_ShowStyleEditor, libcimplot), Cvoid, (Ptr{ImPlotStyle},), ref)
end

function ShowUserGuide()
    ccall((:ImPlot_ShowUserGuide, libcimplot), Cvoid, ())
end

function ShowMetricsWindow(p_popen)
    ccall((:ImPlot_ShowMetricsWindow, libcimplot), Cvoid, (Ptr{Bool},), p_popen)
end

function SetImGuiContext(ctx)
    ccall((:ImPlot_SetImGuiContext, libcimplot), Cvoid, (Ptr{Cint},), ctx)
end

function ShowDemoWindow(p_open)
    ccall((:ImPlot_ShowDemoWindow, libcimplot), Cvoid, (Ptr{Bool},), p_open)
end

# Getters

function PlotLineG(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotLineG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function PlotScatterG(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotScatterG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function PlotShadedG(label_id, getter1, data1, getter2, data2, count, offset)
    ccall((:ImPlot_PlotShadedG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter1, data1, getter2, data2, count, offset)
end

function PlotBarsG(label_id, getter, data, count, width, offset)
    ccall((:ImPlot_PlotBarsG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, width, offset)
end

function PlotBarsHG(label_id, getter, data, count, height, offset)
    ccall((:ImPlot_PlotBarsHG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, height, offset)
end

function PlotDigitalG(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotDigitalG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

##

function ImPlotPoint_ImPlotPointNil()
    ccall((:ImPlotPoint_ImPlotPointNil, libcimplot), Ptr{ImPlotPoint}, ())
end

function ImPlotPoint_destroy(self)
    ccall((:ImPlotPoint_destroy, libcimplot), Cvoid, (Ptr{ImPlotPoint},), self)
end

function ImPlotPoint_ImPlotPointdouble(_x, _y)
    ccall((:ImPlotPoint_ImPlotPointdouble, libcimplot), Ptr{ImPlotPoint}, (Cdouble, Cdouble), _x, _y)
end

function ImPlotPoint_ImPlotPointVec2(p)
    ccall((:ImPlotPoint_ImPlotPointVec2, libcimplot), Ptr{ImPlotPoint}, (Cint,), p)
end

function ImPlotRange_ImPlotRangeNil()
    ccall((:ImPlotRange_ImPlotRangeNil, libcimplot), Ptr{ImPlotRange}, ())
end

function ImPlotRange_destroy(self)
    ccall((:ImPlotRange_destroy, libcimplot), Cvoid, (Ptr{ImPlotRange},), self)
end

function ImPlotRange_ImPlotRangedouble(_min, _max)
    ccall((:ImPlotRange_ImPlotRangedouble, libcimplot), Ptr{ImPlotRange}, (Cdouble, Cdouble), _min, _max)
end

function ImPlotRange_Contains(self, value)
    ccall((:ImPlotRange_Contains, libcimplot), Bool, (Ptr{ImPlotRange}, Cdouble), self, value)
end

function ImPlotRange_Size(self)
    ccall((:ImPlotRange_Size, libcimplot), Cdouble, (Ptr{ImPlotRange},), self)
end

function ImPlotLimits_ContainsPlotPoInt(self, p)
    ccall((:ImPlotLimits_ContainsPlotPoInt, libcimplot), Bool, (Ptr{ImPlotLimits}, ImPlotPoint), self, p)
end

function ImPlotLimits_Containsdouble(self, x, y)
    ccall((:ImPlotLimits_Containsdouble, libcimplot), Bool, (Ptr{ImPlotLimits}, Cdouble, Cdouble), self, x, y)
end

function ImPlotStyle_ImPlotStyle()
    ccall((:ImPlotStyle_ImPlotStyle, libcimplot), Ptr{ImPlotStyle}, ())
end

function ImPlotStyle_destroy(self)
    ccall((:ImPlotStyle_destroy, libcimplot), Cvoid, (Ptr{ImPlotStyle},), self)
end

function ImPlotInputMap_ImPlotInputMap()
    ccall((:ImPlotInputMap_ImPlotInputMap, libcimplot), Ptr{ImPlotInputMap}, ())
end

function ImPlotInputMap_destroy(self)
    ccall((:ImPlotInputMap_destroy, libcimplot), Cvoid, (Ptr{ImPlotInputMap},), self)
end


