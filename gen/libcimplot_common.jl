# Automatically generated using Clang.jl

const ImPlotMarker = Cint

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

const ImPlotFlags = Cint
const ImPlotAxisFlags = Cint
const ImPlotCol = Cint
const ImPlotStyleVar = Cint
const ImPlotColormap = Cint

@cenum ImPlotFlags_::UInt32 begin
    ImPlotFlags_MousePos = 1
    ImPlotFlags_Legend = 2
    ImPlotFlags_Highlight = 4
    ImPlotFlags_BoxSelect = 8
    ImPlotFlags_Query = 16
    ImPlotFlags_ContextMenu = 32
    ImPlotFlags_Crosshairs = 64
    ImPlotFlags_CullData = 128
    ImPlotFlags_AntiAliased = 256
    ImPlotFlags_NoChild = 512
    ImPlotFlags_YAxis2 = 1024
    ImPlotFlags_YAxis3 = 2048
    ImPlotFlags_Default = 175
end

@cenum ImPlotAxisFlags_::UInt32 begin
    ImPlotAxisFlags_GridLines = 1
    ImPlotAxisFlags_TickMarks = 2
    ImPlotAxisFlags_TickLabels = 4
    ImPlotAxisFlags_Invert = 8
    ImPlotAxisFlags_LockMin = 16
    ImPlotAxisFlags_LockMax = 32
    ImPlotAxisFlags_Adaptive = 64
    ImPlotAxisFlags_LogScale = 128
    ImPlotAxisFlags_Scientific = 256
    ImPlotAxisFlags_Default = 71
    ImPlotAxisFlags_Auxiliary = 70
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
    ImPlotCol_XAxis = 8
    ImPlotCol_YAxis = 9
    ImPlotCol_YAxis2 = 10
    ImPlotCol_YAxis3 = 11
    ImPlotCol_Selection = 12
    ImPlotCol_Query = 13
    ImPlotCol_COUNT = 14
end

@cenum ImPlotStyleVar_::UInt32 begin
    ImPlotStyleVar_LineWeight = 0
    ImPlotStyleVar_Marker = 1
    ImPlotStyleVar_MarkerSize = 2
    ImPlotStyleVar_MarkerWeight = 3
    ImPlotStyleVar_ErrorBarSize = 4
    ImPlotStyleVar_ErrorBarWeight = 5
    ImPlotStyleVar_DigitalBitHeight = 6
    ImPlotStyleVar_DigitalBitGap = 7
    ImPlotStyleVar_COUNT = 8
end

@cenum ImPlotMarker_::UInt32 begin
    ImPlotMarker_None = 1
    ImPlotMarker_Circle = 2
    ImPlotMarker_Square = 4
    ImPlotMarker_Diamond = 8
    ImPlotMarker_Up = 16
    ImPlotMarker_Down = 32
    ImPlotMarker_Left = 64
    ImPlotMarker_Right = 128
    ImPlotMarker_Cross = 256
    ImPlotMarker_Plus = 512
    ImPlotMarker_Asterisk = 1024
end

@cenum ImPlotColormap_::UInt32 begin
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

