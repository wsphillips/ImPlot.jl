# Julia wrapper for header: cimplot.h
# Automatically generated using Clang.jl


function ImPlotPoint_ImPlotPointNil()
    ccall((:ImPlotPoint_ImPlotPointNil, libcimplot), Ptr{ImPlotPoint}, ())
end

function ImPlotPoint_destroy(self)
    ccall((:ImPlotPoint_destroy, libcimplot), Cvoid, (Ptr{ImPlotPoint},), self)
end

function ImPlotPoint_ImPlotPointdouble(_x, _y)
    ccall((:ImPlotPoint_ImPlotPointdouble, libcimplot), Ptr{ImPlotPoint}, (Cdouble, Cdouble), _x, _y)
end

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

function ImPlotLimits_ImPlotLimits()
    ccall((:ImPlotLimits_ImPlotLimits, libcimplot), Ptr{ImPlotLimits}, ())
end

function ImPlotLimits_destroy(self)
    ccall((:ImPlotLimits_destroy, libcimplot), Cvoid, (Ptr{ImPlotLimits},), self)
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

function ImPlot_BeginPlot(title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags)
    ccall((:ImPlot_BeginPlot, libcimplot), Bool, (Cstring, Cstring, Cstring, Cint, ImPlotFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags), title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags)
end

function ImPlot_EndPlot()
    ccall((:ImPlot_EndPlot, libcimplot), Cvoid, ())
end

function ImPlot_PlotLineFloatPtrInt(label_id, values, count, offset, stride)
    ccall((:ImPlot_PlotLineFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cint, Cint), label_id, values, count, offset, stride)
end

function ImPlot_PlotLinedoublePtrInt(label_id, values, count, offset, stride)
    ccall((:ImPlot_PlotLinedoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cint, Cint), label_id, values, count, offset, stride)
end

function ImPlot_PlotLineFloatPtrFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotLinedoublePtrdoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLinedoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotLineVec2Ptr(label_id, data, count, offset)
    ccall((:ImPlot_PlotLineVec2Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint), label_id, data, count, offset)
end

function ImPlot_PlotLinePlotPoIntPtr(label_id, data, count, offset)
    ccall((:ImPlot_PlotLinePlotPoIntPtr, libcimplot), Cvoid, (Cstring, Ptr{ImPlotPoint}, Cint, Cint), label_id, data, count, offset)
end

function ImPlot_PlotLineFnPlotPoIntPtr(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotLineFnPlotPoIntPtr, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function ImPlot_PlotScatterFloatPtrInt(label_id, values, count, offset, stride)
    ccall((:ImPlot_PlotScatterFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cint, Cint), label_id, values, count, offset, stride)
end

function ImPlot_PlotScatterdoublePtrInt(label_id, values, count, offset, stride)
    ccall((:ImPlot_PlotScatterdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cint, Cint), label_id, values, count, offset, stride)
end

function ImPlot_PlotScatterFloatPtrFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterdoublePtrdoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterVec2Ptr(label_id, data, count, offset)
    ccall((:ImPlot_PlotScatterVec2Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint), label_id, data, count, offset)
end

function ImPlot_PlotScatterPlotPoIntPtr(label_id, data, count, offset)
    ccall((:ImPlot_PlotScatterPlotPoIntPtr, libcimplot), Cvoid, (Cstring, Ptr{ImPlotPoint}, Cint, Cint), label_id, data, count, offset)
end

function ImPlot_PlotScatterFnPlotPoIntPtr(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotScatterFnPlotPoIntPtr, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function ImPlot_PlotBarsFloatPtrIntFloat(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsFloatPtrIntFloat, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cfloat, Cfloat, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsdoublePtrIntdouble(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsdoublePtrIntdouble, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsFloatPtrFloatPtr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cfloat, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsdoublePtrdoublePtr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsFnPlotPoIntPtr(label_id, getter, data, count, width, offset)
    ccall((:ImPlot_PlotBarsFnPlotPoIntPtr, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, width, offset)
end

function ImPlot_PlotBarsHFloatPtrIntFloat(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHFloatPtrIntFloat, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cfloat, Cfloat, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHdoublePtrIntdouble(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHdoublePtrIntdouble, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHFloatPtrFloatPtr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cfloat, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotBarsHdoublePtrdoublePtr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotBarsHFnPlotPoIntPtr(label_id, getter, data, count, height, offset)
    ccall((:ImPlot_PlotBarsHFnPlotPoIntPtr, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, height, offset)
end

function ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotPieChartFloatPtr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartFloatPtr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cfloat}, Cint, Cfloat, Cfloat, Cfloat, Bool, Cstring, Cfloat), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotPieChartdoublePtr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartdoublePtr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotHeatmapFloatPtr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cint, Cfloat, Cfloat, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotHeatmapdoublePtr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotDigitalFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotDigitaldoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitaldoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotDigitalFnPlotPoIntPtr(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotDigitalFnPlotPoIntPtr, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function ImPlot_PlotTextFloat(text, x, y, vertical, pixel_offset)
    ccall((:ImPlot_PlotTextFloat, libcimplot), Cvoid, (Cstring, Cfloat, Cfloat, Bool, Cint), text, x, y, vertical, pixel_offset)
end

function ImPlot_PlotTextdouble(text, x, y, vertical, pixel_offset)
    ccall((:ImPlot_PlotTextdouble, libcimplot), Cvoid, (Cstring, Cdouble, Cdouble, Bool, Cint), text, x, y, vertical, pixel_offset)
end

function ImPlot_IsPlotHovered()
    ccall((:ImPlot_IsPlotHovered, libcimplot), Bool, ())
end

function ImPlot_GetPlotMousePos(y_axis)
    ccall((:ImPlot_GetPlotMousePos, libcimplot), ImPlotPoint, (Cint,), y_axis)
end

function ImPlot_GetPlotLimits(y_axis)
    ccall((:ImPlot_GetPlotLimits, libcimplot), ImPlotLimits, (Cint,), y_axis)
end

function ImPlot_IsPlotQueried()
    ccall((:ImPlot_IsPlotQueried, libcimplot), Bool, ())
end

function ImPlot_GetPlotQuery(y_axis)
    ccall((:ImPlot_GetPlotQuery, libcimplot), ImPlotLimits, (Cint,), y_axis)
end

function ImPlot_GetStyle()
    ccall((:ImPlot_GetStyle, libcimplot), Ptr{ImPlotStyle}, ())
end

function ImPlot_PushStyleColorU32(idx, col)
    ccall((:ImPlot_PushStyleColorU32, libcimplot), Cvoid, (ImPlotCol, Cint), idx, col)
end

function ImPlot_PushStyleColorVec4(idx, col)
    ccall((:ImPlot_PushStyleColorVec4, libcimplot), Cvoid, (ImPlotCol, Cint), idx, col)
end

function ImPlot_PopStyleColor(count)
    ccall((:ImPlot_PopStyleColor, libcimplot), Cvoid, (Cint,), count)
end

function ImPlot_PushStyleVarFloat(idx, val)
    ccall((:ImPlot_PushStyleVarFloat, libcimplot), Cvoid, (ImPlotStyleVar, Cfloat), idx, val)
end

function ImPlot_PushStyleVarInt(idx, val)
    ccall((:ImPlot_PushStyleVarInt, libcimplot), Cvoid, (ImPlotStyleVar, Cint), idx, val)
end

function ImPlot_PopStyleVar(count)
    ccall((:ImPlot_PopStyleVar, libcimplot), Cvoid, (Cint,), count)
end

function ImPlot_SetColormapPlotColormap(colormap, samples)
    ccall((:ImPlot_SetColormapPlotColormap, libcimplot), Cvoid, (ImPlotColormap, Cint), colormap, samples)
end

function ImPlot_SetColormapVec4Ptr(colors, num_colors)
    ccall((:ImPlot_SetColormapVec4Ptr, libcimplot), Cvoid, (Ptr{Cint}, Cint), colors, num_colors)
end

function ImPlot_GetColormapSize()
    ccall((:ImPlot_GetColormapSize, libcimplot), Cint, ())
end

function ImPlot_GetColormapColor(pOut, index)
    ccall((:ImPlot_GetColormapColor, libcimplot), Cvoid, (Ptr{Cint}, Cint), pOut, index)
end

function ImPlot_LerpColormap(pOut, t)
    ccall((:ImPlot_LerpColormap, libcimplot), Cvoid, (Ptr{Cint}, Cfloat), pOut, t)
end

function ImPlot_SetNextPlotLimits(x_min, x_max, y_min, y_max, cond)
    ccall((:ImPlot_SetNextPlotLimits, libcimplot), Cvoid, (Cdouble, Cdouble, Cdouble, Cdouble, Cint), x_min, x_max, y_min, y_max, cond)
end

function ImPlot_SetNextPlotLimitsX(x_min, x_max, cond)
    ccall((:ImPlot_SetNextPlotLimitsX, libcimplot), Cvoid, (Cdouble, Cdouble, Cint), x_min, x_max, cond)
end

function ImPlot_SetNextPlotLimitsY(y_min, y_max, cond, y_axis)
    ccall((:ImPlot_SetNextPlotLimitsY, libcimplot), Cvoid, (Cdouble, Cdouble, Cint, Cint), y_min, y_max, cond, y_axis)
end

function ImPlot_SetNextPlotTicksXdoublePtr(values, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdoublePtr, libcimplot), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cstring}, Bool), values, n_ticks, labels, show_default)
end

function ImPlot_SetNextPlotTicksXdouble(x_min, x_max, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdouble, libcimplot), Cvoid, (Cdouble, Cdouble, Cint, Ptr{Cstring}, Bool), x_min, x_max, n_ticks, labels, show_default)
end

function ImPlot_SetNextPlotTicksYdoublePtr(values, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdoublePtr, libcimplot), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cstring}, Bool, Cint), values, n_ticks, labels, show_default, y_axis)
end

function ImPlot_SetNextPlotTicksYdouble(y_min, y_max, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdouble, libcimplot), Cvoid, (Cdouble, Cdouble, Cint, Ptr{Cstring}, Bool, Cint), y_min, y_max, n_ticks, labels, show_default, y_axis)
end

function ImPlot_SetPlotYAxis(y_axis)
    ccall((:ImPlot_SetPlotYAxis, libcimplot), Cvoid, (Cint,), y_axis)
end

function ImPlot_GetPlotPos(pOut)
    ccall((:ImPlot_GetPlotPos, libcimplot), Cvoid, (Ptr{Cint},), pOut)
end

function ImPlot_GetPlotSize(pOut)
    ccall((:ImPlot_GetPlotSize, libcimplot), Cvoid, (Ptr{Cint},), pOut)
end

function ImPlot_PixelsToPlot(pix, y_axis)
    ccall((:ImPlot_PixelsToPlot, libcimplot), ImPlotPoint, (Cint, Cint), pix, y_axis)
end

function ImPlot_PlotToPixels(pOut, plt, y_axis)
    ccall((:ImPlot_PlotToPixels, libcimplot), Cvoid, (Ptr{Cint}, ImPlotPoint, Cint), pOut, plt, y_axis)
end

function ImPlot_ShowColormapScale(scale_min, scale_max, height)
    ccall((:ImPlot_ShowColormapScale, libcimplot), Cvoid, (Cdouble, Cdouble, Cfloat), scale_min, scale_max, height)
end

function ImPlot_PushPlotClipRect()
    ccall((:ImPlot_PushPlotClipRect, libcimplot), Cvoid, ())
end

function ImPlot_PopPlotClipRect()
    ccall((:ImPlot_PopPlotClipRect, libcimplot), Cvoid, ())
end

function ImPlot_ShowDemoWindow(p_open)
    ccall((:ImPlot_ShowDemoWindow, libcimplot), Cvoid, (Ptr{Bool},), p_open)
end
