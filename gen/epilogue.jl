function Annotate(x::Real, y::Real, pix_offset::ImVec2, fmt::String...)

    ccall((:ImPlot_AnnotateStr, libcimplot), Cvoid, (Cdouble,Cdouble,ImVec2,Cstring...),
          x, y, pix_offset, fmt...)
end

function AnnotateClamped(x::Real, y::Real, pix_offset::ImVec2, fmt::String...)

    ccall((:ImPlot_AnnotateClampedStr, libcimplot), Cvoid, (Cdouble,Cdouble,ImVec2,Cstring...),
          x, y, pix_offset, fmt...)
end

function Annotate(x::Real, y::Real, pix_offset::ImVec2, color::ImVec4, fmt::String...)

    ccall((:ImPlot_AnnotateVec4, libcimplot), Cvoid, (Cdouble,Cdouble,ImVec2,ImVec4,Cstring...),
          x, y, pix_offset, color, fmt...)
end

function AnnotateClamped(x::Real, y::Real, pix_offset::ImVec2, color::ImVec4, fmt::String...)

    ccall((:ImPlot_AnnotateClampedVec4, libcimplot), Cvoid, (Cdouble,Cdouble,ImVec2,ImVec4,Cstring...),
          x, y, pix_offset, color, fmt...)
end

export ImPlotPoint, ImPlotRange, ImPlotLimits, ImPlotStyle, ImPlotInputMap, ImPlotContext
export CreateContext, DestroyContext, GetCurrentContext, SetCurrentContext, SetImGuiContext
export EndPlot
export SetNextPlotLimits, SetNextPlotLimitsX, SetNextPlotLimitsY, LinkNextPlotLimits, FitNextPlotAxes
export SetPlotYAxis, HideNextItem, IsPlotHovered, IsPlotXAxisHovered, IsPlotYAxisHovered, IsPlotQueried
export SetLegendLocation, SetMousePosLocation, IsLegendEntryHovered
export BeginLegendDragDropSource, EndLegendDragDropSource, BeginLegendPopup, EndLegendPopup
export GetStyle
export GetStyleColorName, GetMarkerName, PopColormap, GetColormapSize, ShowColormapScale
export GetColormapName, PushPlotClipRect, PopPlotClipRect
export ShowStyleSelector, ShowColormapSelector, ShowUserGuide, ShowDemoWindow, ShowMetricsWindow
export Annotate, AnnotateClamped
