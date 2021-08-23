using CEnum

using LibCImGui.CImGuiPack_jll

import LibCImGui: 
    ImVec2, ImVec4,
    ImGuiMouseButton, ImGuiKeyModFlags, ImGuiCond, ImGuiDragDropFlags,
    ImS8, ImU8, ImS16, ImU16, ImS32, ImU32, ImS64, ImU64,
    ImTextureID,
    ImDrawList,
    ImGuiContext,
    ImGuiStyleVar,
    ImGuiStyleMod,
    ImGuiCol,
    ImGuiColorMod,
    ImGuiID,
    ImGuiStoragePair,
    ImGuiTextBuffer,
    ImGuiStorage,
    ImVector_float,
    ImVector_ImU32,
    ImVector_ImGuiStyleMod,
    ImVector_ImGuiColorMod,
    ImRect,
    ImPoolIdx
            
#Temporary patch; CImGui.jl v1.79.0 aliases ImS8 incorrectly; add to imports in new versions
#const ImS8 = Int8
const IMPLOT_AUTO = Cint(-1)
const IMPLOT_AUTO_COL = ImVec4(0,0,0,-1)
export IMPLOT_AUTO, IMPLOT_AUTO_COL


const __time_t = Clong

const time_t = __time_t

struct tm
    tm_sec::Cint
    tm_min::Cint
    tm_hour::Cint
    tm_mday::Cint
    tm_mon::Cint
    tm_year::Cint
    tm_wday::Cint
    tm_yday::Cint
    tm_isdst::Cint
    tm_gmtoff::Clong
    tm_zone::Cstring
end

const ImPlotMarker = Cint

struct ImPlotNextItemData
    Colors::NTuple{5, ImVec4}
    LineWeight::Cfloat
    Marker::ImPlotMarker
    MarkerSize::Cfloat
    MarkerWeight::Cfloat
    FillAlpha::Cfloat
    ErrorBarSize::Cfloat
    ErrorBarWeight::Cfloat
    DigitalBitHeight::Cfloat
    DigitalBitGap::Cfloat
    RenderLine::Bool
    RenderFill::Bool
    RenderMarkerLine::Bool
    RenderMarkerFill::Bool
    HasHidden::Bool
    Hidden::Bool
    HiddenCond::ImGuiCond
end

struct ImPlotTick
    PlotPos::Cdouble
    PixelPos::Cfloat
    LabelSize::ImVec2
    TextOffset::Cint
    Major::Bool
    ShowLabel::Bool
    Level::Cint
end

struct ImVector_ImPlotTick
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImPlotTick}
end

struct ImPlotTickCollection
    Ticks::ImVector_ImPlotTick
    TextBuffer::ImGuiTextBuffer
    TotalWidth::Cfloat
    TotalHeight::Cfloat
    MaxWidth::Cfloat
    MaxHeight::Cfloat
    Size::Cint
end

struct ImPlotAnnotation
    Pos::ImVec2
    Offset::ImVec2
    ColorBg::ImU32
    ColorFg::ImU32
    TextOffset::Cint
    Clamp::Bool
end

struct ImVector_ImPlotAnnotation
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImPlotAnnotation}
end

struct ImPlotAnnotationCollection
    Annotations::ImVector_ImPlotAnnotation
    TextBuffer::ImGuiTextBuffer
    Size::Cint
end

struct ImPlotPointError
    X::Cdouble
    Y::Cdouble
    Neg::Cdouble
    Pos::Cdouble
end

struct ImVector_int
    Size::Cint
    Capacity::Cint
    Data::Ptr{Cint}
end

struct ImVector_bool
    Size::Cint
    Capacity::Cint
    Data::Ptr{Bool}
end

struct ImPlotColormapData
    Keys::ImVector_ImU32
    KeyCounts::ImVector_int
    KeyOffsets::ImVector_int
    Tables::ImVector_ImU32
    TableSizes::ImVector_int
    TableOffsets::ImVector_int
    Text::ImGuiTextBuffer
    TextOffsets::ImVector_int
    Quals::ImVector_bool
    Map::ImGuiStorage
    Count::Cint
end

struct ImPlotTime
    S::time_t
    Us::Cint
end

const ImPlotDateFmt = Cint

const ImPlotTimeFmt = Cint

struct ImPlotDateTimeFmt
    Date::ImPlotDateFmt
    Time::ImPlotTimeFmt
    UseISO8601::Bool
    Use24HourClock::Bool
end

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
function Base.getproperty(x::Ptr{ImPlotInputMap}, f::Symbol)
    f === :PanButton && return Ptr{ImGuiMouseButton}(x + 0)
    f === :PanMod && return Ptr{ImGuiKeyModFlags}(x + 4)
    f === :FitButton && return Ptr{ImGuiMouseButton}(x + 8)
    f === :ContextMenuButton && return Ptr{ImGuiMouseButton}(x + 12)
    f === :BoxSelectButton && return Ptr{ImGuiMouseButton}(x + 16)
    f === :BoxSelectMod && return Ptr{ImGuiKeyModFlags}(x + 20)
    f === :BoxSelectCancelButton && return Ptr{ImGuiMouseButton}(x + 24)
    f === :QueryButton && return Ptr{ImGuiMouseButton}(x + 28)
    f === :QueryMod && return Ptr{ImGuiKeyModFlags}(x + 32)
    f === :QueryToggleMod && return Ptr{ImGuiKeyModFlags}(x + 36)
    f === :HorizontalMod && return Ptr{ImGuiKeyModFlags}(x + 40)
    f === :VerticalMod && return Ptr{ImGuiKeyModFlags}(x + 44)
    return getfield(x, f)
end

function Base.setproperty!(x::Ptr{ImPlotInputMap}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct ImBufferWriter
    Buffer::Cstring
    Size::Cint
    Pos::Cint
end

struct ImPlotRange
    Min::Cdouble
    Max::Cdouble
end

struct ImPlotNextPlotData
    XRangeCond::ImGuiCond
    YRangeCond::NTuple{3, ImGuiCond}
    X::ImPlotRange
    Y::NTuple{3, ImPlotRange}
    HasXRange::Bool
    HasYRange::NTuple{3, Bool}
    ShowDefaultTicksX::Bool
    ShowDefaultTicksY::NTuple{3, Bool}
    FitX::Bool
    FitY::NTuple{3, Bool}
    LinkedXmin::Ptr{Cdouble}
    LinkedXmax::Ptr{Cdouble}
    LinkedYmin::NTuple{3, Ptr{Cdouble}}
    LinkedYmax::NTuple{3, Ptr{Cdouble}}
end

const ImPlotFlags = Cint

const ImPlotAxisFlags = Cint

const ImPlotOrientation = Cint

struct ImPlotAxis
    Flags::ImPlotAxisFlags
    PreviousFlags::ImPlotAxisFlags
    Range::ImPlotRange
    Pixels::Cfloat
    Orientation::ImPlotOrientation
    Dragging::Bool
    ExtHovered::Bool
    AllHovered::Bool
    Present::Bool
    HasRange::Bool
    LinkedMin::Ptr{Cdouble}
    LinkedMax::Ptr{Cdouble}
    PickerTimeMin::ImPlotTime
    PickerTimeMax::ImPlotTime
    PickerLevel::Cint
    ColorMaj::ImU32
    ColorMin::ImU32
    ColorTxt::ImU32
    RangeCond::ImGuiCond
    HoverRect::ImRect
end

struct ImPlotLegendData
    Indices::ImVector_int
    Labels::ImGuiTextBuffer
end

struct ImPlotItem
    ID::ImGuiID
    Color::ImU32
    NameOffset::Cint
    Show::Bool
    LegendHovered::Bool
    SeenThisFrame::Bool
end

struct ImVector_ImPlotItem
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImPlotItem}
end

struct ImPool_ImPlotItem
    Buf::ImVector_ImPlotItem
    Map::ImGuiStorage
    FreeIdx::ImPoolIdx
end

const ImPlotLocation = Cint

struct ImPlotPlot
    ID::ImGuiID
    Flags::ImPlotFlags
    PreviousFlags::ImPlotFlags
    XAxis::ImPlotAxis
    YAxis::NTuple{3, ImPlotAxis}
    LegendData::ImPlotLegendData
    Items::ImPool_ImPlotItem
    SelectStart::ImVec2
    QueryStart::ImVec2
    QueryRect::ImRect
    Selecting::Bool
    ContextLocked::Bool
    Querying::Bool
    Queried::Bool
    DraggingQuery::Bool
    LegendHovered::Bool
    LegendOutside::Bool
    LegendFlipSideNextFrame::Bool
    FrameHovered::Bool
    PlotHovered::Bool
    ColormapIdx::Cint
    CurrentYAxis::Cint
    MousePosLocation::ImPlotLocation
    LegendLocation::ImPlotLocation
    LegendOrientation::ImPlotOrientation
    FrameRect::ImRect
    CanvasRect::ImRect
    PlotRect::ImRect
    AxesRect::ImRect
    LegendRect::ImRect
end

mutable struct ImPlotAxisColor end

const ImPlotColormap = Cint

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
    Colormap::ImPlotColormap
    AntiAliasedLines::Bool
    UseLocalTime::Bool
    UseISO8601::Bool
    Use24HourClock::Bool
end
function Base.getproperty(x::Ptr{ImPlotStyle}, f::Symbol)
    f === :LineWeight && return Ptr{Cfloat}(x + 0)
    f === :Marker && return Ptr{Cint}(x + 4)
    f === :MarkerSize && return Ptr{Cfloat}(x + 8)
    f === :MarkerWeight && return Ptr{Cfloat}(x + 12)
    f === :FillAlpha && return Ptr{Cfloat}(x + 16)
    f === :ErrorBarSize && return Ptr{Cfloat}(x + 20)
    f === :ErrorBarWeight && return Ptr{Cfloat}(x + 24)
    f === :DigitalBitHeight && return Ptr{Cfloat}(x + 28)
    f === :DigitalBitGap && return Ptr{Cfloat}(x + 32)
    f === :PlotBorderSize && return Ptr{Cfloat}(x + 36)
    f === :MinorAlpha && return Ptr{Cfloat}(x + 40)
    f === :MajorTickLen && return Ptr{ImVec2}(x + 44)
    f === :MinorTickLen && return Ptr{ImVec2}(x + 52)
    f === :MajorTickSize && return Ptr{ImVec2}(x + 60)
    f === :MinorTickSize && return Ptr{ImVec2}(x + 68)
    f === :MajorGridSize && return Ptr{ImVec2}(x + 76)
    f === :MinorGridSize && return Ptr{ImVec2}(x + 84)
    f === :PlotPadding && return Ptr{ImVec2}(x + 92)
    f === :LabelPadding && return Ptr{ImVec2}(x + 100)
    f === :LegendPadding && return Ptr{ImVec2}(x + 108)
    f === :LegendInnerPadding && return Ptr{ImVec2}(x + 116)
    f === :LegendSpacing && return Ptr{ImVec2}(x + 124)
    f === :MousePosPadding && return Ptr{ImVec2}(x + 132)
    f === :AnnotationPadding && return Ptr{ImVec2}(x + 140)
    f === :FitPadding && return Ptr{ImVec2}(x + 148)
    f === :PlotDefaultSize && return Ptr{ImVec2}(x + 156)
    f === :PlotMinSize && return Ptr{ImVec2}(x + 164)
    f === :Colors && return Ptr{NTuple{24, ImVec4}}(x + 172)
    f === :Colormap && return Ptr{ImPlotColormap}(x + 556)
    f === :AntiAliasedLines && return Ptr{Bool}(x + 560)
    f === :UseLocalTime && return Ptr{Bool}(x + 561)
    f === :UseISO8601 && return Ptr{Bool}(x + 562)
    f === :Use24HourClock && return Ptr{Bool}(x + 563)
    return getfield(x, f)
end

function Base.setproperty!(x::Ptr{ImPlotStyle}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct ImPlotLimits
    X::ImPlotRange
    Y::ImPlotRange
end

struct ImPlotPoint
    x::Cdouble
    y::Cdouble
end

struct ImVector_ImPlotPlot
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImPlotPlot}
end

struct ImPool_ImPlotPlot
    Buf::ImVector_ImPlotPlot
    Map::ImGuiStorage
    FreeIdx::ImPoolIdx
end

const ImPlotScale = Cint

struct ImVector_ImPlotColormap
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImPlotColormap}
end

struct ImVector_double
    Size::Cint
    Capacity::Cint
    Data::Ptr{Cdouble}
end

struct ImPlotContext
    Plots::ImPool_ImPlotPlot
    CurrentPlot::Ptr{ImPlotPlot}
    CurrentItem::Ptr{ImPlotItem}
    PreviousItem::Ptr{ImPlotItem}
    CTicks::ImPlotTickCollection
    XTicks::ImPlotTickCollection
    YTicks::NTuple{3, ImPlotTickCollection}
    YAxisReference::NTuple{3, Cfloat}
    Annotations::ImPlotAnnotationCollection
    Scales::NTuple{3, ImPlotScale}
    PixelRange::NTuple{3, ImRect}
    Mx::Cdouble
    My::NTuple{3, Cdouble}
    LogDenX::Cdouble
    LogDenY::NTuple{3, Cdouble}
    ExtentsX::ImPlotRange
    ExtentsY::NTuple{3, ImPlotRange}
    FitThisFrame::Bool
    FitX::Bool
    FitY::NTuple{3, Bool}
    RenderX::Bool
    RenderY::NTuple{3, Bool}
    ChildWindowMade::Bool
    Style::ImPlotStyle
    ColorModifiers::ImVector_ImGuiColorMod
    StyleModifiers::ImVector_ImGuiStyleMod
    ColormapData::ImPlotColormapData
    ColormapModifiers::ImVector_ImPlotColormap
    Tm::tm
    Temp1::ImVector_double
    Temp2::ImVector_double
    VisibleItemCount::Cint
    DigitalPlotItemCnt::Cint
    DigitalPlotOffset::Cint
    NextPlotData::ImPlotNextPlotData
    NextItemData::ImPlotNextItemData
    InputMap::ImPlotInputMap
    MousePos::NTuple{3, ImPlotPoint}
end

const ImPlotCol = Cint

const ImPlotStyleVar = Cint

const ImPlotYAxis = Cint

const ImPlotBin = Cint

const ImPlotTimeUnit = Cint

struct ImVector_ImS16
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImS16}
end

struct ImVector_ImS32
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImS32}
end

struct ImVector_ImS64
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImS64}
end

struct ImVector_ImS8
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImS8}
end

struct ImVector_ImU16
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImU16}
end

struct ImVector_ImU64
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImU64}
end

struct ImVector_ImU8
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImU8}
end

@cenum ImPlotFlags_::UInt32 begin
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

@cenum ImPlotAxisFlags_::UInt32 begin
    ImPlotAxisFlags_None = 0
    ImPlotAxisFlags_NoLabel = 1
    ImPlotAxisFlags_NoGridLines = 2
    ImPlotAxisFlags_NoTickMarks = 4
    ImPlotAxisFlags_NoTickLabels = 8
    ImPlotAxisFlags_LogScale = 16
    ImPlotAxisFlags_Time = 32
    ImPlotAxisFlags_Invert = 64
    ImPlotAxisFlags_AutoFit = 128
    ImPlotAxisFlags_LockMin = 256
    ImPlotAxisFlags_LockMax = 512
    ImPlotAxisFlags_Lock = 768
    ImPlotAxisFlags_NoDecorations = 15
end

@cenum ImPlotCol_::UInt32 begin
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

@cenum ImPlotStyleVar_::UInt32 begin
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

@cenum ImPlotMarker_::Int32 begin
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

@cenum ImPlotColormap_::UInt32 begin
    ImPlotColormap_Deep = 0
    ImPlotColormap_Dark = 1
    ImPlotColormap_Pastel = 2
    ImPlotColormap_Paired = 3
    ImPlotColormap_Viridis = 4
    ImPlotColormap_Plasma = 5
    ImPlotColormap_Hot = 6
    ImPlotColormap_Cool = 7
    ImPlotColormap_Pink = 8
    ImPlotColormap_Jet = 9
    ImPlotColormap_Twilight = 10
    ImPlotColormap_RdBu = 11
    ImPlotColormap_BrBG = 12
    ImPlotColormap_PiYG = 13
    ImPlotColormap_Spectral = 14
    ImPlotColormap_Greys = 15
end

@cenum ImPlotLocation_::UInt32 begin
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

@cenum ImPlotOrientation_::UInt32 begin
    ImPlotOrientation_Horizontal = 0
    ImPlotOrientation_Vertical = 1
end

@cenum ImPlotYAxis_::UInt32 begin
    ImPlotYAxis_1 = 0
    ImPlotYAxis_2 = 1
    ImPlotYAxis_3 = 2
end

@cenum ImPlotBin_::Int32 begin
    ImPlotBin_Sqrt = -1
    ImPlotBin_Sturges = -2
    ImPlotBin_Rice = -3
    ImPlotBin_Scott = -4
end

@cenum ImPlotScale_::UInt32 begin
    ImPlotScale_LinLin = 0
    ImPlotScale_LogLin = 1
    ImPlotScale_LinLog = 2
    ImPlotScale_LogLog = 3
end

@cenum ImPlotTimeUnit_::UInt32 begin
    ImPlotTimeUnit_Us = 0
    ImPlotTimeUnit_Ms = 1
    ImPlotTimeUnit_S = 2
    ImPlotTimeUnit_Min = 3
    ImPlotTimeUnit_Hr = 4
    ImPlotTimeUnit_Day = 5
    ImPlotTimeUnit_Mo = 6
    ImPlotTimeUnit_Yr = 7
    ImPlotTimeUnit_COUNT = 8
end

@cenum ImPlotDateFmt_::UInt32 begin
    ImPlotDateFmt_None = 0
    ImPlotDateFmt_DayMo = 1
    ImPlotDateFmt_DayMoYr = 2
    ImPlotDateFmt_MoYr = 3
    ImPlotDateFmt_Mo = 4
    ImPlotDateFmt_Yr = 5
end

@cenum ImPlotTimeFmt_::UInt32 begin
    ImPlotTimeFmt_None = 0
    ImPlotTimeFmt_Us = 1
    ImPlotTimeFmt_SUs = 2
    ImPlotTimeFmt_SMs = 3
    ImPlotTimeFmt_S = 4
    ImPlotTimeFmt_HrMinSMs = 5
    ImPlotTimeFmt_HrMinS = 6
    ImPlotTimeFmt_HrMin = 7
    ImPlotTimeFmt_Hr = 8
end

function ImPlotPoint_ImPlotPoint_Nil()
    ccall((:ImPlotPoint_ImPlotPoint_Nil, libcimgui), Ptr{ImPlotPoint}, ())
end

function ImPlotPoint_ImPlotPoint_double(_x::Cdouble, _y::Cdouble)
    ccall((:ImPlotPoint_ImPlotPoint_double, libcimgui), Ptr{ImPlotPoint}, (Cdouble, Cdouble), _x, _y)
end

function ImPlotPoint_ImPlotPoint_Vec2(p::ImVec2)
    ccall((:ImPlotPoint_ImPlotPoint_Vec2, libcimgui), Ptr{ImPlotPoint}, (ImVec2,), p)
end

function ImPlotRange_ImPlotRange_Nil()
    ccall((:ImPlotRange_ImPlotRange_Nil, libcimgui), Ptr{ImPlotRange}, ())
end

function ImPlotRange_ImPlotRange_double(_min::Cdouble, _max::Cdouble)
    ccall((:ImPlotRange_ImPlotRange_double, libcimgui), Ptr{ImPlotRange}, (Cdouble, Cdouble), _min, _max)
end

function Contains(self::Union{ImPlotRange, Ptr{ImPlotRange}}, value::Real)
    ccall((:ImPlotRange_Contains, libcimgui), Bool, (Ptr{ImPlotRange}, Cdouble), self, value)
end

function Size(self::Union{ImPlotRange, Ptr{ImPlotRange}})
    ccall((:ImPlotRange_Size, libcimgui), Cdouble, (Ptr{ImPlotRange},), self)
end

function ImPlotLimits_ImPlotLimits_Nil()
    ccall((:ImPlotLimits_ImPlotLimits_Nil, libcimgui), Ptr{ImPlotLimits}, ())
end

function ImPlotLimits_destroy(self)
    ccall((:ImPlotLimits_destroy, libcimgui), Cvoid, (Ptr{ImPlotLimits},), self)
end

function ImPlotLimits_ImPlotLimits_double(x_min::Cdouble, x_max::Cdouble, y_min::Cdouble, y_max::Cdouble)
    ccall((:ImPlotLimits_ImPlotLimits_double, libcimgui), Ptr{ImPlotLimits}, (Cdouble, Cdouble, Cdouble, Cdouble), x_min, x_max, y_min, y_max)
end

function Contains(self::Union{ImPlotLimits, Ptr{ImPlotLimits}}, p::ImPlotPoint)
    ccall((:ImPlotLimits_Contains_PlotPoInt, libcimgui), Bool, (Ptr{ImPlotLimits}, ImPlotPoint), self, p)
end

function Contains(self::Union{ImPlotLimits, Ptr{ImPlotLimits}}, x::Real, y::Real)
    ccall((:ImPlotLimits_Contains_double, libcimgui), Bool, (Ptr{ImPlotLimits}, Cdouble, Cdouble), self, x, y)
end

function Min(pOut::Union{ImPlotPoint, Ptr{ImPlotPoint}}, self::Union{ImPlotLimits, AbstractArray{ImPlotLimits}})
    ccall((:ImPlotLimits_Min, libcimgui), Cvoid, (Ptr{ImPlotPoint}, Ptr{ImPlotLimits}), pOut, self)
end

function Max(pOut::Union{ImPlotPoint, Ptr{ImPlotPoint}}, self::Union{ImPlotLimits, AbstractArray{ImPlotLimits}})
    ccall((:ImPlotLimits_Max, libcimgui), Cvoid, (Ptr{ImPlotPoint}, Ptr{ImPlotLimits}), pOut, self)
end

function ImPlotStyle()
    ccall((:ImPlotStyle_ImPlotStyle, libcimgui), Ptr{ImPlotStyle}, ())
end

function Base.finalizer(self::Union{Ptr{ImPlotStyle}, ImPlotStyle})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotStyle_destroy, libcimgui), Cvoid, (Ptr{ImPlotStyle},), self)
end

function CreateContext()
    ccall((:ImPlot_CreateContext, libcimgui), Ptr{ImPlotContext}, ())
end

function DestroyContext(ctx)
    ccall((:ImPlot_DestroyContext, libcimgui), Cvoid, (Ptr{ImPlotContext},), ctx)
end

function GetCurrentContext()
    ccall((:ImPlot_GetCurrentContext, libcimgui), Ptr{ImPlotContext}, ())
end

function SetCurrentContext(ctx)
    ccall((:ImPlot_SetCurrentContext, libcimgui), Cvoid, (Ptr{ImPlotContext},), ctx)
end

function SetImGuiContext(ctx)
    ccall((:ImPlot_SetImGuiContext, libcimgui), Cvoid, (Ptr{ImGuiContext},), ctx)
end

function BeginPlot(title_id, x_label = C_NULL, y_label = C_NULL, size::ImVec2 = ImVec2(-1, 0), flags = ImPlotFlags_None, x_flags = ImPlotAxisFlags_None, y_flags = ImPlotAxisFlags_None, y2_flags = ImPlotAxisFlags_NoGridLines, y3_flags = ImPlotAxisFlags_NoGridLines, y2_label = C_NULL, y3_label = C_NULL)
    ccall((:ImPlot_BeginPlot, libcimgui), Bool, (Cstring, Cstring, Cstring, ImVec2, ImPlotFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags, Cstring, Cstring), title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags, y2_label, y3_label)
end

function EndPlot()
    ccall((:ImPlot_EndPlot, libcimgui), Cvoid, ())
end

function PlotLine(label_id, values::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotLine_FloatPtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotLine_doublePtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotLine_S8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotLine_U8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotLine_S16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotLine_U16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotLine_S32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotLine_U32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotLine_S64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotLine_U64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotLine_FloatPtrFloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotLine_doublePtrdoublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotLine_S8PtrS8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotLine_U8PtrU8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotLine_S16PtrS16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotLine_U16PtrU16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotLine_S32PtrS32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotLine_U32PtrU32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotLine_S64PtrS64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotLine_U64PtrU64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, values::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotScatter_FloatPtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotScatter_doublePtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotScatter_S8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotScatter_U8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotScatter_S16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotScatter_U16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotScatter_S32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotScatter_U32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotScatter_S64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotScatter_U64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotScatter_FloatPtrFloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotScatter_doublePtrdoublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotScatter_S8PtrS8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotScatter_U8PtrU8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotScatter_S16PtrS16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotScatter_U16PtrU16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotScatter_S32PtrS32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotScatter_U32PtrU32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotScatter_S64PtrS64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotScatter_U64PtrU64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, values::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotStairs_FloatPtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotStairs_doublePtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotStairs_S8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotStairs_U8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotStairs_S16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotStairs_U16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotStairs_S32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotStairs_U32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotStairs_S64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotStairs_U64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotStairs_FloatPtrFloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotStairs_doublePtrdoublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotStairs_S8PtrS8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotStairs_U8PtrU8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotStairs_S16PtrS16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotStairs_U16PtrU16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotStairs_S32PtrS32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotStairs_U32PtrU32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotStairs_S64PtrS64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotStairs_U64PtrU64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsG(label_id, getter, data, count::Integer, offset::Integer = 0)
    ccall((:ImPlot_PlotStairsG, libcimgui), Cvoid, (Cstring, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function PlotShaded(label_id, values::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotShaded_FloatPtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotShaded_doublePtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotShaded_S8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotShaded_U8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotShaded_S16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotShaded_U16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotShaded_S32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotShaded_U32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotShaded_S64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotShaded_U64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotShaded_FloatPtrFloatPtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotShaded_doublePtrdoublePtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotShaded_S8PtrS8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotShaded_U8PtrU8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotShaded_S16PtrS16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotShaded_U16PtrU16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotShaded_S32PtrS32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotShaded_U32PtrU32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotShaded_S64PtrS64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotShaded_U64PtrU64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys1::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys2::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotShaded_FloatPtrFloatPtrFloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys1::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys2::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotShaded_doublePtrdoublePtrdoublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys1::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys2::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotShaded_S8PtrS8PtrS8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys1::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys2::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotShaded_U8PtrU8PtrU8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys1::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys2::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotShaded_S16PtrS16PtrS16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys1::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys2::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotShaded_U16PtrU16PtrU16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys1::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys2::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotShaded_S32PtrS32PtrS32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys1::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys2::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotShaded_U32PtrU32PtrU32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys1::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys2::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotShaded_S64PtrS64PtrS64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys1::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys2::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotShaded_U64PtrU64PtrU64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotBars(label_id, values::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, width::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotBars_FloatPtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, width::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotBars_doublePtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, width::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotBars_S8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, width::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotBars_U8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, width::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotBars_S16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, width::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotBars_U16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, width::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotBars_S32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, width::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotBars_U32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, width::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotBars_S64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, width::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotBars_U64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotBars_FloatPtrFloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotBars_doublePtrdoublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotBars_S8PtrS8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotBars_U8PtrU8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotBars_S16PtrS16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotBars_U16PtrU16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotBars_S32PtrS32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotBars_U32PtrU32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotBars_S64PtrS64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, width::Real, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotBars_U64PtrU64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsH(label_id, values::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, height::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotBarsH_FloatPtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, height::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotBarsH_doublePtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, height::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotBarsH_S8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, height::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotBarsH_U8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, height::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotBarsH_S16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, height::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotBarsH_U16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, height::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotBarsH_S32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, height::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotBarsH_U32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, height::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotBarsH_S64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, height::Real = 0.67, shift::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotBarsH_U64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotBarsH_FloatPtrFloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotBarsH_doublePtrdoublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotBarsH_S8PtrS8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotBarsH_U8PtrU8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotBarsH_S16PtrS16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotBarsH_U16PtrU16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotBarsH_S32PtrS32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotBarsH_U32PtrU32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotBarsH_S64PtrS64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, height::Real, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotBarsH_U64PtrU64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, err::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotErrorBars_FloatPtrFloatPtrFloatPtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, err::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotErrorBars_doublePtrdoublePtrdoublePtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, err::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotErrorBars_S8PtrS8PtrS8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, err::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotErrorBars_U8PtrU8PtrU8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, err::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotErrorBars_S16PtrS16PtrS16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, err::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotErrorBars_U16PtrU16PtrU16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, err::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotErrorBars_S32PtrS32PtrS32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, err::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotErrorBars_U32PtrU32PtrU32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, err::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotErrorBars_S64PtrS64PtrS64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, err::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotErrorBars_U64PtrU64PtrU64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, neg::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, pos::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotErrorBars_FloatPtrFloatPtrFloatPtrFloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, neg::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, pos::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotErrorBars_doublePtrdoublePtrdoublePtrdoublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, neg::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, pos::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotErrorBars_S8PtrS8PtrS8PtrS8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, neg::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, pos::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotErrorBars_U8PtrU8PtrU8PtrU8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, neg::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, pos::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotErrorBars_S16PtrS16PtrS16PtrS16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, neg::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, pos::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotErrorBars_U16PtrU16PtrU16PtrU16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, neg::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, pos::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotErrorBars_S32PtrS32PtrS32PtrS32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, neg::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, pos::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotErrorBars_U32PtrU32PtrU32PtrU32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, neg::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, pos::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotErrorBars_S64PtrS64PtrS64PtrS64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, neg::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, pos::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotErrorBars_U64PtrU64PtrU64PtrU64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, err::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotErrorBarsH_FloatPtrFloatPtrFloatPtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, err::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotErrorBarsH_doublePtrdoublePtrdoublePtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, err::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotErrorBarsH_S8PtrS8PtrS8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, err::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotErrorBarsH_U8PtrU8PtrU8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, err::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotErrorBarsH_S16PtrS16PtrS16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, err::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotErrorBarsH_U16PtrU16PtrU16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, err::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotErrorBarsH_S32PtrS32PtrS32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, err::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotErrorBarsH_U32PtrU32PtrU32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, err::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotErrorBarsH_S64PtrS64PtrS64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, err::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotErrorBarsH_U64PtrU64PtrU64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, neg::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, pos::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotErrorBarsH_FloatPtrFloatPtrFloatPtrFloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, neg::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, pos::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotErrorBarsH_doublePtrdoublePtrdoublePtrdoublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, neg::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, pos::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotErrorBarsH_S8PtrS8PtrS8PtrS8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, neg::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, pos::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotErrorBarsH_U8PtrU8PtrU8PtrU8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, neg::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, pos::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotErrorBarsH_S16PtrS16PtrS16PtrS16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, neg::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, pos::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotErrorBarsH_U16PtrU16PtrU16PtrU16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, neg::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, pos::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotErrorBarsH_S32PtrS32PtrS32PtrS32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, neg::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, pos::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotErrorBarsH_U32PtrU32PtrU32PtrU32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, neg::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, pos::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotErrorBarsH_S64PtrS64PtrS64PtrS64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, neg::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, pos::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotErrorBarsH_U64PtrU64PtrU64PtrU64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotStems(label_id, values::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotStems_FloatPtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotStems_doublePtrInt, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotStems_S8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotStems_U8PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotStems_S16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotStems_U16PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotStems_S32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotStems_U32PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotStems_S64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, y_ref::Real = 0, xscale::Real = 1, x0::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotStems_U64PtrInt, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotStems_FloatPtrFloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotStems_doublePtrdoublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotStems_S8PtrS8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotStems_U8PtrU8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotStems_S16PtrS16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotStems_U16PtrU16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotStems_S32PtrS32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotStems_U32PtrU32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotStems_S64PtrS64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, y_ref::Real = 0, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotStems_U64PtrU64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotVLines(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotVLines_FloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, count, offset, stride)
end

function PlotVLines(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotVLines_doublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, count, offset, stride)
end

function PlotVLines(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotVLines_S8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, count, offset, stride)
end

function PlotVLines(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotVLines_U8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, count, offset, stride)
end

function PlotVLines(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotVLines_S16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, count, offset, stride)
end

function PlotVLines(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotVLines_U16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, count, offset, stride)
end

function PlotVLines(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotVLines_S32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, count, offset, stride)
end

function PlotVLines(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotVLines_U32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, count, offset, stride)
end

function PlotVLines(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotVLines_S64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, count, offset, stride)
end

function PlotVLines(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotVLines_U64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, count, offset, stride)
end

function PlotHLines(label_id, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotHLines_FloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cint, Cint), label_id, ys, count, offset, stride)
end

function PlotHLines(label_id, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotHLines_doublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cint, Cint), label_id, ys, count, offset, stride)
end

function PlotHLines(label_id, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotHLines_S8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cint, Cint), label_id, ys, count, offset, stride)
end

function PlotHLines(label_id, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotHLines_U8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cint, Cint), label_id, ys, count, offset, stride)
end

function PlotHLines(label_id, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotHLines_S16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cint, Cint), label_id, ys, count, offset, stride)
end

function PlotHLines(label_id, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotHLines_U16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cint, Cint), label_id, ys, count, offset, stride)
end

function PlotHLines(label_id, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotHLines_S32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cint, Cint), label_id, ys, count, offset, stride)
end

function PlotHLines(label_id, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotHLines_U32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cint, Cint), label_id, ys, count, offset, stride)
end

function PlotHLines(label_id, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotHLines_S64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cint, Cint), label_id, ys, count, offset, stride)
end

function PlotHLines(label_id, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotHLines_U64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cint, Cint), label_id, ys, count, offset, stride)
end

function PlotPieChart(label_ids::Union{Ptr{Nothing}, String, AbstractArray{String}}, values::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, x::Real, y::Real, radius::Real, normalize = false, label_fmt = "%.1f", angle0::Real = 90)
    ccall((:ImPlot_PlotPieChart_FloatPtr, libcimgui), Cvoid, (Ptr{Cstring}, Ptr{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids::Union{Ptr{Nothing}, String, AbstractArray{String}}, values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, x::Real, y::Real, radius::Real, normalize = false, label_fmt = "%.1f", angle0::Real = 90)
    ccall((:ImPlot_PlotPieChart_doublePtr, libcimgui), Cvoid, (Ptr{Cstring}, Ptr{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids::Union{Ptr{Nothing}, String, AbstractArray{String}}, values::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, x::Real, y::Real, radius::Real, normalize = false, label_fmt = "%.1f", angle0::Real = 90)
    ccall((:ImPlot_PlotPieChart_S8Ptr, libcimgui), Cvoid, (Ptr{Cstring}, Ptr{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids::Union{Ptr{Nothing}, String, AbstractArray{String}}, values::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, x::Real, y::Real, radius::Real, normalize = false, label_fmt = "%.1f", angle0::Real = 90)
    ccall((:ImPlot_PlotPieChart_U8Ptr, libcimgui), Cvoid, (Ptr{Cstring}, Ptr{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids::Union{Ptr{Nothing}, String, AbstractArray{String}}, values::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, x::Real, y::Real, radius::Real, normalize = false, label_fmt = "%.1f", angle0::Real = 90)
    ccall((:ImPlot_PlotPieChart_S16Ptr, libcimgui), Cvoid, (Ptr{Cstring}, Ptr{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids::Union{Ptr{Nothing}, String, AbstractArray{String}}, values::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, x::Real, y::Real, radius::Real, normalize = false, label_fmt = "%.1f", angle0::Real = 90)
    ccall((:ImPlot_PlotPieChart_U16Ptr, libcimgui), Cvoid, (Ptr{Cstring}, Ptr{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids::Union{Ptr{Nothing}, String, AbstractArray{String}}, values::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, x::Real, y::Real, radius::Real, normalize = false, label_fmt = "%.1f", angle0::Real = 90)
    ccall((:ImPlot_PlotPieChart_S32Ptr, libcimgui), Cvoid, (Ptr{Cstring}, Ptr{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids::Union{Ptr{Nothing}, String, AbstractArray{String}}, values::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, x::Real, y::Real, radius::Real, normalize = false, label_fmt = "%.1f", angle0::Real = 90)
    ccall((:ImPlot_PlotPieChart_U32Ptr, libcimgui), Cvoid, (Ptr{Cstring}, Ptr{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids::Union{Ptr{Nothing}, String, AbstractArray{String}}, values::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, x::Real, y::Real, radius::Real, normalize = false, label_fmt = "%.1f", angle0::Real = 90)
    ccall((:ImPlot_PlotPieChart_S64Ptr, libcimgui), Cvoid, (Ptr{Cstring}, Ptr{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids::Union{Ptr{Nothing}, String, AbstractArray{String}}, values::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, x::Real, y::Real, radius::Real, normalize = false, label_fmt = "%.1f", angle0::Real = 90)
    ccall((:ImPlot_PlotPieChart_U64Ptr, libcimgui), Cvoid, (Ptr{Cstring}, Ptr{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Bool, Cstring, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotHeatmap(label_id, values::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, rows::Integer, cols::Integer, scale_min::Real = 0, scale_max::Real = 0, label_fmt = "%.1f", bounds_min::ImPlotPoint = ImPlotPoint(0, 0), bounds_max::ImPlotPoint = ImPlotPoint(1, 1))
    ccall((:ImPlot_PlotHeatmap_FloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, rows::Integer, cols::Integer, scale_min::Real = 0, scale_max::Real = 0, label_fmt = "%.1f", bounds_min::ImPlotPoint = ImPlotPoint(0, 0), bounds_max::ImPlotPoint = ImPlotPoint(1, 1))
    ccall((:ImPlot_PlotHeatmap_doublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, rows::Integer, cols::Integer, scale_min::Real = 0, scale_max::Real = 0, label_fmt = "%.1f", bounds_min::ImPlotPoint = ImPlotPoint(0, 0), bounds_max::ImPlotPoint = ImPlotPoint(1, 1))
    ccall((:ImPlot_PlotHeatmap_S8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, rows::Integer, cols::Integer, scale_min::Real = 0, scale_max::Real = 0, label_fmt = "%.1f", bounds_min::ImPlotPoint = ImPlotPoint(0, 0), bounds_max::ImPlotPoint = ImPlotPoint(1, 1))
    ccall((:ImPlot_PlotHeatmap_U8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, rows::Integer, cols::Integer, scale_min::Real = 0, scale_max::Real = 0, label_fmt = "%.1f", bounds_min::ImPlotPoint = ImPlotPoint(0, 0), bounds_max::ImPlotPoint = ImPlotPoint(1, 1))
    ccall((:ImPlot_PlotHeatmap_S16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, rows::Integer, cols::Integer, scale_min::Real = 0, scale_max::Real = 0, label_fmt = "%.1f", bounds_min::ImPlotPoint = ImPlotPoint(0, 0), bounds_max::ImPlotPoint = ImPlotPoint(1, 1))
    ccall((:ImPlot_PlotHeatmap_U16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, rows::Integer, cols::Integer, scale_min::Real = 0, scale_max::Real = 0, label_fmt = "%.1f", bounds_min::ImPlotPoint = ImPlotPoint(0, 0), bounds_max::ImPlotPoint = ImPlotPoint(1, 1))
    ccall((:ImPlot_PlotHeatmap_S32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, rows::Integer, cols::Integer, scale_min::Real = 0, scale_max::Real = 0, label_fmt = "%.1f", bounds_min::ImPlotPoint = ImPlotPoint(0, 0), bounds_max::ImPlotPoint = ImPlotPoint(1, 1))
    ccall((:ImPlot_PlotHeatmap_U32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, rows::Integer, cols::Integer, scale_min::Real = 0, scale_max::Real = 0, label_fmt = "%.1f", bounds_min::ImPlotPoint = ImPlotPoint(0, 0), bounds_max::ImPlotPoint = ImPlotPoint(1, 1))
    ccall((:ImPlot_PlotHeatmap_S64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, rows::Integer, cols::Integer, scale_min::Real = 0, scale_max::Real = 0, label_fmt = "%.1f", bounds_min::ImPlotPoint = ImPlotPoint(0, 0), bounds_max::ImPlotPoint = ImPlotPoint(1, 1))
    ccall((:ImPlot_PlotHeatmap_U64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Cint, Cint, Cdouble, Cdouble, Cstring, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHistogram(label_id, values::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, bins::Integer = ImPlotBin_Sturges, cumulative = false, density = false, range::ImPlotRange = ImPlotRange(), outliers = true, bar_scale::Real = 1.0)
    ccall((:ImPlot_PlotHistogram_FloatPtr, libcimgui), Cdouble, (Cstring, Ptr{Cfloat}, Cint, Cint, Bool, Bool, ImPlotRange, Bool, Cdouble), label_id, values, count, bins, cumulative, density, range, outliers, bar_scale)
end

function PlotHistogram(label_id, values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, bins::Integer = ImPlotBin_Sturges, cumulative = false, density = false, range::ImPlotRange = ImPlotRange(), outliers = true, bar_scale::Real = 1.0)
    ccall((:ImPlot_PlotHistogram_doublePtr, libcimgui), Cdouble, (Cstring, Ptr{Cdouble}, Cint, Cint, Bool, Bool, ImPlotRange, Bool, Cdouble), label_id, values, count, bins, cumulative, density, range, outliers, bar_scale)
end

function PlotHistogram(label_id, values::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, bins::Integer = ImPlotBin_Sturges, cumulative = false, density = false, range::ImPlotRange = ImPlotRange(), outliers = true, bar_scale::Real = 1.0)
    ccall((:ImPlot_PlotHistogram_S8Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImS8}, Cint, Cint, Bool, Bool, ImPlotRange, Bool, Cdouble), label_id, values, count, bins, cumulative, density, range, outliers, bar_scale)
end

function PlotHistogram(label_id, values::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, bins::Integer = ImPlotBin_Sturges, cumulative = false, density = false, range::ImPlotRange = ImPlotRange(), outliers = true, bar_scale::Real = 1.0)
    ccall((:ImPlot_PlotHistogram_U8Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImU8}, Cint, Cint, Bool, Bool, ImPlotRange, Bool, Cdouble), label_id, values, count, bins, cumulative, density, range, outliers, bar_scale)
end

function PlotHistogram(label_id, values::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, bins::Integer = ImPlotBin_Sturges, cumulative = false, density = false, range::ImPlotRange = ImPlotRange(), outliers = true, bar_scale::Real = 1.0)
    ccall((:ImPlot_PlotHistogram_S16Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImS16}, Cint, Cint, Bool, Bool, ImPlotRange, Bool, Cdouble), label_id, values, count, bins, cumulative, density, range, outliers, bar_scale)
end

function PlotHistogram(label_id, values::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, bins::Integer = ImPlotBin_Sturges, cumulative = false, density = false, range::ImPlotRange = ImPlotRange(), outliers = true, bar_scale::Real = 1.0)
    ccall((:ImPlot_PlotHistogram_U16Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImU16}, Cint, Cint, Bool, Bool, ImPlotRange, Bool, Cdouble), label_id, values, count, bins, cumulative, density, range, outliers, bar_scale)
end

function PlotHistogram(label_id, values::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, bins::Integer = ImPlotBin_Sturges, cumulative = false, density = false, range::ImPlotRange = ImPlotRange(), outliers = true, bar_scale::Real = 1.0)
    ccall((:ImPlot_PlotHistogram_S32Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImS32}, Cint, Cint, Bool, Bool, ImPlotRange, Bool, Cdouble), label_id, values, count, bins, cumulative, density, range, outliers, bar_scale)
end

function PlotHistogram(label_id, values::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, bins::Integer = ImPlotBin_Sturges, cumulative = false, density = false, range::ImPlotRange = ImPlotRange(), outliers = true, bar_scale::Real = 1.0)
    ccall((:ImPlot_PlotHistogram_U32Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImU32}, Cint, Cint, Bool, Bool, ImPlotRange, Bool, Cdouble), label_id, values, count, bins, cumulative, density, range, outliers, bar_scale)
end

function PlotHistogram(label_id, values::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, bins::Integer = ImPlotBin_Sturges, cumulative = false, density = false, range::ImPlotRange = ImPlotRange(), outliers = true, bar_scale::Real = 1.0)
    ccall((:ImPlot_PlotHistogram_S64Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImS64}, Cint, Cint, Bool, Bool, ImPlotRange, Bool, Cdouble), label_id, values, count, bins, cumulative, density, range, outliers, bar_scale)
end

function PlotHistogram(label_id, values::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, bins::Integer = ImPlotBin_Sturges, cumulative = false, density = false, range::ImPlotRange = ImPlotRange(), outliers = true, bar_scale::Real = 1.0)
    ccall((:ImPlot_PlotHistogram_U64Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImU64}, Cint, Cint, Bool, Bool, ImPlotRange, Bool, Cdouble), label_id, values, count, bins, cumulative, density, range, outliers, bar_scale)
end

function PlotHistogram2D(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, x_bins::Integer = ImPlotBin_Sturges, y_bins::Integer = ImPlotBin_Sturges, density = false, range::ImPlotLimits = ImPlotLimits(), outliers = true)
    ccall((:ImPlot_PlotHistogram2D_FloatPtr, libcimgui), Cdouble, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint, Bool, ImPlotLimits, Bool), label_id, xs, ys, count, x_bins, y_bins, density, range, outliers)
end

function PlotHistogram2D(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, x_bins::Integer = ImPlotBin_Sturges, y_bins::Integer = ImPlotBin_Sturges, density = false, range::ImPlotLimits = ImPlotLimits(), outliers = true)
    ccall((:ImPlot_PlotHistogram2D_doublePtr, libcimgui), Cdouble, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint, Bool, ImPlotLimits, Bool), label_id, xs, ys, count, x_bins, y_bins, density, range, outliers)
end

function PlotHistogram2D(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, x_bins::Integer = ImPlotBin_Sturges, y_bins::Integer = ImPlotBin_Sturges, density = false, range::ImPlotLimits = ImPlotLimits(), outliers = true)
    ccall((:ImPlot_PlotHistogram2D_S8Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint, Bool, ImPlotLimits, Bool), label_id, xs, ys, count, x_bins, y_bins, density, range, outliers)
end

function PlotHistogram2D(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, x_bins::Integer = ImPlotBin_Sturges, y_bins::Integer = ImPlotBin_Sturges, density = false, range::ImPlotLimits = ImPlotLimits(), outliers = true)
    ccall((:ImPlot_PlotHistogram2D_U8Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint, Bool, ImPlotLimits, Bool), label_id, xs, ys, count, x_bins, y_bins, density, range, outliers)
end

function PlotHistogram2D(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, x_bins::Integer = ImPlotBin_Sturges, y_bins::Integer = ImPlotBin_Sturges, density = false, range::ImPlotLimits = ImPlotLimits(), outliers = true)
    ccall((:ImPlot_PlotHistogram2D_S16Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint, Bool, ImPlotLimits, Bool), label_id, xs, ys, count, x_bins, y_bins, density, range, outliers)
end

function PlotHistogram2D(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, x_bins::Integer = ImPlotBin_Sturges, y_bins::Integer = ImPlotBin_Sturges, density = false, range::ImPlotLimits = ImPlotLimits(), outliers = true)
    ccall((:ImPlot_PlotHistogram2D_U16Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint, Bool, ImPlotLimits, Bool), label_id, xs, ys, count, x_bins, y_bins, density, range, outliers)
end

function PlotHistogram2D(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, x_bins::Integer = ImPlotBin_Sturges, y_bins::Integer = ImPlotBin_Sturges, density = false, range::ImPlotLimits = ImPlotLimits(), outliers = true)
    ccall((:ImPlot_PlotHistogram2D_S32Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint, Bool, ImPlotLimits, Bool), label_id, xs, ys, count, x_bins, y_bins, density, range, outliers)
end

function PlotHistogram2D(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, x_bins::Integer = ImPlotBin_Sturges, y_bins::Integer = ImPlotBin_Sturges, density = false, range::ImPlotLimits = ImPlotLimits(), outliers = true)
    ccall((:ImPlot_PlotHistogram2D_U32Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint, Bool, ImPlotLimits, Bool), label_id, xs, ys, count, x_bins, y_bins, density, range, outliers)
end

function PlotHistogram2D(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, x_bins::Integer = ImPlotBin_Sturges, y_bins::Integer = ImPlotBin_Sturges, density = false, range::ImPlotLimits = ImPlotLimits(), outliers = true)
    ccall((:ImPlot_PlotHistogram2D_S64Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint, Bool, ImPlotLimits, Bool), label_id, xs, ys, count, x_bins, y_bins, density, range, outliers)
end

function PlotHistogram2D(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, x_bins::Integer = ImPlotBin_Sturges, y_bins::Integer = ImPlotBin_Sturges, density = false, range::ImPlotLimits = ImPlotLimits(), outliers = true)
    ccall((:ImPlot_PlotHistogram2D_U64Ptr, libcimgui), Cdouble, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint, Bool, ImPlotLimits, Bool), label_id, xs, ys, count, x_bins, y_bins, density, range, outliers)
end

function PlotDigital(label_id, xs::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, ys::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cfloat))
    ccall((:ImPlot_PlotDigital_FloatPtr, libcimgui), Cvoid, (Cstring, Ptr{Cfloat}, Ptr{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, ys::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(Cdouble))
    ccall((:ImPlot_PlotDigital_doublePtr, libcimgui), Cvoid, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, ys::Union{Ptr{ImS8}, Ref{ImS8}, AbstractArray{ImS8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS8))
    ccall((:ImPlot_PlotDigital_S8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS8}, Ptr{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, ys::Union{Ptr{ImU8}, Ref{ImU8}, AbstractArray{ImU8}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU8))
    ccall((:ImPlot_PlotDigital_U8Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU8}, Ptr{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, ys::Union{Ptr{ImS16}, Ref{ImS16}, AbstractArray{ImS16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS16))
    ccall((:ImPlot_PlotDigital_S16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS16}, Ptr{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, ys::Union{Ptr{ImU16}, Ref{ImU16}, AbstractArray{ImU16}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU16))
    ccall((:ImPlot_PlotDigital_U16Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU16}, Ptr{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, ys::Union{Ptr{ImS32}, Ref{ImS32}, AbstractArray{ImS32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS32))
    ccall((:ImPlot_PlotDigital_S32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS32}, Ptr{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, ys::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU32))
    ccall((:ImPlot_PlotDigital_U32Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU32}, Ptr{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, ys::Union{Ptr{ImS64}, Ref{ImS64}, AbstractArray{ImS64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImS64))
    ccall((:ImPlot_PlotDigital_S64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImS64}, Ptr{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, ys::Union{Ptr{ImU64}, Ref{ImU64}, AbstractArray{ImU64}}, count::Integer, offset::Integer = 0, stride::Integer = sizeof(ImU64))
    ccall((:ImPlot_PlotDigital_U64Ptr, libcimgui), Cvoid, (Cstring, Ptr{ImU64}, Ptr{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotImage(label_id, user_texture_id::ImTextureID, bounds_min::ImPlotPoint, bounds_max::ImPlotPoint, uv0::ImVec2 = ImVec2(0, 0), uv1::ImVec2 = ImVec2(1, 1), tint_col::ImVec4 = ImVec4(1, 1, 1, 1))
    ccall((:ImPlot_PlotImage, libcimgui), Cvoid, (Cstring, ImTextureID, ImPlotPoint, ImPlotPoint, ImVec2, ImVec2, ImVec4), label_id, user_texture_id, bounds_min, bounds_max, uv0, uv1, tint_col)
end

function PlotText(text, x::Real, y::Real, vertical = false, pix_offset::ImVec2 = ImVec2(0, 0))
    ccall((:ImPlot_PlotText, libcimgui), Cvoid, (Cstring, Cdouble, Cdouble, Bool, ImVec2), text, x, y, vertical, pix_offset)
end

function PlotDummy(label_id)
    ccall((:ImPlot_PlotDummy, libcimgui), Cvoid, (Cstring,), label_id)
end

function SetNextPlotLimits(xmin::Real, xmax::Real, ymin::Real, ymax::Real, cond = ImGuiCond_Once)
    ccall((:ImPlot_SetNextPlotLimits, libcimgui), Cvoid, (Cdouble, Cdouble, Cdouble, Cdouble, ImGuiCond), xmin, xmax, ymin, ymax, cond)
end

function SetNextPlotLimitsX(xmin::Real, xmax::Real, cond = ImGuiCond_Once)
    ccall((:ImPlot_SetNextPlotLimitsX, libcimgui), Cvoid, (Cdouble, Cdouble, ImGuiCond), xmin, xmax, cond)
end

function SetNextPlotLimitsY(ymin::Real, ymax::Real, cond = ImGuiCond_Once, y_axis::Union{ImPlotYAxis_, Integer} = 0)
    ccall((:ImPlot_SetNextPlotLimitsY, libcimgui), Cvoid, (Cdouble, Cdouble, ImGuiCond, ImPlotYAxis), ymin, ymax, cond, y_axis)
end

function LinkNextPlotLimits(xmin, xmax, ymin, ymax, ymin2, ymax2, ymin3, ymax3)
    ccall((:ImPlot_LinkNextPlotLimits, libcimgui), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), xmin, xmax, ymin, ymax, ymin2, ymax2, ymin3, ymax3)
end

function FitNextPlotAxes(x = true, y = true, y2 = true, y3 = true)
    ccall((:ImPlot_FitNextPlotAxes, libcimgui), Cvoid, (Bool, Bool, Bool, Bool), x, y, y2, y3)
end

function SetNextPlotTicksX(values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, n_ticks::Integer, labels, show_default = false)
    ccall((:ImPlot_SetNextPlotTicksX_doublePtr, libcimgui), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cstring}, Bool), values, n_ticks, labels, show_default)
end

function SetNextPlotTicksX(x_min::Real, x_max::Real, n_ticks::Integer, labels, show_default = false)
    ccall((:ImPlot_SetNextPlotTicksX_double, libcimgui), Cvoid, (Cdouble, Cdouble, Cint, Ptr{Cstring}, Bool), x_min, x_max, n_ticks, labels, show_default)
end

function SetNextPlotTicksY(values::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, n_ticks::Integer, labels, show_default = false, y_axis::Union{ImPlotYAxis_, Integer} = 0)
    ccall((:ImPlot_SetNextPlotTicksY_doublePtr, libcimgui), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Cstring}, Bool, ImPlotYAxis), values, n_ticks, labels, show_default, y_axis)
end

function SetNextPlotTicksY(y_min::Real, y_max::Real, n_ticks::Integer, labels, show_default = false, y_axis::Union{ImPlotYAxis_, Integer} = 0)
    ccall((:ImPlot_SetNextPlotTicksY_double, libcimgui), Cvoid, (Cdouble, Cdouble, Cint, Ptr{Cstring}, Bool, ImPlotYAxis), y_min, y_max, n_ticks, labels, show_default, y_axis)
end

function SetPlotYAxis(y_axis::Union{ImPlotYAxis_, Integer})
    ccall((:ImPlot_SetPlotYAxis, libcimgui), Cvoid, (ImPlotYAxis,), y_axis)
end

function HideNextItem(hidden = true, cond = ImGuiCond_Once)
    ccall((:ImPlot_HideNextItem, libcimgui), Cvoid, (Bool, ImGuiCond), hidden, cond)
end

function PixelsToPlot(pix::ImVec2, y_axis::Union{ImPlotYAxis_, Integer} = -1)
    pOut = Ref{ImPlotPoint}()
    ccall((:ImPlot_PixelsToPlot_Vec2, libcimgui), Cvoid, (Ref{ImPlotPoint}, ImVec2, ImPlotYAxis), pOut, pix, y_axis)
    pOut[]
end

function PixelsToPlot(x::Real, y::Real, y_axis::Union{ImPlotYAxis_, Integer} = -1)
    pOut = Ref{ImPlotPoint}()
    ccall((:ImPlot_PixelsToPlot_Float, libcimgui), Cvoid, (Ref{ImPlotPoint}, Cfloat, Cfloat, ImPlotYAxis), pOut, x, y, y_axis)
    pOut[]
end

function PlotToPixels(plt::ImPlotPoint, y_axis::Union{ImPlotYAxis_, Integer} = -1)
    pOut = Ref{ImVec2}()
    ccall((:ImPlot_PlotToPixels_PlotPoInt, libcimgui), Cvoid, (Ref{ImVec2}, ImPlotPoint, ImPlotYAxis), pOut, plt, y_axis)
    pOut[]
end

function PlotToPixels(x::Real, y::Real, y_axis::Union{ImPlotYAxis_, Integer} = -1)
    pOut = Ref{ImVec2}()
    ccall((:ImPlot_PlotToPixels_double, libcimgui), Cvoid, (Ref{ImVec2}, Cdouble, Cdouble, ImPlotYAxis), pOut, x, y, y_axis)
    pOut[]
end

function GetPlotPos()
    pOut = Ref{ImVec2}()
    ccall((:ImPlot_GetPlotPos, libcimgui), Cvoid, (Ref{ImVec2},), pOut)
    pOut[]
end

function GetPlotSize()
    pOut = Ref{ImVec2}()
    ccall((:ImPlot_GetPlotSize, libcimgui), Cvoid, (Ref{ImVec2},), pOut)
    pOut[]
end

function IsPlotHovered()
    ccall((:ImPlot_IsPlotHovered, libcimgui), Bool, ())
end

function IsPlotXAxisHovered()
    ccall((:ImPlot_IsPlotXAxisHovered, libcimgui), Bool, ())
end

function IsPlotYAxisHovered(y_axis::Union{ImPlotYAxis_, Integer} = 0)
    ccall((:ImPlot_IsPlotYAxisHovered, libcimgui), Bool, (ImPlotYAxis,), y_axis)
end

function GetPlotMousePos(y_axis::Union{ImPlotYAxis_, Integer} = -1)
    pOut = Ref{ImPlotPoint}()
    ccall((:ImPlot_GetPlotMousePos, libcimgui), Cvoid, (Ref{ImPlotPoint}, ImPlotYAxis), pOut, y_axis)
    pOut[]
end

function GetPlotLimits(y_axis::Union{ImPlotYAxis_, Integer} = -1)
    pOut = Ref{ImPlotLimits}()
    ccall((:ImPlot_GetPlotLimits, libcimgui), Cvoid, (Ref{ImPlotLimits}, ImPlotYAxis), pOut, y_axis)
    pOut[]
end

function IsPlotQueried()
    ccall((:ImPlot_IsPlotQueried, libcimgui), Bool, ())
end

function GetPlotQuery(y_axis::Union{ImPlotYAxis_, Integer} = -1)
    pOut = Ref{ImPlotLimits}()
    ccall((:ImPlot_GetPlotQuery, libcimgui), Cvoid, (Ref{ImPlotLimits}, ImPlotYAxis), pOut, y_axis)
    pOut[]
end

function DragLineX(id, x_value::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, show_label = true, col::ImVec4 = ImVec4(0, 0, 0, -1), thickness::Real = 1)
    ccall((:ImPlot_DragLineX, libcimgui), Bool, (Cstring, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, x_value, show_label, col, thickness)
end

function DragLineY(id, y_value::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, show_label = true, col::ImVec4 = ImVec4(0, 0, 0, -1), thickness::Real = 1)
    ccall((:ImPlot_DragLineY, libcimgui), Bool, (Cstring, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, y_value, show_label, col, thickness)
end

function DragPoint(id, x::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, y::Union{Ptr{Cdouble}, Ref{Cdouble}, AbstractArray{Cdouble}}, show_label = true, col::ImVec4 = ImVec4(0, 0, 0, -1), radius::Real = 4)
    ccall((:ImPlot_DragPoint, libcimgui), Bool, (Cstring, Ptr{Cdouble}, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, x, y, show_label, col, radius)
end

function SetLegendLocation(location::Union{ImPlotLocation_, Integer}, orientation = ImPlotOrientation_Vertical, outside = false)
    ccall((:ImPlot_SetLegendLocation, libcimgui), Cvoid, (ImPlotLocation, ImPlotOrientation, Bool), location, orientation, outside)
end

function SetMousePosLocation(location::Union{ImPlotLocation_, Integer})
    ccall((:ImPlot_SetMousePosLocation, libcimgui), Cvoid, (ImPlotLocation,), location)
end

function IsLegendEntryHovered(label_id)
    ccall((:ImPlot_IsLegendEntryHovered, libcimgui), Bool, (Cstring,), label_id)
end

function BeginLegendPopup(label_id, mouse_button = 1)
    ccall((:ImPlot_BeginLegendPopup, libcimgui), Bool, (Cstring, ImGuiMouseButton), label_id, mouse_button)
end

function EndLegendPopup()
    ccall((:ImPlot_EndLegendPopup, libcimgui), Cvoid, ())
end

function BeginDragDropTarget()
    ccall((:ImPlot_BeginDragDropTarget, libcimgui), Bool, ())
end

function BeginDragDropTargetX()
    ccall((:ImPlot_BeginDragDropTargetX, libcimgui), Bool, ())
end

function BeginDragDropTargetY(axis = ImPlotYAxis_1)
    ccall((:ImPlot_BeginDragDropTargetY, libcimgui), Bool, (ImPlotYAxis,), axis)
end

function BeginDragDropTargetLegend()
    ccall((:ImPlot_BeginDragDropTargetLegend, libcimgui), Bool, ())
end

function EndDragDropTarget()
    ccall((:ImPlot_EndDragDropTarget, libcimgui), Cvoid, ())
end

function BeginDragDropSource(key_mods = ImGuiKeyModFlags_Ctrl, flags = 0)
    ccall((:ImPlot_BeginDragDropSource, libcimgui), Bool, (ImGuiKeyModFlags, ImGuiDragDropFlags), key_mods, flags)
end

function BeginDragDropSourceX(key_mods = ImGuiKeyModFlags_Ctrl, flags = 0)
    ccall((:ImPlot_BeginDragDropSourceX, libcimgui), Bool, (ImGuiKeyModFlags, ImGuiDragDropFlags), key_mods, flags)
end

function BeginDragDropSourceY(axis = ImPlotYAxis_1, key_mods = ImGuiKeyModFlags_Ctrl, flags = 0)
    ccall((:ImPlot_BeginDragDropSourceY, libcimgui), Bool, (ImPlotYAxis, ImGuiKeyModFlags, ImGuiDragDropFlags), axis, key_mods, flags)
end

function BeginDragDropSourceItem(label_id, flags = 0)
    ccall((:ImPlot_BeginDragDropSourceItem, libcimgui), Bool, (Cstring, ImGuiDragDropFlags), label_id, flags)
end

function EndDragDropSource()
    ccall((:ImPlot_EndDragDropSource, libcimgui), Cvoid, ())
end

function GetStyle()
    ccall((:ImPlot_GetStyle, libcimgui), Ptr{ImPlotStyle}, ())
end

function StyleColorsAuto(dst)
    ccall((:ImPlot_StyleColorsAuto, libcimgui), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function StyleColorsClassic(dst)
    ccall((:ImPlot_StyleColorsClassic, libcimgui), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function StyleColorsDark(dst)
    ccall((:ImPlot_StyleColorsDark, libcimgui), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function StyleColorsLight(dst)
    ccall((:ImPlot_StyleColorsLight, libcimgui), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function PushStyleColor(idx::Union{ImPlotCol_, Integer}, col::Integer)
    ccall((:ImPlot_PushStyleColor_U32, libcimgui), Cvoid, (ImPlotCol, ImU32), idx, col)
end

function PushStyleColor(idx::Union{ImPlotCol_, Integer}, col::ImVec4)
    ccall((:ImPlot_PushStyleColor_Vec4, libcimgui), Cvoid, (ImPlotCol, ImVec4), idx, col)
end

function PopStyleColor(count::Integer = 1)
    ccall((:ImPlot_PopStyleColor, libcimgui), Cvoid, (Cint,), count)
end

function PushStyleVar(idx::Union{ImPlotStyleVar_, Integer}, val::Real)
    ccall((:ImPlot_PushStyleVar_Float, libcimgui), Cvoid, (ImPlotStyleVar, Cfloat), idx, val)
end

function PushStyleVar(idx::Union{ImPlotStyleVar_, Integer}, val::Integer)
    ccall((:ImPlot_PushStyleVar_Int, libcimgui), Cvoid, (ImPlotStyleVar, Cint), idx, val)
end

function PushStyleVar(idx::Union{ImPlotStyleVar_, Integer}, val::ImVec2)
    ccall((:ImPlot_PushStyleVar_Vec2, libcimgui), Cvoid, (ImPlotStyleVar, ImVec2), idx, val)
end

function PopStyleVar(count::Integer = 1)
    ccall((:ImPlot_PopStyleVar, libcimgui), Cvoid, (Cint,), count)
end

function SetNextLineStyle(col::ImVec4 = ImVec4(0, 0, 0, -1), weight::Real = -1)
    ccall((:ImPlot_SetNextLineStyle, libcimgui), Cvoid, (ImVec4, Cfloat), col, weight)
end

function SetNextFillStyle(col::ImVec4 = ImVec4(0, 0, 0, -1), alpha_mod::Real = -1)
    ccall((:ImPlot_SetNextFillStyle, libcimgui), Cvoid, (ImVec4, Cfloat), col, alpha_mod)
end

function SetNextMarkerStyle(marker::Union{ImPlotMarker_, Integer} = -1, size::Real = -1, fill::ImVec4 = ImVec4(0, 0, 0, -1), weight::Real = -1, outline::ImVec4 = ImVec4(0, 0, 0, -1))
    ccall((:ImPlot_SetNextMarkerStyle, libcimgui), Cvoid, (ImPlotMarker, Cfloat, ImVec4, Cfloat, ImVec4), marker, size, fill, weight, outline)
end

function SetNextErrorBarStyle(col::ImVec4 = ImVec4(0, 0, 0, -1), size::Real = -1, weight::Real = -1)
    ccall((:ImPlot_SetNextErrorBarStyle, libcimgui), Cvoid, (ImVec4, Cfloat, Cfloat), col, size, weight)
end

function GetLastItemColor()
    pOut = Ref{ImVec4}()
    ccall((:ImPlot_GetLastItemColor, libcimgui), Cvoid, (Ref{ImVec4},), pOut)
    pOut[]
end

function GetStyleColorName(idx::Union{ImPlotCol_, Integer})
    ccall((:ImPlot_GetStyleColorName, libcimgui), Cstring, (ImPlotCol,), idx)
end

function GetMarkerName(idx::Union{ImPlotMarker_, Integer})
    ccall((:ImPlot_GetMarkerName, libcimgui), Cstring, (ImPlotMarker,), idx)
end

function AddColormap(name, cols::Union{ImVec4, AbstractArray{ImVec4}}, size::Integer, qual = true)
    ccall((:ImPlot_AddColormap_Vec4Ptr, libcimgui), ImPlotColormap, (Cstring, Ptr{ImVec4}, Cint, Bool), name, cols, size, qual)
end

function AddColormap(name, cols::Union{Ptr{ImU32}, Ref{ImU32}, AbstractArray{ImU32}}, size::Integer, qual = true)
    ccall((:ImPlot_AddColormap_U32Ptr, libcimgui), ImPlotColormap, (Cstring, Ptr{ImU32}, Cint, Bool), name, cols, size, qual)
end

function GetColormapCount()
    ccall((:ImPlot_GetColormapCount, libcimgui), Cint, ())
end

function GetColormapName(cmap::Union{ImPlotColormap_, Integer})
    ccall((:ImPlot_GetColormapName, libcimgui), Cstring, (ImPlotColormap,), cmap)
end

function GetColormapIndex(name)
    ccall((:ImPlot_GetColormapIndex, libcimgui), ImPlotColormap, (Cstring,), name)
end

function PushColormap(cmap::Union{ImPlotColormap_, Integer})
    ccall((:ImPlot_PushColormap_PlotColormap, libcimgui), Cvoid, (ImPlotColormap,), cmap)
end

function PushColormap(name)
    ccall((:ImPlot_PushColormap_Str, libcimgui), Cvoid, (Cstring,), name)
end

function PopColormap(count::Integer = 1)
    ccall((:ImPlot_PopColormap, libcimgui), Cvoid, (Cint,), count)
end

function NextColormapColor()
    pOut = Ref{ImVec4}()
    ccall((:ImPlot_NextColormapColor, libcimgui), Cvoid, (Ref{ImVec4},), pOut)
    pOut[]
end

function GetColormapSize(cmap::Union{ImPlotColormap_, Integer} = -1)
    ccall((:ImPlot_GetColormapSize, libcimgui), Cint, (ImPlotColormap,), cmap)
end

function GetColormapColor(idx::Integer, cmap::Union{ImPlotColormap_, Integer} = -1)
    pOut = Ref{ImVec4}()
    ccall((:ImPlot_GetColormapColor, libcimgui), Cvoid, (Ref{ImVec4}, Cint, ImPlotColormap), pOut, idx, cmap)
    pOut[]
end

function SampleColormap(t::Real, cmap::Union{ImPlotColormap_, Integer} = -1)
    pOut = Ref{ImVec4}()
    ccall((:ImPlot_SampleColormap, libcimgui), Cvoid, (Ref{ImVec4}, Cfloat, ImPlotColormap), pOut, t, cmap)
    pOut[]
end

function ColormapScale(label, scale_min::Real, scale_max::Real, size::ImVec2 = ImVec2(0, 0), cmap::Union{ImPlotColormap_, Integer} = -1)
    ccall((:ImPlot_ColormapScale, libcimgui), Cvoid, (Cstring, Cdouble, Cdouble, ImVec2, ImPlotColormap), label, scale_min, scale_max, size, cmap)
end

function ColormapSlider(label, t::Union{Ptr{Cfloat}, Ref{Cfloat}, AbstractArray{Cfloat}}, out, format = "", cmap::Union{ImPlotColormap_, Integer} = -1)
    ccall((:ImPlot_ColormapSlider, libcimgui), Bool, (Cstring, Ptr{Cfloat}, Ptr{ImVec4}, Cstring, ImPlotColormap), label, t, out, format, cmap)
end

function ColormapButton(label, size::ImVec2 = ImVec2(0, 0), cmap::Union{ImPlotColormap_, Integer} = -1)
    ccall((:ImPlot_ColormapButton, libcimgui), Bool, (Cstring, ImVec2, ImPlotColormap), label, size, cmap)
end

function BustColorCache(plot_title_id = C_NULL)
    ccall((:ImPlot_BustColorCache, libcimgui), Cvoid, (Cstring,), plot_title_id)
end

function ItemIcon(col::ImVec4)
    ccall((:ImPlot_ItemIcon_Vec4, libcimgui), Cvoid, (ImVec4,), col)
end

function ItemIcon(col::Integer)
    ccall((:ImPlot_ItemIcon_U32, libcimgui), Cvoid, (ImU32,), col)
end

function ColormapIcon(cmap::Union{ImPlotColormap_, Integer})
    ccall((:ImPlot_ColormapIcon, libcimgui), Cvoid, (ImPlotColormap,), cmap)
end

function GetPlotDrawList()
    ccall((:ImPlot_GetPlotDrawList, libcimgui), Ptr{ImDrawList}, ())
end

function PushPlotClipRect()
    ccall((:ImPlot_PushPlotClipRect, libcimgui), Cvoid, ())
end

function PopPlotClipRect()
    ccall((:ImPlot_PopPlotClipRect, libcimgui), Cvoid, ())
end

function ShowStyleSelector(label)
    ccall((:ImPlot_ShowStyleSelector, libcimgui), Bool, (Cstring,), label)
end

function ShowColormapSelector(label)
    ccall((:ImPlot_ShowColormapSelector, libcimgui), Bool, (Cstring,), label)
end

function ShowStyleEditor(ref)
    ccall((:ImPlot_ShowStyleEditor, libcimgui), Cvoid, (Ptr{ImPlotStyle},), ref)
end

function ShowUserGuide()
    ccall((:ImPlot_ShowUserGuide, libcimgui), Cvoid, ())
end

function ShowMetricsWindow(p_popen)
    ccall((:ImPlot_ShowMetricsWindow, libcimgui), Cvoid, (Ptr{Bool},), p_popen)
end

function ShowDemoWindow(p_open)
    ccall((:ImPlot_ShowDemoWindow, libcimgui), Cvoid, (Ptr{Bool},), p_open)
end

function Base.finalizer(self::Union{Ptr{ImBufferWriter}, ImBufferWriter})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImBufferWriter_destroy, libcimgui), Cvoid, (Ptr{ImBufferWriter},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotInputMap}, ImPlotInputMap})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotInputMap_destroy, libcimgui), Cvoid, (Ptr{ImPlotInputMap},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotDateTimeFmt}, ImPlotDateTimeFmt})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotDateTimeFmt_destroy, libcimgui), Cvoid, (Ptr{ImPlotDateTimeFmt},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotTime}, ImPlotTime})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotTime_destroy, libcimgui), Cvoid, (Ptr{ImPlotTime},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotColormapData}, ImPlotColormapData})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotColormapData_destroy, libcimgui), Cvoid, (Ptr{ImPlotColormapData},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotPointError}, ImPlotPointError})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotPointError_destroy, libcimgui), Cvoid, (Ptr{ImPlotPointError},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotAnnotationCollection}, ImPlotAnnotationCollection})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotAnnotationCollection_destroy, libcimgui), Cvoid, (Ptr{ImPlotAnnotationCollection},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotTick}, ImPlotTick})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotTick_destroy, libcimgui), Cvoid, (Ptr{ImPlotTick},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotTickCollection}, ImPlotTickCollection})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotTickCollection_destroy, libcimgui), Cvoid, (Ptr{ImPlotTickCollection},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotAxis}, ImPlotAxis})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotAxis_destroy, libcimgui), Cvoid, (Ptr{ImPlotAxis},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotPlot}, ImPlotPlot})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotPlot_destroy, libcimgui), Cvoid, (Ptr{ImPlotPlot},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotNextPlotData}, ImPlotNextPlotData})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotNextPlotData_destroy, libcimgui), Cvoid, (Ptr{ImPlotNextPlotData},), self)
end

function Base.finalizer(self::Union{Ptr{ImPlotNextItemData}, ImPlotNextItemData})
    ptr = pointer_from_objref(self)
    GC.@preserve self ccall((:ImPlotNextItemData_destroy, libcimgui), Cvoid, (Ptr{ImPlotNextItemData},), self)
end

# typedef void * ( * ImPlotPoint_getter ) ( void * data , int idx , ImPlotPoint * point )
const ImPlotPoint_getter = Ptr{Cvoid}

function PlotLineG(label_id, getter::ImPlotPoint_getter, data, count::Integer, offset::Integer = 0)
    ccall((:ImPlot_PlotLineG, libcimgui), Cvoid, (Cstring, ImPlotPoint_getter, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function PlotScatterG(label_id, getter::ImPlotPoint_getter, data, count::Integer, offset::Integer = 0)
    ccall((:ImPlot_PlotScatterG, libcimgui), Cvoid, (Cstring, ImPlotPoint_getter, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function PlotShadedG(label_id, getter1::ImPlotPoint_getter, data1, getter2::ImPlotPoint_getter, data2, count::Integer, offset::Integer = 0)
    ccall((:ImPlot_PlotShadedG, libcimgui), Cvoid, (Cstring, ImPlotPoint_getter, Ptr{Cvoid}, ImPlotPoint_getter, Ptr{Cvoid}, Cint, Cint), label_id, getter1, data1, getter2, data2, count, offset)
end

function PlotBarsG(label_id, getter::ImPlotPoint_getter, data, count::Integer, width::Real, offset::Integer = 0)
    ccall((:ImPlot_PlotBarsG, libcimgui), Cvoid, (Cstring, ImPlotPoint_getter, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, width, offset)
end

function PlotBarsHG(label_id, getter::ImPlotPoint_getter, data, count::Integer, height::Real, offset::Integer = 0)
    ccall((:ImPlot_PlotBarsHG, libcimgui), Cvoid, (Cstring, ImPlotPoint_getter, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, height, offset)
end

function PlotDigitalG(label_id, getter::ImPlotPoint_getter, data, count::Integer, offset::Integer = 0)
    ccall((:ImPlot_PlotDigitalG, libcimgui), Cvoid, (Cstring, ImPlotPoint_getter, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function Annotate(x::Real, y::Real, pix_offset::ImVec2, fmt::String...)
    ccall((:ImPlot_Annotate_Str, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec2,Cstring...),
          x, y, pix_offset, fmt...)
end

function AnnotateClamped(x::Real, y::Real, pix_offset::ImVec2, fmt::String...)
    ccall((:ImPlot_AnnotateClamped_Str, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec2,Cstring...),
          x, y, pix_offset, fmt...)
end

function Annotate(x::Real, y::Real, pix_offset::ImVec2, color::ImVec4, fmt::String...)
    ccall((:ImPlot_Annotate_Vec4, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec2,ImVec4,Cstring...),
          x, y, pix_offset, color, fmt...)
end

function AnnotateClamped(x::Real, y::Real, pix_offset::ImVec2, color::ImVec4, fmt::String...)
    ccall((:ImPlot_AnnotateClamped_Vec4, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec2,ImVec4,Cstring...),
          x, y, pix_offset, color, fmt...)
end


# exports
const PREFIXES = ["ImPlot", "IMPLOT"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

