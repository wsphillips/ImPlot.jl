module LibCImPlot

using CImPlot_jll
#export CImPlot_jll

using CImGui

const ImVec2 = CImGui.ImVec2
const ImVec4 = CImGui.ImVec4
const ImGuiMouseButton = CImGui.ImGuiMouseButton
const ImGuiKeyModFlags = CImGui.ImGuiKeyModFlags
const ImS8 = CImGui.ImS8
const ImU8 = CImGui.ImU8
const ImS16 = CImGui.ImS16
const ImU16 = CImGui.ImU16
const ImS32 = CImGui.ImS32
const ImU32 = CImGui.ImU32
const ImS64 = CImGui.ImS64
const ImU64 = CImGui.ImU64
const ImTextureID = CImGui.ImTextureID
const ImGuiCond = CImGui.ImGuiCond
const ImGuiDragDropFlags = CImGui.ImGuiDragDropFlags
const ImDrawList = CImGui.ImDrawList
const ImGuiContext = CImGui.ImGuiContext


struct ImPlotInputMap
    PanButton::ImGuiMouseButton
    PanMod::ImGuiKeyModFlags
    FitButton::ImGuiMouseButton
    ContextMenuButton::ImGuiMouseButton
    BoxSelectButton::ImGuiMouseButton
    BoxSelectMod::ImGuiKeyModFlags
    BoxSelectCancelButton::ImGuiMouseButton
    QueryButton::ImGuiMouseButton
    QueryMod::ImGuiKeyModFlags
    QueryToggleMod::ImGuiKeyModFlags
    HorizontalMod::ImGuiKeyModFlags
    VerticalMod::ImGuiKeyModFlags
end

struct ImPlotStyle
    LineWeight::Cfloat
    Marker::Cint
    MarkerSize::Cfloat
    MarkerWeight::Cfloat
    FillAlpha::Cfloat
    ErrorBarSize::Cfloat
    ErrorBarWeight::Cfloat
    DigitalBitHeight::Cfloat
    DigitalBitGap::Cfloat
    PlotBorderSize::Cfloat
    MinorAlpha::Cfloat
    MajorTickLen::ImVec2
    MinorTickLen::ImVec2
    MajorTickSize::ImVec2
    MinorTickSize::ImVec2
    MajorGridSize::ImVec2
    MinorGridSize::ImVec2
    PlotPadding::ImVec2
    LabelPadding::ImVec2
    LegendPadding::ImVec2
    LegendInnerPadding::ImVec2
    LegendSpacing::ImVec2
    MousePosPadding::ImVec2
    AnnotationPadding::ImVec2
    FitPadding::ImVec2
    PlotDefaultSize::ImVec2
    PlotMinSize::ImVec2
    Colors::NTuple{24, ImVec4}
    AntiAliasedLines::Bool
    UseLocalTime::Bool
    UseISO8601::Bool
    Use24HourClock::Bool
end

struct ImPlotRange
    Min::Cdouble
    Max::Cdouble
end

struct ImPlotLimits
    X::ImPlotRange
    Y::ImPlotRange
end

struct ImPlotPoint
    x::Cdouble
    y::Cdouble
end

mutable struct ImPlotContext end

const ImPlotFlags = Cint

const ImPlotAxisFlags = Cint

const ImPlotCol = Cint

const ImPlotStyleVar = Cint

const ImPlotMarker = Cint

const ImPlotColormap = Cint

const ImPlotLocation = Cint

const ImPlotOrientation = Cint

const ImPlotYAxis = Cint

@enum ImPlotFlags_::UInt32 begin
    ImPlotFlags_None = 0
    ImPlotFlags_NoTitle = 1
    ImPlotFlags_NoLegend = 2
    ImPlotFlags_NoMenus = 4
    ImPlotFlags_NoBoxSelect = 8
    ImPlotFlags_NoMousePos = 16
    ImPlotFlags_NoHighlight = 32
    ImPlotFlags_NoChild = 64
    ImPlotFlags_Equal = 128
    ImPlotFlags_YAxis2 = 256
    ImPlotFlags_YAxis3 = 512
    ImPlotFlags_Query = 1024
    ImPlotFlags_Crosshairs = 2048
    ImPlotFlags_AntiAliased = 4096
    ImPlotFlags_CanvasOnly = 31
end

@enum ImPlotAxisFlags_::UInt32 begin
    ImPlotAxisFlags_None = 0
    ImPlotAxisFlags_NoGridLines = 1
    ImPlotAxisFlags_NoTickMarks = 2
    ImPlotAxisFlags_NoTickLabels = 4
    ImPlotAxisFlags_LogScale = 8
    ImPlotAxisFlags_Time = 16
    ImPlotAxisFlags_Invert = 32
    ImPlotAxisFlags_LockMin = 64
    ImPlotAxisFlags_LockMax = 128
    ImPlotAxisFlags_Lock = 192
    ImPlotAxisFlags_NoDecorations = 7
end

@enum ImPlotCol_::UInt32 begin
    ImPlotCol_Line = 0
    ImPlotCol_Fill = 1
    ImPlotCol_MarkerOutline = 2
    ImPlotCol_MarkerFill = 3
    ImPlotCol_ErrorBar = 4
    ImPlotCol_FrameBg = 5
    ImPlotCol_PlotBg = 6
    ImPlotCol_PlotBorder = 7
    ImPlotCol_LegendBg = 8
    ImPlotCol_LegendBorder = 9
    ImPlotCol_LegendText = 10
    ImPlotCol_TitleText = 11
    ImPlotCol_InlayText = 12
    ImPlotCol_XAxis = 13
    ImPlotCol_XAxisGrid = 14
    ImPlotCol_YAxis = 15
    ImPlotCol_YAxisGrid = 16
    ImPlotCol_YAxis2 = 17
    ImPlotCol_YAxisGrid2 = 18
    ImPlotCol_YAxis3 = 19
    ImPlotCol_YAxisGrid3 = 20
    ImPlotCol_Selection = 21
    ImPlotCol_Query = 22
    ImPlotCol_Crosshairs = 23
    ImPlotCol_COUNT = 24
end

@enum ImPlotStyleVar_::UInt32 begin
    ImPlotStyleVar_LineWeight = 0
    ImPlotStyleVar_Marker = 1
    ImPlotStyleVar_MarkerSize = 2
    ImPlotStyleVar_MarkerWeight = 3
    ImPlotStyleVar_FillAlpha = 4
    ImPlotStyleVar_ErrorBarSize = 5
    ImPlotStyleVar_ErrorBarWeight = 6
    ImPlotStyleVar_DigitalBitHeight = 7
    ImPlotStyleVar_DigitalBitGap = 8
    ImPlotStyleVar_PlotBorderSize = 9
    ImPlotStyleVar_MinorAlpha = 10
    ImPlotStyleVar_MajorTickLen = 11
    ImPlotStyleVar_MinorTickLen = 12
    ImPlotStyleVar_MajorTickSize = 13
    ImPlotStyleVar_MinorTickSize = 14
    ImPlotStyleVar_MajorGridSize = 15
    ImPlotStyleVar_MinorGridSize = 16
    ImPlotStyleVar_PlotPadding = 17
    ImPlotStyleVar_LabelPadding = 18
    ImPlotStyleVar_LegendPadding = 19
    ImPlotStyleVar_LegendInnerPadding = 20
    ImPlotStyleVar_LegendSpacing = 21
    ImPlotStyleVar_MousePosPadding = 22
    ImPlotStyleVar_AnnotationPadding = 23
    ImPlotStyleVar_FitPadding = 24
    ImPlotStyleVar_PlotDefaultSize = 25
    ImPlotStyleVar_PlotMinSize = 26
    ImPlotStyleVar_COUNT = 27
end

@enum ImPlotMarker_::Int32 begin
    ImPlotMarker_None = -1
    ImPlotMarker_Circle = 0
    ImPlotMarker_Square = 1
    ImPlotMarker_Diamond = 2
    ImPlotMarker_Up = 3
    ImPlotMarker_Down = 4
    ImPlotMarker_Left = 5
    ImPlotMarker_Right = 6
    ImPlotMarker_Cross = 7
    ImPlotMarker_Plus = 8
    ImPlotMarker_Asterisk = 9
    ImPlotMarker_COUNT = 10
end

@enum ImPlotColormap_::UInt32 begin
    ImPlotColormap_Default = 0
    ImPlotColormap_Deep = 1
    ImPlotColormap_Dark = 2
    ImPlotColormap_Pastel = 3
    ImPlotColormap_Paired = 4
    ImPlotColormap_Viridis = 5
    ImPlotColormap_Plasma = 6
    ImPlotColormap_Hot = 7
    ImPlotColormap_Cool = 8
    ImPlotColormap_Pink = 9
    ImPlotColormap_Jet = 10
    ImPlotColormap_COUNT = 11
end

@enum ImPlotLocation_::UInt32 begin
    ImPlotLocation_Center = 0
    ImPlotLocation_North = 1
    ImPlotLocation_South = 2
    ImPlotLocation_West = 4
    ImPlotLocation_East = 8
    ImPlotLocation_NorthWest = 5
    ImPlotLocation_NorthEast = 9
    ImPlotLocation_SouthWest = 6
    ImPlotLocation_SouthEast = 10
end

@enum ImPlotOrientation_::UInt32 begin
    ImPlotOrientation_Horizontal = 0
    ImPlotOrientation_Vertical = 1
end

@enum ImPlotYAxis_::UInt32 begin
    ImPlotYAxis_1 = 0
    ImPlotYAxis_2 = 1
    ImPlotYAxis_3 = 2
end

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
    ccall((:ImPlotPoint_ImPlotPointVec2, libcimplot), Ptr{ImPlotPoint}, (ImVec2,), p)
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

function ImPlot_CreateContext()
    ccall((:ImPlot_CreateContext, libcimplot), Ptr{ImPlotContext}, ())
end

function ImPlot_DestroyContext(ctx)
    ccall((:ImPlot_DestroyContext, libcimplot), Cvoid, (Ptr{ImPlotContext},), ctx)
end

function ImPlot_GetCurrentContext()
    ccall((:ImPlot_GetCurrentContext, libcimplot), Ptr{ImPlotContext}, ())
end

function ImPlot_SetCurrentContext(ctx)
    ccall((:ImPlot_SetCurrentContext, libcimplot), Cvoid, (Ptr{ImPlotContext},), ctx)
end

function ImPlot_BeginPlot(title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags)
    ccall((:ImPlot_BeginPlot, libcimplot), Bool, (Cstring, Cstring, Cstring, ImVec2, ImPlotFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags), title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags)
end

function ImPlot_EndPlot()
    ccall((:ImPlot_EndPlot, libcimplot), Cvoid, ())
end

function ImPlot_PlotLineFloatPtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotLinedoublePtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLinedoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotLineS8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotLineU8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotLineS16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotLineU16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotLineS32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotLineU32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotLineS64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotLineU64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotLineU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotLineFloatPtrFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotLinedoublePtrdoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLinedoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotLineS8PtrS8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotLineU8PtrU8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotLineS16PtrS16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotLineU16PtrU16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotLineS32PtrS32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotLineU32PtrU32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotLineS64PtrS64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotLineU64PtrU64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotLineU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterFloatPtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotScatterdoublePtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotScatterS8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotScatterU8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotScatterS16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotScatterU16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotScatterS32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotScatterU32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotScatterS64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotScatterU64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotScatterU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotScatterFloatPtrFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterdoublePtrdoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterS8PtrS8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterU8PtrU8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterS16PtrS16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterU16PtrU16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterS32PtrS32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterU32PtrU32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterS64PtrS64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotScatterU64PtrU64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotScatterU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotStairsFloatPtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotStairsdoublePtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotStairsS8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotStairsU8PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotStairsS16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotStairsU16PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotStairsS32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotStairsU32PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotStairsS64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotStairsU64PtrInt(label_id, values, count, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStairsU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function ImPlot_PlotStairsFloatPtrFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotStairsdoublePtrdoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotStairsS8PtrS8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotStairsU8PtrU8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotStairsS16PtrS16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotStairsU16PtrU16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotStairsS32PtrS32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotStairsU32PtrU32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotStairsS64PtrS64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotStairsU64PtrU64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotStairsU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotStairsG(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotStairsG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function ImPlot_PlotShadedFloatPtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedFloatPtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotShadeddoublePtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadeddoublePtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotShadedS8PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedS8PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotShadedU8PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedU8PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotShadedS16PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedS16PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotShadedU16PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedU16PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotShadedS32PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedS32PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotShadedU32PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedU32PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotShadedS64PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedS64PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotShadedU64PtrIntdoubledoubleInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotShadedU64PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotShadedFloatPtrFloatPtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedFloatPtrFloatPtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotShadeddoublePtrdoublePtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadeddoublePtrdoublePtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotShadedS8PtrS8PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedS8PtrS8PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotShadedU8PtrU8PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedU8PtrU8PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotShadedS16PtrS16PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedS16PtrS16PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotShadedU16PtrU16PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedU16PtrU16PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotShadedS32PtrS32PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedS32PtrS32PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotShadedU32PtrU32PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedU32PtrU32PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotShadedS64PtrS64PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedS64PtrS64PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotShadedU64PtrU64PtrIntInt(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotShadedU64PtrU64PtrIntInt, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotShadedFloatPtrFloatPtrFloatPtr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function ImPlot_PlotShadeddoublePtrdoublePtrdoublePtr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadeddoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function ImPlot_PlotShadedS8PtrS8PtrS8Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function ImPlot_PlotShadedU8PtrU8PtrU8Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function ImPlot_PlotShadedS16PtrS16PtrS16Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function ImPlot_PlotShadedU16PtrU16PtrU16Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function ImPlot_PlotShadedS32PtrS32PtrS32Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function ImPlot_PlotShadedU32PtrU32PtrU32Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function ImPlot_PlotShadedS64PtrS64PtrS64Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function ImPlot_PlotShadedU64PtrU64PtrU64Ptr(label_id, xs, ys1, ys2, count, offset, stride)
    ccall((:ImPlot_PlotShadedU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function ImPlot_PlotBarsFloatPtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsdoublePtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsS8PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsU8PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsS16PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsU16PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsS32PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsU32PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsS64PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsU64PtrInt(label_id, values, count, width, shift, offset, stride)
    ccall((:ImPlot_PlotBarsU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function ImPlot_PlotBarsFloatPtrFloatPtr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsdoublePtrdoublePtr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsS8PtrS8Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsU8PtrU8Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsS16PtrS16Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsU16PtrU16Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsS32PtrS32Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsU32PtrU32Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsS64PtrS64Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsU64PtrU64Ptr(label_id, xs, ys, count, width, offset, stride)
    ccall((:ImPlot_PlotBarsU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function ImPlot_PlotBarsHFloatPtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHdoublePtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHS8PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHU8PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHS16PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHU16PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHS32PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHU32PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHS64PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHU64PtrInt(label_id, values, count, height, shift, offset, stride)
    ccall((:ImPlot_PlotBarsHU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function ImPlot_PlotBarsHFloatPtrFloatPtr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotBarsHdoublePtrdoublePtr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotBarsHS8PtrS8Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotBarsHU8PtrU8Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotBarsHS16PtrS16Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotBarsHU16PtrU16Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotBarsHS32PtrS32Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotBarsHU32PtrU32Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotBarsHS64PtrS64Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotBarsHU64PtrU64Ptr(label_id, xs, ys, count, height, offset, stride)
    ccall((:ImPlot_PlotBarsHU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsS8PtrS8PtrS8PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS8PtrS8PtrS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsU8PtrU8PtrU8PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU8PtrU8PtrU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsS16PtrS16PtrS16PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS16PtrS16PtrS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsU16PtrU16PtrU16PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU16PtrU16PtrU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsS32PtrS32PtrS32PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS32PtrS32PtrS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsU32PtrU32PtrU32PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU32PtrU32PtrU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsS64PtrS64PtrS64PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS64PtrS64PtrS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsU64PtrU64PtrU64PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU64PtrU64PtrU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsS8PtrS8PtrS8PtrS8Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS8PtrS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsU8PtrU8PtrU8PtrU8Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU8PtrU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsS16PtrS16PtrS16PtrS16Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS16PtrS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsU16PtrU16PtrU16PtrU16Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU16PtrU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsS32PtrS32PtrS32PtrS32Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS32PtrS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsU32PtrU32PtrU32PtrU32Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU32PtrU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsS64PtrS64PtrS64PtrS64Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsS64PtrS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsU64PtrU64PtrU64PtrU64Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsU64PtrU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHS8PtrS8PtrS8PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS8PtrS8PtrS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHU8PtrU8PtrU8PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU8PtrU8PtrU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHS16PtrS16PtrS16PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS16PtrS16PtrS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHU16PtrU16PtrU16PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU16PtrU16PtrU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHS32PtrS32PtrS32PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS32PtrS32PtrS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHU32PtrU32PtrU32PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU32PtrU32PtrU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHS64PtrS64PtrS64PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS64PtrS64PtrS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHU64PtrU64PtrU64PtrInt(label_id, xs, ys, err, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU64PtrU64PtrU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHS8PtrS8PtrS8PtrS8Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS8PtrS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHU8PtrU8PtrU8PtrU8Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU8PtrU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHS16PtrS16PtrS16PtrS16Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS16PtrS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHU16PtrU16PtrU16PtrU16Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU16PtrU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHS32PtrS32PtrS32PtrS32Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS32PtrS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHU32PtrU32PtrU32PtrU32Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU32PtrU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHS64PtrS64PtrS64PtrS64Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHS64PtrS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotErrorBarsHU64PtrU64PtrU64PtrU64Ptr(label_id, xs, ys, neg, pos, count, offset, stride)
    ccall((:ImPlot_PlotErrorBarsHU64PtrU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function ImPlot_PlotStemsFloatPtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsFloatPtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotStemsdoublePtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsdoublePtrInt, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotStemsS8PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsS8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotStemsU8PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsU8PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotStemsS16PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsS16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotStemsU16PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsU16PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotStemsS32PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsS32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotStemsU32PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsU32PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotStemsS64PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsS64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotStemsU64PtrInt(label_id, values, count, y_ref, xscale, x0, offset, stride)
    ccall((:ImPlot_PlotStemsU64PtrInt, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function ImPlot_PlotStemsFloatPtrFloatPtr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotStemsdoublePtrdoublePtr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotStemsS8PtrS8Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotStemsU8PtrU8Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotStemsS16PtrS16Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotStemsU16PtrU16Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotStemsS32PtrS32Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotStemsU32PtrU32Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotStemsS64PtrS64Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotStemsU64PtrU64Ptr(label_id, xs, ys, count, y_ref, offset, stride)
    ccall((:ImPlot_PlotStemsU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function ImPlot_PlotPieChartFloatPtr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartFloatPtr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotPieChartdoublePtr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartdoublePtr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotPieChartS8Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartS8Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotPieChartU8Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartU8Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotPieChartS16Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartS16Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotPieChartU16Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartU16Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotPieChartS32Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartS32Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotPieChartU32Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartU32Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotPieChartS64Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartS64Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotPieChartU64Ptr(label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
    ccall((:ImPlot_PlotPieChartU64Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function ImPlot_PlotHeatmapFloatPtr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotHeatmapdoublePtr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapdoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotHeatmapS8Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotHeatmapU8Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotHeatmapS16Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotHeatmapU16Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotHeatmapS32Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotHeatmapU32Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotHeatmapS64Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotHeatmapU64Ptr(label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function ImPlot_PlotDigitalFloatPtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalFloatPtr, libcimplot), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotDigitaldoublePtr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitaldoublePtr, libcimplot), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotDigitalS8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalS8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotDigitalU8Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalU8Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotDigitalS16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalS16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotDigitalU16Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalU16Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotDigitalS32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalS32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotDigitalU32Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalU32Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotDigitalS64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalS64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotDigitalU64Ptr(label_id, xs, ys, count, offset, stride)
    ccall((:ImPlot_PlotDigitalU64Ptr, libcimplot), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function ImPlot_PlotImage(label_id, user_texture_id, bounds_min, bounds_max, uv0, uv1, tint_col)
    ccall((:ImPlot_PlotImage, libcimplot), Cvoid, (Cstring, ImTextureID, ImPlotPoint, ImPlotPoint, ImVec2, ImVec2, ImVec4), label_id, user_texture_id, bounds_min, bounds_max, uv0, uv1, tint_col)
end

function ImPlot_PlotText(text, x, y, vertical, pix_offset)
    ccall((:ImPlot_PlotText, libcimplot), Cvoid, (Cstring, Cdouble, Cdouble, Bool, ImVec2), text, x, y, vertical, pix_offset)
end

function ImPlot_PlotDummy(label_id)
    ccall((:ImPlot_PlotDummy, libcimplot), Cvoid, (Cstring,), label_id)
end

function ImPlot_SetNextPlotLimits(xmin, xmax, ymin, ymax, cond)
    ccall((:ImPlot_SetNextPlotLimits, libcimplot), Cvoid, (Cdouble, Cdouble, Cdouble, Cdouble, ImGuiCond), xmin, xmax, ymin, ymax, cond)
end

function ImPlot_SetNextPlotLimitsX(xmin, xmax, cond)
    ccall((:ImPlot_SetNextPlotLimitsX, libcimplot), Cvoid, (Cdouble, Cdouble, ImGuiCond), xmin, xmax, cond)
end

function ImPlot_SetNextPlotLimitsY(ymin, ymax, cond, y_axis)
    ccall((:ImPlot_SetNextPlotLimitsY, libcimplot), Cvoid, (Cdouble, Cdouble, ImGuiCond, ImPlotYAxis), ymin, ymax, cond, y_axis)
end

function ImPlot_LinkNextPlotLimits(xmin, xmax, ymin, ymax, ymin2, ymax2, ymin3, ymax3)
    ccall((:ImPlot_LinkNextPlotLimits, libcimplot), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), xmin, xmax, ymin, ymax, ymin2, ymax2, ymin3, ymax3)
end

function ImPlot_FitNextPlotAxes(x, y, y2, y3)
    ccall((:ImPlot_FitNextPlotAxes, libcimplot), Cvoid, (Bool, Bool, Bool, Bool), x, y, y2, y3)
end

function ImPlot_SetNextPlotTicksXdoublePtr(values, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdoublePtr, libcimplot), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cstring}, Bool), values, n_ticks, labels, show_default)
end

function ImPlot_SetNextPlotTicksXdouble(x_min, x_max, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdouble, libcimplot), Cvoid, (Cdouble, Cdouble, Cint, Ptr{Cstring}, Bool), x_min, x_max, n_ticks, labels, show_default)
end

function ImPlot_SetNextPlotTicksYdoublePtr(values, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdoublePtr, libcimplot), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cstring}, Bool, ImPlotYAxis), values, n_ticks, labels, show_default, y_axis)
end

function ImPlot_SetNextPlotTicksYdouble(y_min, y_max, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdouble, libcimplot), Cvoid, (Cdouble, Cdouble, Cint, Ptr{Cstring}, Bool, ImPlotYAxis), y_min, y_max, n_ticks, labels, show_default, y_axis)
end

function ImPlot_SetPlotYAxis(y_axis)
    ccall((:ImPlot_SetPlotYAxis, libcimplot), Cvoid, (ImPlotYAxis,), y_axis)
end

function ImPlot_HideNextItem(hidden, cond)
    ccall((:ImPlot_HideNextItem, libcimplot), Cvoid, (Bool, ImGuiCond), hidden, cond)
end

function ImPlot_PixelsToPlotVec2(pOut, pix, y_axis)
    ccall((:ImPlot_PixelsToPlotVec2, libcimplot), Cvoid, (Ptr{ImPlotPoint}, ImVec2, ImPlotYAxis), pOut, pix, y_axis)
end

function ImPlot_PixelsToPlotFloat(pOut, x, y, y_axis)
    ccall((:ImPlot_PixelsToPlotFloat, libcimplot), Cvoid, (Ptr{ImPlotPoint}, Cfloat, Cfloat, ImPlotYAxis), pOut, x, y, y_axis)
end

function ImPlot_PlotToPixelsPlotPoInt(pOut, plt, y_axis)
    ccall((:ImPlot_PlotToPixelsPlotPoInt, libcimplot), Cvoid, (Ptr{ImVec2}, ImPlotPoint, ImPlotYAxis), pOut, plt, y_axis)
end

function ImPlot_PlotToPixelsdouble(pOut, x, y, y_axis)
    ccall((:ImPlot_PlotToPixelsdouble, libcimplot), Cvoid, (Ptr{ImVec2}, Cdouble, Cdouble, ImPlotYAxis), pOut, x, y, y_axis)
end

function ImPlot_GetPlotPos(pOut)
    ccall((:ImPlot_GetPlotPos, libcimplot), Cvoid, (Ptr{ImVec2},), pOut)
end

function ImPlot_GetPlotSize(pOut)
    ccall((:ImPlot_GetPlotSize, libcimplot), Cvoid, (Ptr{ImVec2},), pOut)
end

function ImPlot_IsPlotHovered()
    ccall((:ImPlot_IsPlotHovered, libcimplot), Bool, ())
end

function ImPlot_IsPlotXAxisHovered()
    ccall((:ImPlot_IsPlotXAxisHovered, libcimplot), Bool, ())
end

function ImPlot_IsPlotYAxisHovered(y_axis)
    ccall((:ImPlot_IsPlotYAxisHovered, libcimplot), Bool, (ImPlotYAxis,), y_axis)
end

function ImPlot_GetPlotMousePos(pOut, y_axis)
    ccall((:ImPlot_GetPlotMousePos, libcimplot), Cvoid, (Ptr{ImPlotPoint}, ImPlotYAxis), pOut, y_axis)
end

function ImPlot_GetPlotLimits(pOut, y_axis)
    ccall((:ImPlot_GetPlotLimits, libcimplot), Cvoid, (Ptr{ImPlotLimits}, ImPlotYAxis), pOut, y_axis)
end

function ImPlot_IsPlotQueried()
    ccall((:ImPlot_IsPlotQueried, libcimplot), Bool, ())
end

function ImPlot_GetPlotQuery(pOut, y_axis)
    ccall((:ImPlot_GetPlotQuery, libcimplot), Cvoid, (Ptr{ImPlotLimits}, ImPlotYAxis), pOut, y_axis)
end

function ImPlot_DragLineX(id, x_value, show_label, col, thickness)
    ccall((:ImPlot_DragLineX, libcimplot), Bool, (Cstring, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, x_value, show_label, col, thickness)
end

function ImPlot_DragLineY(id, y_value, show_label, col, thickness)
    ccall((:ImPlot_DragLineY, libcimplot), Bool, (Cstring, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, y_value, show_label, col, thickness)
end

function ImPlot_DragPoint(id, x, y, show_label, col, radius)
    ccall((:ImPlot_DragPoint, libcimplot), Bool, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, x, y, show_label, col, radius)
end

function ImPlot_SetLegendLocation(location, orientation, outside)
    ccall((:ImPlot_SetLegendLocation, libcimplot), Cvoid, (ImPlotLocation, ImPlotOrientation, Bool), location, orientation, outside)
end

function ImPlot_SetMousePosLocation(location)
    ccall((:ImPlot_SetMousePosLocation, libcimplot), Cvoid, (ImPlotLocation,), location)
end

function ImPlot_IsLegendEntryHovered(label_id)
    ccall((:ImPlot_IsLegendEntryHovered, libcimplot), Bool, (Cstring,), label_id)
end

function ImPlot_BeginLegendDragDropSource(label_id, flags)
    ccall((:ImPlot_BeginLegendDragDropSource, libcimplot), Bool, (Cstring, ImGuiDragDropFlags), label_id, flags)
end

function ImPlot_EndLegendDragDropSource()
    ccall((:ImPlot_EndLegendDragDropSource, libcimplot), Cvoid, ())
end

function ImPlot_BeginLegendPopup(label_id, mouse_button)
    ccall((:ImPlot_BeginLegendPopup, libcimplot), Bool, (Cstring, ImGuiMouseButton), label_id, mouse_button)
end

function ImPlot_EndLegendPopup()
    ccall((:ImPlot_EndLegendPopup, libcimplot), Cvoid, ())
end

function ImPlot_GetStyle()
    ccall((:ImPlot_GetStyle, libcimplot), Ptr{ImPlotStyle}, ())
end

function ImPlot_StyleColorsAuto(dst)
    ccall((:ImPlot_StyleColorsAuto, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function ImPlot_StyleColorsClassic(dst)
    ccall((:ImPlot_StyleColorsClassic, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function ImPlot_StyleColorsDark(dst)
    ccall((:ImPlot_StyleColorsDark, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function ImPlot_StyleColorsLight(dst)
    ccall((:ImPlot_StyleColorsLight, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function ImPlot_PushStyleColorU32(idx, col)
    ccall((:ImPlot_PushStyleColorU32, libcimplot), Cvoid, (ImPlotCol, ImU32), idx, col)
end

function ImPlot_PushStyleColorVec4(idx, col)
    ccall((:ImPlot_PushStyleColorVec4, libcimplot), Cvoid, (ImPlotCol, ImVec4), idx, col)
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

function ImPlot_PushStyleVarVec2(idx, val)
    ccall((:ImPlot_PushStyleVarVec2, libcimplot), Cvoid, (ImPlotStyleVar, ImVec2), idx, val)
end

function ImPlot_PopStyleVar(count)
    ccall((:ImPlot_PopStyleVar, libcimplot), Cvoid, (Cint,), count)
end

function ImPlot_SetNextLineStyle(col, weight)
    ccall((:ImPlot_SetNextLineStyle, libcimplot), Cvoid, (ImVec4, Cfloat), col, weight)
end

function ImPlot_SetNextFillStyle(col, alpha_mod)
    ccall((:ImPlot_SetNextFillStyle, libcimplot), Cvoid, (ImVec4, Cfloat), col, alpha_mod)
end

function ImPlot_SetNextMarkerStyle(marker, size, fill, weight, outline)
    ccall((:ImPlot_SetNextMarkerStyle, libcimplot), Cvoid, (ImPlotMarker, Cfloat, ImVec4, Cfloat, ImVec4), marker, size, fill, weight, outline)
end

function ImPlot_SetNextErrorBarStyle(col, size, weight)
    ccall((:ImPlot_SetNextErrorBarStyle, libcimplot), Cvoid, (ImVec4, Cfloat, Cfloat), col, size, weight)
end

function ImPlot_GetLastItemColor(pOut)
    ccall((:ImPlot_GetLastItemColor, libcimplot), Cvoid, (Ptr{ImVec4},), pOut)
end

function ImPlot_GetStyleColorName(idx)
    ccall((:ImPlot_GetStyleColorName, libcimplot), Cstring, (ImPlotCol,), idx)
end

function ImPlot_GetMarkerName(idx)
    ccall((:ImPlot_GetMarkerName, libcimplot), Cstring, (ImPlotMarker,), idx)
end

function ImPlot_PushColormapPlotColormap(colormap)
    ccall((:ImPlot_PushColormapPlotColormap, libcimplot), Cvoid, (ImPlotColormap,), colormap)
end

function ImPlot_PushColormapVec4Ptr(colormap, size)
    ccall((:ImPlot_PushColormapVec4Ptr, libcimplot), Cvoid, (Ptr{ImVec4}, Cint), colormap, size)
end

function ImPlot_PopColormap(count)
    ccall((:ImPlot_PopColormap, libcimplot), Cvoid, (Cint,), count)
end

function ImPlot_SetColormapVec4Ptr(colormap, size)
    ccall((:ImPlot_SetColormapVec4Ptr, libcimplot), Cvoid, (Ptr{ImVec4}, Cint), colormap, size)
end

function ImPlot_SetColormapPlotColormap(colormap, samples)
    ccall((:ImPlot_SetColormapPlotColormap, libcimplot), Cvoid, (ImPlotColormap, Cint), colormap, samples)
end

function ImPlot_GetColormapSize()
    ccall((:ImPlot_GetColormapSize, libcimplot), Cint, ())
end

function ImPlot_GetColormapColor(pOut, index)
    ccall((:ImPlot_GetColormapColor, libcimplot), Cvoid, (Ptr{ImVec4}, Cint), pOut, index)
end

function ImPlot_LerpColormap(pOut, t)
    ccall((:ImPlot_LerpColormap, libcimplot), Cvoid, (Ptr{ImVec4}, Cfloat), pOut, t)
end

function ImPlot_NextColormapColor(pOut)
    ccall((:ImPlot_NextColormapColor, libcimplot), Cvoid, (Ptr{ImVec4},), pOut)
end

function ImPlot_ShowColormapScale(scale_min, scale_max, height)
    ccall((:ImPlot_ShowColormapScale, libcimplot), Cvoid, (Cdouble, Cdouble, Cfloat), scale_min, scale_max, height)
end

function ImPlot_GetColormapName(colormap)
    ccall((:ImPlot_GetColormapName, libcimplot), Cstring, (ImPlotColormap,), colormap)
end

function ImPlot_GetInputMap()
    ccall((:ImPlot_GetInputMap, libcimplot), Ptr{ImPlotInputMap}, ())
end

function ImPlot_GetPlotDrawList()
    ccall((:ImPlot_GetPlotDrawList, libcimplot), Ptr{ImDrawList}, ())
end

function ImPlot_PushPlotClipRect()
    ccall((:ImPlot_PushPlotClipRect, libcimplot), Cvoid, ())
end

function ImPlot_PopPlotClipRect()
    ccall((:ImPlot_PopPlotClipRect, libcimplot), Cvoid, ())
end

function ImPlot_ShowStyleSelector(label)
    ccall((:ImPlot_ShowStyleSelector, libcimplot), Bool, (Cstring,), label)
end

function ImPlot_ShowColormapSelector(label)
    ccall((:ImPlot_ShowColormapSelector, libcimplot), Bool, (Cstring,), label)
end

function ImPlot_ShowStyleEditor(ref)
    ccall((:ImPlot_ShowStyleEditor, libcimplot), Cvoid, (Ptr{ImPlotStyle},), ref)
end

function ImPlot_ShowUserGuide()
    ccall((:ImPlot_ShowUserGuide, libcimplot), Cvoid, ())
end

function ImPlot_ShowMetricsWindow(p_popen)
    ccall((:ImPlot_ShowMetricsWindow, libcimplot), Cvoid, (Ptr{Bool},), p_popen)
end

function ImPlot_SetImGuiContext(ctx)
    ccall((:ImPlot_SetImGuiContext, libcimplot), Cvoid, (Ptr{ImGuiContext},), ctx)
end

function ImPlot_ShowDemoWindow(p_open)
    ccall((:ImPlot_ShowDemoWindow, libcimplot), Cvoid, (Ptr{Bool},), p_open)
end

function ImPlot_PlotLineG(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotLineG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function ImPlot_PlotScatterG(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotScatterG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function ImPlot_PlotShadedG(label_id, getter1, data1, getter2, data2, count, offset)
    ccall((:ImPlot_PlotShadedG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter1, data1, getter2, data2, count, offset)
end

function ImPlot_PlotBarsG(label_id, getter, data, count, width, offset)
    ccall((:ImPlot_PlotBarsG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, width, offset)
end

function ImPlot_PlotBarsHG(label_id, getter, data, count, height, offset)
    ccall((:ImPlot_PlotBarsHG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, height, offset)
end

function ImPlot_PlotDigitalG(label_id, getter, data, count, offset)
    ccall((:ImPlot_PlotDigitalG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

const CIMGUIPLOT_INCLUDED = nothing

# Skipping MacroDefinition: API __attribute__ ( ( __visibility__ ( "default" ) ) )

# Skipping MacroDefinition: EXTERN extern

# Skipping MacroDefinition: CIMGUI_API EXTERN API

# Skipping MacroDefinition: CONST const

export CreateContext, DestroyContext, SetImGuiContext


# exports
const PREFIXES = ["ImPlotFlags_", "ImPlotAxisFlags_"]
foreach(names(@__MODULE__; all=true)) do s
    for prefix in PREFIXES
        if startswith(string(s), prefix)
            @eval export $s
        end
    end
end

end # module
