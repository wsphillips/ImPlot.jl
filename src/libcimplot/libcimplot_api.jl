# Julia wrapper for header: cimplot.h
# Automatically generated using Clang.jl

# Plot limits utils

function ImPlotLimits_ImPlotLimits()
    ccall((:ImPlotLimits_ImPlotLimits, libcimplot), Ptr{ImPlotLimits}, ())
end

function ImPlotLimits_destroy(self)
    ccall((:ImPlotLimits_destroy, libcimplot), Cvoid, (Ptr{ImPlotLimits},), self)
end

function ImPlotLimits_ContainsPlotPoInt(self, p)
    ccall((:ImPlotLimits_ContainsPlotPoInt, libcimplot), Bool,
          (Ptr{ImPlotLimits}, ImPlotPoint), self, p)
end

function ImPlotLimits_Containsdouble(self, x, y)
    ccall((:ImPlotLimits_Containsdouble, libcimplot), Bool,
          (Ptr{ImPlotLimits}, Cdouble, Cdouble), self, x, y)
end

function ImPlotStyle_ImPlotStyle()
    ccall((:ImPlotStyle_ImPlotStyle, libcimplot), Ptr{ImPlotStyle}, ())
end

function ImPlotStyle_destroy(self)
    ccall((:ImPlotStyle_destroy, libcimplot), Cvoid, (Ptr{ImPlotStyle},), self)
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

function PlotLineFloatPtrInt(label_id, values, count, offset, stride)
    ccall((:ImPlot_PlotLineFloatPtrInt, libcimplot), Cvoid,
          (Cstring, Ptr{Cfloat}, Cint, Cint, Cint),
          label_id, values, count, offset, stride)
end

function PlotLinedoublePtrInt(label_id, values, count, offset, stride)
    ccall((:ImPlot_PlotLinedoublePtrInt, libcimplot), Cvoid,
          (Cstring, Ptr{Cdouble}, Cint, Cint, Cint),
          label_id, values, count, offset, stride)
end

function PlotLineFloatPtrFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineFloatPtrFloatPtr, libcimplot), Cvoid,
          (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint),
          label_id, xs, ys, count, offset, stride)
end

function PlotLinedoublePtrdoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLinedoublePtrdoublePtr, libcimplot), Cvoid,
          (Cstring, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint),
          label_id, xs, ys, count, offset, stride)
end

function PlotLineVec2Ptr(label_id, data, count, offset)
    ccall((:ImPlot_PlotLineVec2Ptr, libcimplot), Cvoid,
          (Cstring, Ptr{Cint}, Cint, Cint),
          label_id, data, count, offset)
end

function PlotLinePlotPoIntPtr(label_id, data, count, offset)
    ccall((:ImPlot_PlotLinePlotPoIntPtr, libcimplot), Cvoid,
          (Cstring, Ptr{ImPlotPoint}, Cint, Cint),
          label_id, data, count, offset)
end

function PlotLineFnPlotPoIntPtr(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotLineFnPlotPoIntPtr, libcimplot), Cvoid,
          (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint),
          label_id, getter, data, count, offset)
end

# Scatter plots

function PlotScatterFloatPtrInt(label_id, values, count, offset, stride)
    ccall((:ImPlot_PlotScatterFloatPtrInt, libcimplot), Cvoid,
          (Cstring, Ptr{Cfloat}, Cint, Cint, Cint),
          label_id, values, count, offset, stride)
end

function PlotScatterdoublePtrInt(label_id, values, count, offset, stride)
    ccall((:ImPlot_PlotScatterdoublePtrInt, libcimplot), Cvoid,
          (Cstring, Ptr{Cdouble}, Cint, Cint, Cint),
          label_id, values, count, offset, stride)
end

function PlotScatterFloatPtrFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterFloatPtrFloatPtr, libcimplot), Cvoid,
          (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint),
          label_id, xs, ys, count, offset, stride)
end

function PlotScatterdoublePtrdoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterdoublePtrdoublePtr, libcimplot), Cvoid,
          (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint),
          label_id, xs, ys, count, offset, stride)
end

function PlotScatterVec2Ptr(label_id, data, count, offset)
    ccall((:ImPlot_PlotScatterVec2Ptr, libcimplot), Cvoid,
          (Cstring, Ptr{Cint}, Cint, Cint),
          label_id, data, count, offset)
end

function PlotScatterPlotPoIntPtr(label_id, data, count, offset)
    ccall((:ImPlot_PlotScatterPlotPoIntPtr, libcimplot), Cvoid,
          (Cstring, Ptr{ImPlotPoint}, Cint, Cint), label_id, data, count, offset)
end

function PlotScatterFnPlotPoIntPtr(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotScatterFnPlotPoIntPtr, libcimplot), Cvoid,
          (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint),
          label_id, getter, data, count, offset)
end

# Bar plots

function PlotBarsFloatPtrIntFloat(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsFloatPtrIntFloat, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cfloat, Cfloat, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsdoublePtrIntdouble(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsdoublePtrIntdouble, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBarsFloatPtrFloatPtr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cfloat, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsdoublePtrdoublePtr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsFnPlotPoIntPtr(label_id, getter, data, count, width, offset)
    ccall((:ImPlot_PlotBarsFnPlotPoIntPtr, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, width, offset)
end

function PlotBarsHFloatPtrIntFloat(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHFloatPtrIntFloat, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cfloat, Cfloat, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHdoublePtrIntdouble(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHdoublePtrIntdouble, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsHFloatPtrFloatPtr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cfloat, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsHdoublePtrdoublePtr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsHFnPlotPoIntPtr(label_id, getter, data, count, height, offset)
    ccall((:ImPlot_PlotBarsHFnPlotPoIntPtr, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, height, offset)
end

# Error bar plotting

function PlotErrorBarsFloatPtrFloatPtrFloatPtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsdoublePtrdoublePtrdoublePtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

# Pie charts

function PlotPieChartFloatPtr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartFloatPtr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cfloat}, Cint, Cfloat, Cfloat, Cfloat, Bool, Cstring, Cfloat), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChartdoublePtr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartdoublePtr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

# Heat maps

function PlotHeatmapFloatPtr(label_id, values, rows, cols, scale_min, scale_max, label_fmt,
                             bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapFloatPtr, libcimplot), Cvoid,
          (Cstring, Ref{Cfloat}, Cint, Cint, Cfloat, Cfloat, Cstring, ImPlotPoint, ImPlotPoint),
          label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmapdoublePtr(label_id, values, rows, cols, scale_min, scale_max, label_fmt,
                              bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapdoublePtr, libcimplot), Cvoid,
          (Cstring, Ref{Cdouble}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint),
          label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

# Digital signal plots

function PlotDigitalFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigitaldoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitaldoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigitalFnPlotPoIntPtr(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotDigitalFnPlotPoIntPtr, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

# Text labels for plots; the text is placed at the coordinates x, y

function PlotTextFloat(text, x, y, vertical, pixel_offset)
    ccall((:ImPlot_PlotTextFloat, libcimplot), Cvoid,
          (Cstring, Cfloat, Cfloat, Bool, Cint),
          text, x, y, vertical, pixel_offset)
end

function PlotTextdouble(text, x, y, vertical, pixel_offset)
    ccall((:ImPlot_PlotTextdouble, libcimplot), Cvoid,
          (Cstring, Cdouble, Cdouble, Bool, Cint),
          text, x, y, vertical, pixel_offset)
end

# Plot interaction

function IsPlotHovered()
    ccall((:ImPlot_IsPlotHovered, libcimplot), Bool, ())
end

function GetPlotMousePos(y_axis)
    ccall((:ImPlot_GetPlotMousePos, libcimplot), ImPlotPoint, (Cint,), y_axis)
end

function GetPlotLimits(y_axis)
    ccall((:ImPlot_GetPlotLimits, libcimplot), ImPlotLimits, (Cint,), y_axis)
end

function IsPlotQueried()
    ccall((:ImPlot_IsPlotQueried, libcimplot), Bool, ())
end

function GetPlotQuery(y_axis)
    ccall((:ImPlot_GetPlotQuery, libcimplot), ImPlotLimits, (Cint,), y_axis)
end

# Plot styling

function GetStyle()
    ccall((:ImPlot_GetStyle, libcimplot), Ptr{ImPlotStyle}, ())
end

function PushStyleColorU32(idx, col)
    ccall((:ImPlot_PushStyleColorU32, libcimplot), Cvoid, (ImPlotCol, Cint), idx, col)
end

function PushStyleColorVec4(idx, col)
    ccall((:ImPlot_PushStyleColorVec4, libcimplot), Cvoid, (ImPlotCol, Cint), idx, col)
end

function PopStyleColor(count)
    ccall((:ImPlot_PopStyleColor, libcimplot), Cvoid, (Cint,), count)
end

function PushStyleVarFloat(idx, val)
    ccall((:ImPlot_PushStyleVarFloat, libcimplot), Cvoid, (ImPlotStyleVar, Cfloat), idx, val)
end

function PushStyleVarInt(idx, val)
    ccall((:ImPlot_PushStyleVarInt, libcimplot), Cvoid, (ImPlotStyleVar, Cint), idx, val)
end

function PopStyleVar(count)
    ccall((:ImPlot_PopStyleVar, libcimplot), Cvoid, (Cint,), count)
end

# Color mapping

function SetColormapPlotColormap(colormap, samples)
    ccall((:ImPlot_SetColormapPlotColormap, libcimplot), Cvoid, (ImPlotColormap, Cint), colormap, samples)
end

function SetColormapVec4Ptr(colors, num_colors)
    ccall((:ImPlot_SetColormapVec4Ptr, libcimplot), Cvoid, (Ptr{Cint}, Cint), colors, num_colors)
end

function GetColormapSize()
    ccall((:ImPlot_GetColormapSize, libcimplot), Cint, ())
end

function GetColormapColor(pOut, index)
    ccall((:ImPlot_GetColormapColor, libcimplot), Cvoid, (Ptr{Cint}, Cint), pOut, index)
end

function LerpColormap(pOut, t)
    ccall((:ImPlot_LerpColormap, libcimplot), Cvoid, (Ptr{Cint}, Cfloat), pOut, t)
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

# Formatting

function SetNextPlotTicksXdoublePtr(values, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdoublePtr, libcimplot), Cvoid,
          (Ptr{Cdouble}, Cint, Ptr{Cstring}, Bool),
          values, n_ticks, labels, show_default)
end

function SetNextPlotTicksXdouble(x_min, x_max, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdouble, libcimplot), Cvoid,
          (Cdouble, Cdouble, Cint, Ptr{Cstring}, Bool),
          x_min, x_max, n_ticks, labels, show_default)
end

function SetNextPlotTicksYdoublePtr(values, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdoublePtr, libcimplot), Cvoid,
          (Ptr{Cdouble}, Cint, Ptr{Cstring}, Bool, Cint),
          values, n_ticks, labels, show_default, y_axis)
end

function SetNextPlotTicksYdouble(y_min, y_max, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdouble, libcimplot), Cvoid,
          (Cdouble, Cdouble, Cint, Ptr{Cstring}, Bool, Cint),
          y_min, y_max, n_ticks, labels, show_default, y_axis)
end

# Selects the Y axis to which the next plot should be bound. y_axis = 0 = y1 ...
function SetPlotYAxis(y_axis)
    ccall((:ImPlot_SetPlotYAxis, libcimplot), Cvoid, (Cint,), y_axis)
end

function GetPlotPos(pOut)
    ccall((:ImPlot_GetPlotPos, libcimplot), Cvoid, (Ptr{Cint},), pOut)
end

function GetPlotSize(pOut)
    ccall((:ImPlot_GetPlotSize, libcimplot), Cvoid, (Ptr{Cint},), pOut)
end

function PixelsToPlot(pix, y_axis)
    ccall((:ImPlot_PixelsToPlot, libcimplot), ImPlotPoint, (Cint, Cint), pix, y_axis)
end

function PlotToPixels(pOut, plt, y_axis)
    ccall((:ImPlot_PlotToPixels, libcimplot), Cvoid, (Ptr{Cint}, ImPlotPoint, Cint), pOut, plt, y_axis)
end

function ShowColormapScale(scale_min, scale_max, height)
    ccall((:ImPlot_ShowColormapScale, libcimplot), Cvoid, (Cdouble, Cdouble, Cfloat), scale_min, scale_max, height)
end

function PushPlotClipRect()
    ccall((:ImPlot_PushPlotClipRect, libcimplot), Cvoid, ())
end

function PopPlotClipRect()
    ccall((:ImPlot_PopPlotClipRect, libcimplot), Cvoid, ())
end

# Pre-made demo of ImPlot widgets

function ShowDemoWindow(p_open)
    ccall((:ImPlot_ShowDemoWindow, libcimplot), Cvoid, (Ptr{Bool},), p_open)
end

# Below are object methods that are exposed from C++ but they're so basic we could just do
# all of it from julia with constructors/type field defaults, and one or two functions

# Plot point C++ object method exposure
function ImPlotPoint_ImPlotPointNil()
    ccall((:ImPlotPoint_ImPlotPointNil, libcimplot), Ptr{ImPlotPoint}, ())
end

function ImPlotPoint_destroy(self)
    ccall((:ImPlotPoint_destroy, libcimplot), Cvoid, (Ptr{ImPlotPoint},), self)
end
# Initializes a point with x,y = 0.0,0.0
function ImPlotPoint_ImPlotPointdouble(_x, _y)
    ccall((:ImPlotPoint_ImPlotPointdouble, libcimplot), Ptr{ImPlotPoint}, (Cdouble, Cdouble), _x, _y)
end

# Plot range C++ object method exposure
# This creates the object with initialized values. We can do this on our own.
function ImPlotRange_ImPlotRange()
    ccall((:ImPlotRange_ImPlotRange, libcimplot), Ptr{ImPlotRange}, ())
end

function ImPlotRange_destroy(self)
    ccall((:ImPlotRange_destroy, libcimplot), Cvoid, (Ptr{ImPlotRange},), self)
end

function ImPlotRange_Contains(self, value)
    ccall((:ImPlotRange_Contains, libcimplot), Bool, (Ptr{ImPlotRange}, Cdouble), self, value)
end

function ImPlotRange_Size(self)
    ccall((:ImPlotRange_Size, libcimplot), Cdouble, (Ptr{ImPlotRange},), self)
end

