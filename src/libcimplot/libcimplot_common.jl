# Automatically generated using Clang.jl

@cenum ImPlotMarker::Cint begin
    ImPlotMarker_None     = 1 << 0
    ImPlotMarker_Circle   = 1 << 1
    ImPlotMarker_Square   = 1 << 2
    ImPlotMarker_Diamond  = 1 << 3
    ImPlotMarker_Up       = 1 << 4
    ImPlotMarker_Down     = 1 << 5
    ImPlotMarker_Left     = 1 << 6
    ImPlotMarker_Right    = 1 << 7
    ImPlotMarker_Cross    = 1 << 8
    ImPlotMarker_Plus     = 1 << 9
    ImPlotMarker_Asterisk = 1 << 10
end

struct ImPlotStyle
    LineWeight::Cfloat
    Marker::ImPlotMarker
    MarkerSize::Cfloat
    MarkerWeight::Cfloat
    ErrorBarSize::Cfloat
    ErrorBarWeight::Cfloat
    DigitalBitHeight::Cfloat
    DigitalBitGap::Cfloat
    Colors::NTuple{14, Cint}
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

@cenum ImPlotFlags::Cint begin
    ImPlotFlags_NULL        = 0
    ImPlotFlags_MousePos    = 1 << 0
    ImPlotFlags_Legend      = 1 << 1
    ImPlotFlags_Highlight   = 1 << 2
    ImPlotFlags_BoxSelect   = 1 << 3
    ImPlotFlags_Query       = 1 << 4
    ImPlotFlags_ContextMenu = 1 << 5
    ImPlotFlags_Crosshairs  = 1 << 6
    ImPlotFlags_AntiAliased = 1 << 7
    ImPlotFlags_NoChild     = 1 << 8
    ImPlotFlags_YAxis2      = 1 << 9
    ImPlotFlags_YAxis3      = 1 << 10
    ImPlotFlags_Default     = (1 << 0) | (1 << 1) | (1 << 2) | (1 << 3) | (1 << 5)
end

@cenum ImPlotAxisFlags::Cint begin
    ImPlotAxisFlags_NULL        = 0
    ImPlotAxisFlags_GridLines   = 1 << 0
    ImPlotAxisFlags_TickMarks   = 1 << 1
    ImPlotAxisFlags_TickLabels  = 1 << 2
    ImPlotAxisFlags_Invert      = 1 << 3
    ImPlotAxisFlags_LockMin     = 1 << 4
    ImPlotAxisFlags_LockMax     = 1 << 5
    ImPlotAxisFlags_LogScale    = 1 << 6
    ImPlotAxisFlags_Scientific  = 1 << 7
    ImPlotAxisFlags_Default     = (1 << 0) | (1 << 1) | (1 << 2)
    ImPlotAxisFlags_Auxiliary   = (1 << 1) | (1 << 2)
end

@cenum ImPlotCol::Cint begin
    ImPlotCol_Line = 0
    ImPlotCol_Fill = 1
    ImPlotCol_MarkerOutline = 2
    ImPlotCol_MarkerFill = 3
    ImPlotCol_ErrorBar = 4
    ImPlotCol_FrameBg = 5
    ImPlotCol_PlotBg = 6
    ImPlotCol_PlotBorder = 7
    ImPlotCol_XAxis = 8
    ImPlotCol_YAxis = 9
    ImPlotCol_YAxis2 = 10
    ImPlotCol_YAxis3 = 11
    ImPlotCol_Selection = 12
    ImPlotCol_Query = 13
    ImPlotCol_COUNT = 14
end

@cenum ImPlotStyleVar::Cint begin
    ImPlotStyleVar_LineWeight = 0
    ImPlotStyleVar_Marker = 1
    ImPlotStyleVar_MarkerSize = 2
    ImPlotStyleVar_MarkerWeight = 3
    ImPlotStyleVar_FillAlpha = 4
    ImPlotStyleVar_ErrorBarSize = 5
    ImPlotStyleVar_ErrorBarWeight = 6
    ImPlotStyleVar_DigitalBitHeight = 7
    ImPlotStyleVar_DigitalBitGap = 8
    ImPlotStyleVar_COUNT = 9
end

@cenum ImPlotColormap::Cint begin
    ImPlotColormap_Default = 0
    ImPlotColormap_Dark = 1
    ImPlotColormap_Pastel = 2
    ImPlotColormap_Paired = 3
    ImPlotColormap_Viridis = 4
    ImPlotColormap_Plasma = 5
    ImPlotColormap_Hot = 6
    ImPlotColormap_Cool = 7
    ImPlotColormap_Pink = 8
    ImPlotColormap_Jet = 9
    ImPlotColormap_COUNT = 10
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
