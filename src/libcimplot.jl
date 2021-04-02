module LibCImPlot

using CImPlot_jll

using CImGui

import CImGui: 
    # Vector primitives:
    ImVec2, ImVec4,
    # Enums
    ImGuiMouseButton, ImGuiKeyModFlags, ImGuiCond, ImGuiDragDropFlags,
    # Primitive type aliases; uncomment after CImGui update
    #=ImS8,=# ImU8, ImS16, ImU16, ImS32, ImU32, ImS64, ImU64,
    ImTextureID,
    ImDrawList,
    ImGuiContext
            
#Temporary patch; CImGui.jl v1.79.0 aliases ImS8 incorrectly
const ImS8 = Int8

const IMPLOT_AUTO = Cint(-1)
const IMPLOT_AUTO_COL = ImVec4(0,0,0,-1)


mutable struct ImPlotInputMap
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

mutable struct ImPlotStyle
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

mutable struct ImPlotLimits
    X::ImPlotRange
    Y::ImPlotRange
end

mutable struct ImPlotPoint
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

function BeginPlot(title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags)
    ccall((:ImPlot_BeginPlot, libcimplot), Bool, (Cstring, Cstring, Cstring, ImVec2, ImPlotFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags), title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags)
end

function EndPlot()
    ccall((:ImPlot_EndPlot, libcimplot), Cvoid, ())
end

function PlotLine(label_id, values::AbstractArray{Cfloat}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineFloatPtrInt, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{Cdouble}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLinedoublePtrInt, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImS8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImU8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImS16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImU16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImS32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImU32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImS64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImU64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLinedoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{Cfloat}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterFloatPtrInt, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{Cdouble}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterdoublePtrInt, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImS8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImU8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImS16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImU16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImS32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImU32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImS64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImU64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{Cfloat}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsFloatPtrInt, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{Cdouble}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsdoublePtrInt, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImS8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImU8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImS16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImU16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImS32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImU32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImS64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImU64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsG(label_id, getter, data, count::Integer, offset::Integer)
    ccall((:ImPlot_PlotStairsG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function PlotShaded(label_id, values::AbstractArray{Cfloat}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedFloatPtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{Cdouble}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadeddoublePtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImS8}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS8PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImU8}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU8PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImS16}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS16PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImU16}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU16PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImS32}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS32PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImU32}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU32PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImS64}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS64PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImU64}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU64PtrIntdoubledoubleInt, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedFloatPtrFloatPtrIntInt, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadeddoublePtrdoublePtrIntInt, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS8PtrS8PtrIntInt, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU8PtrU8PtrIntInt, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS16PtrS16PtrIntInt, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU16PtrU16PtrIntInt, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS32PtrS32PtrIntInt, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU32PtrU32PtrIntInt, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS64PtrS64PtrIntInt, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU64PtrU64PtrIntInt, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{Cfloat}, ys1::AbstractArray{Cfloat}, ys2::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{Cdouble}, ys1::AbstractArray{Cdouble}, ys2::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadeddoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS8}, ys1::AbstractArray{ImS8}, ys2::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU8}, ys1::AbstractArray{ImU8}, ys2::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS16}, ys1::AbstractArray{ImS16}, ys2::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU16}, ys1::AbstractArray{ImU16}, ys2::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS32}, ys1::AbstractArray{ImS32}, ys2::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU32}, ys1::AbstractArray{ImU32}, ys2::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS64}, ys1::AbstractArray{ImS64}, ys2::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU64}, ys1::AbstractArray{ImU64}, ys2::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{Cfloat}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsFloatPtrInt, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{Cdouble}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsdoublePtrInt, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImS8}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImU8}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImS16}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImU16}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImS32}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImU32}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImS64}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImU64}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{Cfloat}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHFloatPtrInt, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{Cdouble}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHdoublePtrInt, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImS8}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImU8}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImS16}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImU16}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImS32}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImU32}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImS64}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImU64}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, err::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, err::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, err::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS8PtrS8PtrS8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, err::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU8PtrU8PtrU8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, err::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS16PtrS16PtrS16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, err::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU16PtrU16PtrU16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, err::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS32PtrS32PtrS32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, err::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU32PtrU32PtrU32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, err::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS64PtrS64PtrS64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, err::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU64PtrU64PtrU64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, neg::AbstractArray{Cfloat}, pos::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, neg::AbstractArray{Cdouble}, pos::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, neg::AbstractArray{ImS8}, pos::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS8PtrS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, neg::AbstractArray{ImU8}, pos::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU8PtrU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, neg::AbstractArray{ImS16}, pos::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS16PtrS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, neg::AbstractArray{ImU16}, pos::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU16PtrU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, neg::AbstractArray{ImS32}, pos::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS32PtrS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, neg::AbstractArray{ImU32}, pos::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU32PtrU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, neg::AbstractArray{ImS64}, pos::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS64PtrS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, neg::AbstractArray{ImU64}, pos::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU64PtrU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, err::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, err::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, err::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS8PtrS8PtrS8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, err::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU8PtrU8PtrU8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, err::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS16PtrS16PtrS16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, err::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU16PtrU16PtrU16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, err::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS32PtrS32PtrS32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, err::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU32PtrU32PtrU32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, err::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS64PtrS64PtrS64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, err::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU64PtrU64PtrU64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, neg::AbstractArray{Cfloat}, pos::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, neg::AbstractArray{Cdouble}, pos::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, neg::AbstractArray{ImS8}, pos::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS8PtrS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, neg::AbstractArray{ImU8}, pos::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU8PtrU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, neg::AbstractArray{ImS16}, pos::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS16PtrS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, neg::AbstractArray{ImU16}, pos::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU16PtrU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, neg::AbstractArray{ImS32}, pos::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS32PtrS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, neg::AbstractArray{ImU32}, pos::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU32PtrU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, neg::AbstractArray{ImS64}, pos::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS64PtrS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, neg::AbstractArray{ImU64}, pos::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU64PtrU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{Cfloat}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsFloatPtrInt, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{Cdouble}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsdoublePtrInt, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImS8}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImU8}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU8PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImS16}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImU16}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU16PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImS32}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImU32}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU32PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImS64}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImU64}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU64PtrInt, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsFloatPtrFloatPtr, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsdoublePtrdoublePtr, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS8PtrS8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU8PtrU8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS16PtrS16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU16PtrU16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS32PtrS32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU32PtrU32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS64PtrS64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU64PtrU64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotPieChart(label_ids, values::AbstractArray{Cfloat}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartFloatPtr, libcimplot), Cvoid, (Ptr{Cstring}, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{Cdouble}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartdoublePtr, libcimplot), Cvoid, (Ptr{Cstring}, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImS8}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartS8Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ref{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImU8}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartU8Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ref{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImS16}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartS16Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ref{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImU16}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartU16Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ref{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImS32}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartS32Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ref{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImU32}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartU32Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ref{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImS64}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartS64Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ref{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImU64}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartU64Ptr, libcimplot), Cvoid, (Ptr{Cstring}, Ref{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotHeatmap(label_id, values::AbstractArray{Cfloat}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapFloatPtr, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{Cdouble}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapdoublePtr, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImS8}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImU8}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImS16}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImU16}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImS32}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImU32}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImS64}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImU64}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotDigital(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalFloatPtr, libcimplot), Cvoid, (Cstring, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitaldoublePtr, libcimplot), Cvoid, (Cstring, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalS8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalU8Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalS16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalU16Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalS32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalU32Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalS64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalU64Ptr, libcimplot), Cvoid, (Cstring, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotImage(label_id, user_texture_id, bounds_min, bounds_max, uv0, uv1, tint_col)
    ccall((:ImPlot_PlotImage, libcimplot), Cvoid, (Cstring, ImTextureID, ImPlotPoint, ImPlotPoint, ImVec2, ImVec2, ImVec4), label_id, user_texture_id, bounds_min, bounds_max, uv0, uv1, tint_col)
end

function PlotText(text, x::Real, y::Real, vertical, pix_offset)
    ccall((:ImPlot_PlotText, libcimplot), Cvoid, (Cstring, Cdouble, Cdouble, Bool, ImVec2), text, x, y, vertical, pix_offset)
end

function PlotDummy(label_id)
    ccall((:ImPlot_PlotDummy, libcimplot), Cvoid, (Cstring,), label_id)
end

function SetNextPlotLimits(xmin, xmax, ymin, ymax, cond)
    ccall((:ImPlot_SetNextPlotLimits, libcimplot), Cvoid, (Cdouble, Cdouble, Cdouble, Cdouble, ImGuiCond), xmin, xmax, ymin, ymax, cond)
end

function SetNextPlotLimitsX(xmin, xmax, cond)
    ccall((:ImPlot_SetNextPlotLimitsX, libcimplot), Cvoid, (Cdouble, Cdouble, ImGuiCond), xmin, xmax, cond)
end

function SetNextPlotLimitsY(ymin, ymax, cond, y_axis)
    ccall((:ImPlot_SetNextPlotLimitsY, libcimplot), Cvoid, (Cdouble, Cdouble, ImGuiCond, ImPlotYAxis), ymin, ymax, cond, y_axis)
end

function LinkNextPlotLimits(xmin, xmax, ymin, ymax, ymin2, ymax2, ymin3, ymax3)
    ccall((:ImPlot_LinkNextPlotLimits, libcimplot), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), xmin, xmax, ymin, ymax, ymin2, ymax2, ymin3, ymax3)
end

function FitNextPlotAxes(x, y, y2, y3)
    ccall((:ImPlot_FitNextPlotAxes, libcimplot), Cvoid, (Bool, Bool, Bool, Bool), x, y, y2, y3)
end

function SetNextPlotTicksXdoublePtr(values, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdoublePtr, libcimplot), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cstring}, Bool), values, n_ticks, labels, show_default)
end

function SetNextPlotTicksXdouble(x_min, x_max, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdouble, libcimplot), Cvoid, (Cdouble, Cdouble, Cint, Ptr{Cstring}, Bool), x_min, x_max, n_ticks, labels, show_default)
end

function SetNextPlotTicksYdoublePtr(values, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdoublePtr, libcimplot), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cstring}, Bool, ImPlotYAxis), values, n_ticks, labels, show_default, y_axis)
end

function SetNextPlotTicksYdouble(y_min, y_max, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdouble, libcimplot), Cvoid, (Cdouble, Cdouble, Cint, Ptr{Cstring}, Bool, ImPlotYAxis), y_min, y_max, n_ticks, labels, show_default, y_axis)
end

function SetPlotYAxis(y_axis)
    ccall((:ImPlot_SetPlotYAxis, libcimplot), Cvoid, (ImPlotYAxis,), y_axis)
end

function HideNextItem(hidden, cond)
    ccall((:ImPlot_HideNextItem, libcimplot), Cvoid, (Bool, ImGuiCond), hidden, cond)
end

function PixelsToPlotVec2(pOut, pix, y_axis)
    ccall((:ImPlot_PixelsToPlotVec2, libcimplot), Cvoid, (Ptr{ImPlotPoint}, ImVec2, ImPlotYAxis), pOut, pix, y_axis)
end

function PixelsToPlotFloat(pOut, x, y, y_axis)
    ccall((:ImPlot_PixelsToPlotFloat, libcimplot), Cvoid, (Ptr{ImPlotPoint}, Cfloat, Cfloat, ImPlotYAxis), pOut, x, y, y_axis)
end

function PlotToPixelsPlotPoInt(pOut, plt, y_axis)
    ccall((:ImPlot_PlotToPixelsPlotPoInt, libcimplot), Cvoid, (Ptr{ImVec2}, ImPlotPoint, ImPlotYAxis), pOut, plt, y_axis)
end

function PlotToPixelsdouble(pOut, x::Real, y::Real, y_axis)
    ccall((:ImPlot_PlotToPixelsdouble, libcimplot), Cvoid, (Ptr{ImVec2}, Cdouble, Cdouble, ImPlotYAxis), pOut, x, y, y_axis)
end

function GetPlotPos(pOut)
    ccall((:ImPlot_GetPlotPos, libcimplot), Cvoid, (Ptr{ImVec2},), pOut)
end

function GetPlotSize(pOut)
    ccall((:ImPlot_GetPlotSize, libcimplot), Cvoid, (Ptr{ImVec2},), pOut)
end

function IsPlotHovered()
    ccall((:ImPlot_IsPlotHovered, libcimplot), Bool, ())
end

function IsPlotXAxisHovered()
    ccall((:ImPlot_IsPlotXAxisHovered, libcimplot), Bool, ())
end

function IsPlotYAxisHovered(y_axis)
    ccall((:ImPlot_IsPlotYAxisHovered, libcimplot), Bool, (ImPlotYAxis,), y_axis)
end

function GetPlotMousePos(pOut, y_axis)
    ccall((:ImPlot_GetPlotMousePos, libcimplot), Cvoid, (Ptr{ImPlotPoint}, ImPlotYAxis), pOut, y_axis)
end

function GetPlotLimits(pOut, y_axis)
    ccall((:ImPlot_GetPlotLimits, libcimplot), Cvoid, (Ptr{ImPlotLimits}, ImPlotYAxis), pOut, y_axis)
end

function IsPlotQueried()
    ccall((:ImPlot_IsPlotQueried, libcimplot), Bool, ())
end

function GetPlotQuery(pOut, y_axis)
    ccall((:ImPlot_GetPlotQuery, libcimplot), Cvoid, (Ptr{ImPlotLimits}, ImPlotYAxis), pOut, y_axis)
end

function DragLineX(id, x_value, show_label, col, thickness)
    ccall((:ImPlot_DragLineX, libcimplot), Bool, (Cstring, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, x_value, show_label, col, thickness)
end

function DragLineY(id, y_value, show_label, col, thickness)
    ccall((:ImPlot_DragLineY, libcimplot), Bool, (Cstring, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, y_value, show_label, col, thickness)
end

function DragPoint(id, x, y, show_label, col, radius)
    ccall((:ImPlot_DragPoint, libcimplot), Bool, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, x, y, show_label, col, radius)
end

function SetLegendLocation(location, orientation, outside)
    ccall((:ImPlot_SetLegendLocation, libcimplot), Cvoid, (ImPlotLocation, ImPlotOrientation, Bool), location, orientation, outside)
end

function SetMousePosLocation(location)
    ccall((:ImPlot_SetMousePosLocation, libcimplot), Cvoid, (ImPlotLocation,), location)
end

function IsLegendEntryHovered(label_id)
    ccall((:ImPlot_IsLegendEntryHovered, libcimplot), Bool, (Cstring,), label_id)
end

function BeginLegendDragDropSource(label_id, flags)
    ccall((:ImPlot_BeginLegendDragDropSource, libcimplot), Bool, (Cstring, ImGuiDragDropFlags), label_id, flags)
end

function EndLegendDragDropSource()
    ccall((:ImPlot_EndLegendDragDropSource, libcimplot), Cvoid, ())
end

function BeginLegendPopup(label_id, mouse_button)
    ccall((:ImPlot_BeginLegendPopup, libcimplot), Bool, (Cstring, ImGuiMouseButton), label_id, mouse_button)
end

function EndLegendPopup()
    ccall((:ImPlot_EndLegendPopup, libcimplot), Cvoid, ())
end

function GetStyle()
    ccall((:ImPlot_GetStyle, libcimplot), Ptr{ImPlotStyle}, ())
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
    ccall((:ImPlot_PushStyleColorU32, libcimplot), Cvoid, (ImPlotCol, ImU32), idx, col)
end

function PushStyleColorVec4(idx, col)
    ccall((:ImPlot_PushStyleColorVec4, libcimplot), Cvoid, (ImPlotCol, ImVec4), idx, col)
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

function PushStyleVarVec2(idx, val)
    ccall((:ImPlot_PushStyleVarVec2, libcimplot), Cvoid, (ImPlotStyleVar, ImVec2), idx, val)
end

function PopStyleVar(count)
    ccall((:ImPlot_PopStyleVar, libcimplot), Cvoid, (Cint,), count)
end

function SetNextLineStyle(col, weight)
    ccall((:ImPlot_SetNextLineStyle, libcimplot), Cvoid, (ImVec4, Cfloat), col, weight)
end

function SetNextFillStyle(col, alpha_mod)
    ccall((:ImPlot_SetNextFillStyle, libcimplot), Cvoid, (ImVec4, Cfloat), col, alpha_mod)
end

function SetNextMarkerStyle(marker, size, fill, weight, outline)
    ccall((:ImPlot_SetNextMarkerStyle, libcimplot), Cvoid, (ImPlotMarker, Cfloat, ImVec4, Cfloat, ImVec4), marker, size, fill, weight, outline)
end

function SetNextErrorBarStyle(col, size, weight)
    ccall((:ImPlot_SetNextErrorBarStyle, libcimplot), Cvoid, (ImVec4, Cfloat, Cfloat), col, size, weight)
end

function GetLastItemColor(pOut)
    ccall((:ImPlot_GetLastItemColor, libcimplot), Cvoid, (Ptr{ImVec4},), pOut)
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
    ccall((:ImPlot_PushColormapVec4Ptr, libcimplot), Cvoid, (Ptr{ImVec4}, Cint), colormap, size)
end

function PopColormap(count)
    ccall((:ImPlot_PopColormap, libcimplot), Cvoid, (Cint,), count)
end

function SetColormapVec4Ptr(colormap, size)
    ccall((:ImPlot_SetColormapVec4Ptr, libcimplot), Cvoid, (Ptr{ImVec4}, Cint), colormap, size)
end

function SetColormapPlotColormap(colormap, samples)
    ccall((:ImPlot_SetColormapPlotColormap, libcimplot), Cvoid, (ImPlotColormap, Cint), colormap, samples)
end

function GetColormapSize()
    ccall((:ImPlot_GetColormapSize, libcimplot), Cint, ())
end

function GetColormapColor(pOut, index)
    ccall((:ImPlot_GetColormapColor, libcimplot), Cvoid, (Ptr{ImVec4}, Cint), pOut, index)
end

function LerpColormap(pOut, t)
    ccall((:ImPlot_LerpColormap, libcimplot), Cvoid, (Ptr{ImVec4}, Cfloat), pOut, t)
end

function NextColormapColor(pOut)
    ccall((:ImPlot_NextColormapColor, libcimplot), Cvoid, (Ptr{ImVec4},), pOut)
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
    ccall((:ImPlot_GetPlotDrawList, libcimplot), Ptr{ImDrawList}, ())
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
    ccall((:ImPlot_SetImGuiContext, libcimplot), Cvoid, (Ptr{ImGuiContext},), ctx)
end

function ShowDemoWindow(p_open)
    ccall((:ImPlot_ShowDemoWindow, libcimplot), Cvoid, (Ptr{Bool},), p_open)
end

function PlotLineG(label_id, getter, data, count::Integer, offset::Integer)
    ccall((:ImPlot_PlotLineG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function PlotScatterG(label_id, getter, data, count::Integer, offset::Integer)
    ccall((:ImPlot_PlotScatterG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function PlotShadedG(label_id, getter1, data1, getter2, data2, count::Integer, offset::Integer)
    ccall((:ImPlot_PlotShadedG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter1, data1, getter2, data2, count, offset)
end

function PlotBarsG(label_id, getter, data, count::Integer, width::Real, offset::Integer)
    ccall((:ImPlot_PlotBarsG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, width, offset)
end

function PlotBarsH(label_id, getter, data, count::Integer, height::Real, offset::Integer)
    ccall((:ImPlot_PlotBarsHG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, height, offset)
end

function PlotDigitalG(label_id, getter, data, count::Integer, offset::Integer)
    ccall((:ImPlot_PlotDigitalG, libcimplot), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

# Skipping MacroDefinition: API __attribute__ ( ( __visibility__ ( "default" ) ) )

# Skipping MacroDefinition: EXTERN extern

# Skipping MacroDefinition: CIMGUI_API EXTERN API

# Skipping MacroDefinition: CONST const

export ImPlotPoint, ImPlotRange, ImPlotLimits, ImPlotStyle, ImPlotInputMap, ImPlotContext
export CreateContext, DestroyContext, GetCurrentContext, SetCurrentContext, SetImGuiContext
export EndPlot
export SetNextPlotLimits, SetNextPlotLimitsX, SetNExtPlotLimitsY, LinkNextPlotLimits, FitNextPlotAxes
export SetPlotYAxis, HideNextItem, IsPlotHovered, IsPlotXAxisHovered, IsPlotYAxisHoevered, IsPlotQueried
export DragLineX, DragLineY, DragPoint
export SetLegendLocation, SetMousePosLocation, IsLegendEntryHovered
export BeginLegendDragDropSource, EndLegendDragDropSource, BeginLegendPopup, EndLegendPopup
export PopStyleColor, PopStyleVar
export SetNextLineStyle, SetNExtFillStyle, SetNextMarkerStyle, SetNextErrorBarStyle
export GetStyleColorName, GetMArkerName, PopColormap, GetColormapSize, ShowColormapScale
export GetColormapName, PushPlotClipRect, PopPlotClipRect
export ShowStyleSelector, ShowColormapSelector, ShowUserGuide, ShowDemoWindow

# exports
const PREFIXES = ["ImPlotFlags_", "ImPlotAxisFlags_", "ImPlotCol_", "ImPlotStyleVar_", "ImPlotMarker_", "ImPlotColormap_", "ImPlotLocation_", "ImPlotOrientation_", "ImPlotYAxis_"]
foreach(names(@__MODULE__; all=true)) do s
    for prefix in PREFIXES
        if startswith(string(s), prefix)
            @eval export $s
        end
    end
end

end # module
