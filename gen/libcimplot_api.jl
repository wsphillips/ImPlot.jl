# Julia wrapper for header: cimplot.h
# Automatically generated using Clang.jl


function ImPlotRange_ImPlotRange()
    ccall((:ImPlotRange_ImPlotRange, libcimplot), Ptr{ImPlotRange}, ())
end

function ImPlotRange_destroy(self)
    ccall((:ImPlotRange_destroy, libcimplot), Cvoid, (Ptr{ImPlotRange},), self)
end

function ImPlotRange_Contains(self, value)
    ccall((:ImPlotRange_Contains, libcimplot), Bool, (Ptr{ImPlotRange}, Cfloat), self, value)
end

function ImPlotRange_Size(self)
    ccall((:ImPlotRange_Size, libcimplot), Cfloat, (Ptr{ImPlotRange},), self)
end

function ImPlotLimits_ImPlotLimits()
    ccall((:ImPlotLimits_ImPlotLimits, libcimplot), Ptr{ImPlotLimits}, ())
end

function ImPlotLimits_destroy(self)
    ccall((:ImPlotLimits_destroy, libcimplot), Cvoid, (Ptr{ImPlotLimits},), self)
end

function ImPlotLimits_Contains(self, p)
    ccall((:ImPlotLimits_Contains, libcimplot), Bool, (Ptr{ImPlotLimits}, Cint), self, p)
end

function ImPlotLimits_Size(pOut, self)
    ccall((:ImPlotLimits_Size, libcimplot), Cvoid, (Ptr{Cint}, Ptr{ImPlotLimits}), pOut, self)
end

function ImPlotStyle_ImPlotStyle()
    ccall((:ImPlotStyle_ImPlotStyle, libcimplot), Ptr{ImPlotStyle}, ())
end

function ImPlotStyle_destroy(self)
    ccall((:ImPlotStyle_destroy, libcimplot), Cvoid, (Ptr{ImPlotStyle},), self)
end

function ImPlot_BeginPlot(title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags)
    ccall((:ImPlot_BeginPlot, libcimplot), Bool, (Cstring, Cstring, Cstring, ImVec2, ImPlotFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags), title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags)
end

function ImPlot_Begin2dPlot(title, x_label, y_label, size, flags, x_flags, y_flags)
    ccall((:ImPlot_BeginPlot, libcimplot), Bool, (Cstring, Cstring, Cstring, ImVec2, ImPlotFlags, ImPlotAxisFlags, ImPlotAxisFlags),
          title, x_label, y_label, size, flags, x_flags, y_flags)
end

function ImPlot_EndPlot()
    ccall((:ImPlot_EndPlot, libcimplot), Cvoid, ())
end

function ImPlot_PlotFloatPtrInt(label_id, values, count, offset, stride)
    ccall((:ImPlot_PlotFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cint, Cint), label_id, values, count, offset, stride)
end

function ImPlot_PlotFloatPtrFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotVec2Ptr(label_id, data, count, offset)
    ccall((:ImPlot_PlotVec2Ptr, libcimplot), Cvoid, (Cstring, Ptr{Cint}, Cint, Cint), label_id, data, count, offset)
end

function ImPlot_PlotFnPtr(label_id, ImVec2, data, count, offset)
    ccall((:ImPlot_PlotFnPtr, libcimplot), Cvoid, (Cstring, Cvoid, Ptr{Cvoid}, Cint, Cint), label_id, ImVec2, data, count, offset)
end

function ImPlot_BarFloatPtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_BarFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cfloat, Cfloat, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_BarFloatPtrFloatPtr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_BarFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cfloat, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_BarFnPtr(label_id, ImVec2, data, count, width, offset)
    ccall((:ImPlot_BarFnPtr, libcimplot), Cvoid, (Cstring, Cvoid, Ptr{Cvoid}, Cint, Cfloat, Cint), label_id, ImVec2, data, count, width, offset)
end

function ImPlot_BarHFloatPtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_BarHFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cfloat, Cfloat, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_BarHFloatPtrFloatPtr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_BarHFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cfloat, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_BarHFnPtr(label_id, ImVec2, data, count, height, offset)
    ccall((:ImPlot_BarHFnPtr, libcimplot), Cvoid, (Cstring, Cvoid, Ptr{Cvoid}, Cint, Cfloat, Cint), label_id, ImVec2, data, count, height, offset)
end

function ImPlot_ErrorBarsFloatPtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_ErrorBarsFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_ErrorBarsFloatPtrFloatPtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_ErrorBarsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_ErrorBarsFnPtr(label_id, ImVec4, data, count, offset)
    ccall((:ImPlot_ErrorBarsFnPtr, libcimplot), Cvoid, (Cstring, Cvoid, Ptr{Cvoid}, Cint, Cint), label_id, ImVec4, data, count, offset)
end

function ImPlot_PieChart(label_ids, values, count, center, radius, show_percents, angle0)
    ccall((:ImPlot_PieChart, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cfloat}, Cint, Cint, Cfloat, Bool, Cfloat), label_ids, values, count, center, radius, show_percents, angle0)
end

function ImPlot_DigitalFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_DigitalFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_DigitalFnPtr(label_id, ImVec2, data, count, offset)
    ccall((:ImPlot_DigitalFnPtr, libcimplot), Cvoid, (Cstring, Cvoid, Ptr{Cvoid}, Cint, Cint), label_id, ImVec2, data, count, offset)
end

function ImPlot_Text(text, x, y, vertical, pixel_offset)
    ccall((:ImPlot_Text, libcimplot), Cvoid, (Cstring, Cfloat, Cfloat, Bool, Cint), text, x, y, vertical, pixel_offset)
end

function ImPlot_IsPlotHovered()
    ccall((:ImPlot_IsPlotHovered, libcimplot), Bool, ())
end

function ImPlot_GetPlotMousePos(pOut, y_axis)
    ccall((:ImPlot_GetPlotMousePos, libcimplot), Cvoid, (Ptr{Cint}, Cint), pOut, y_axis)
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

function ImPlot_SetPalette(colors, num_colors)
    ccall((:ImPlot_SetPalette, libcimplot), Cvoid, (Ptr{Cint}, Cint), colors, num_colors)
end

function ImPlot_RestorePalette()
    ccall((:ImPlot_RestorePalette, libcimplot), Cvoid, ())
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

function ImPlot_SetNextPlotLimits(x_min, x_max, y_min, y_max, cond)
    ccall((:ImPlot_SetNextPlotLimits, libcimplot), Cvoid, (Cfloat, Cfloat, Cfloat, Cfloat, Cint), x_min, x_max, y_min, y_max, cond)
end

function ImPlot_SetNextPlotLimitsX(x_min, x_max, cond)
    ccall((:ImPlot_SetNextPlotLimitsX, libcimplot), Cvoid, (Cfloat, Cfloat, Cint), x_min, x_max, cond)
end

function ImPlot_SetNextPlotLimitsY(y_min, y_max, cond, y_axis)
    ccall((:ImPlot_SetNextPlotLimitsY, libcimplot), Cvoid, (Cfloat, Cfloat, Cint, Cint), y_min, y_max, cond, y_axis)
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

function ImPlot_PixelsToPlot(pOut, pix, y_axis)
    ccall((:ImPlot_PixelsToPlot, libcimplot), Cvoid, (Ptr{Cint}, Cint, Cint), pOut, pix, y_axis)
end

function ImPlot_PlotToPixels(pOut, plt, y_axis)
    ccall((:ImPlot_PlotToPixels, libcimplot), Cvoid, (Ptr{Cint}, Cint, Cint), pOut, plt, y_axis)
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
