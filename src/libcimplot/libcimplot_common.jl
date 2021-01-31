# Automatically generated using Clang.jl
const IMPLOT_AUTO = Cint(-1)
const IMPLOT_AUTO_COL = ImVec4(0,0,0,-1)

const ImPlotContext = Ptr{Cvoid}

"Options for plots."
@cenum ImPlotFlags::Cint begin
    ImPlotFlags_None        = 0         # Default
    ImPlotFlags_NoTitle     = 1 << 0
    ImPlotFlags_NoLegend    = 1 << 1
    ImPlotFlags_NoMenus     = 1 << 2
    ImPlotFlags_NoBoxSelect = 1 << 3
    ImPlotFlags_NoMousePos  = 1 << 4
    ImPlotFlags_NoHighlight = 1 << 5
    ImPlotFlags_NoChild     = 1 << 6
    ImPlotFlags_Equal       = 1 << 7
    ImPlotFlags_YAxis2      = 1 << 8
    ImPlotFlags_YAxis3      = 1 << 9
    ImPlotFlags_Query       = 1 << 10
    ImPlotFlags_Crosshairs  = 1 << 11
    ImPlotFlags_AntiAliased = 1 << 12
    ImPlotFlags_CanvasOnly  = (1 << 0) | (1 << 1) | (1 << 2) | (1 << 3) | (1 << 4)
end

"Options for plot axes (X and Y)"
@cenum ImPlotAxisFlags::Cint begin
    ImPlotAxisFlags_None            = 0
    ImPlotAxisFlags_NoGridLines     = 1 << 0
    ImPlotAxisFlags_NoTickMarks     = 1 << 1
    ImPlotAxisFlags_NoTickLabels    = 1 << 2
    ImPlotAxisFlags_LogScale        = 1 << 3
    ImPlotAxisFlags_Time            = 1 << 4
    ImPlotAxisFlags_Invert          = 1 << 5
    ImPlotAxisFlags_LockMin         = 1 << 6
    ImPlotAxisFlags_LockMax         = 1 << 7
    ImPlotAxisFlags_Lock            = (1 << 6) | (1 << 7)
    ImPlotAxisFlags_NoDecorations   = (1 << 0) | (1 << 1) | (1 << 2)
end

"Plot styling colors"
@cenum ImPlotCol::Cint begin
    # Item styling colors
    ImPlotCol_Line              = 0
    ImPlotCol_Fill              = 1
    ImPlotCol_MarkerOutline     = 2
    ImPlotCol_MarkerFill        = 3
    ImPlotCol_ErrorBar          = 4
    # Plot styling colors
    ImPlotCol_FrameBg           = 5
    ImPlotCol_PlotBg            = 6
    ImPlotCol_PlotBorder        = 7
    ImPlotCol_LegendBg          = 8
    ImPlotCol_LegendBorder      = 9
    ImPlotCol_LegendText        = 10
    ImPlotCol_TitleText         = 11
    ImPlotCol_InlayText         = 12
    ImPlotCol_XAxis             = 13
    ImPlotCol_XAxisGrid         = 14
    ImPlotCol_YAxis             = 15
    ImPlotCol_YAxisGrid         = 16
    ImPlotCol_YAxis2            = 17
    ImPlotCol_YAxisGrid2        = 18
    ImPlotCol_YAxis3            = 19
    ImPlotCol_YAxisGrid3        = 20
    ImPlotCol_Selection         = 21
    ImPlotCol_Query             = 22
    ImPlotCol_Crosshairs        = 23
    ImPlotCol_COUNT             = 24
end

"Plot styling variables"
@cenum ImPlotStyleVar::Cint begin
    # Item styling variables
    ImPlotStyleVar_LineWeight           = 0   # Float32,  plot item line weight in pixels
    ImPlotStyleVar_Marker               = 1   # Int32,    marker specification
    ImPlotStyleVar_MarkerSize           = 2   # Float32,  marker size in pixels (roughly the marker's "radius")
    ImPlotStyleVar_MarkerWeight         = 3   # Float32,  plot outline weight of markers in pixels
    ImPlotStyleVar_FillAlpha            = 4   # Float32,  alpha modifier applied to all plot item fills
    ImPlotStyleVar_ErrorBarSize         = 5   # Float32,  error bar whisker width in pixels
    ImPlotStyleVar_ErrorBarWeight       = 6   # Float32,  error bar whisker weight in pixels
    ImPlotStyleVar_DigitalBitHeight     = 7   # Float32,  digital channels bit height (at 1) in pixels
    ImPlotStyleVar_DigitalBitGap        = 8   # Float32,  digital channels bit padding gap in pixels
    # plot styling variables
    ImPlotStyleVar_PlotBorderSize       = 9   # Float32,  thickness of border around plot area
    ImPlotStyleVar_MinorAlpha           = 10   # Float32,  alpha multiplier applied to minor axis grid lines
    ImPlotStyleVar_MajorTickLen         = 11   # ImVec2, major tick lengths for X and Y axes
    ImPlotStyleVar_MinorTickLen         = 12   # ImVec2, minor tick lengths for X and Y axes
    ImPlotStyleVar_MajorTickSize        = 13   # ImVec2, line thickness of major ticks
    ImPlotStyleVar_MinorTickSize        = 14   # ImVec2, line thickness of minor ticks
    ImPlotStyleVar_MajorGridSize        = 15   # ImVec2, line thickness of major grid lines
    ImPlotStyleVar_MinorGridSize        = 16   # ImVec2, line thickness of minor grid lines
    ImPlotStyleVar_PlotPadding          = 17   # ImVec2, padding between widget frame and plot area,
                                               # labels, or outside legends (i.e. main padding)
    ImPlotStyleVar_LabelPadding         = 18   # ImVec2, padding between axes labels, tick labels, and plot edge
    ImPlotStyleVar_LegendPadding        = 19   # ImVec2, legend padding from plot edges
    ImPlotStyleVar_LegendInnerPadding   = 20   # ImVec2, legend inner padding from legend edges
    ImPlotStyleVar_LegendSpacing        = 21   # ImVec2, spacing between legend entries
    ImPlotStyleVar_MousePosPadding      = 22   # ImVec2, padding between plot edge and interior info text
    ImPlotStyleVar_AnnotationPadding    = 23   # ImVec2, text padding around annotation labels
    ImPlotStyleVar_FitPadding           = 24       # ImVec2, additional fit padding as a percentage
                                               # of the fit extents (e.g. ImVec2(0.1f,0.1f) adds 
                                               # 10% to the fit extents of X and Y)
    ImPlotStyleVar_PlotDefaultSize      = 25   # ImVec2, default size used when ImVec2(0,0) is passed to BeginPlot
    ImPlotStyleVar_PlotMinSize          = 26   # ImVec2, minimum size plot frame can be when shrunk
    ImPlotStyleVar_COUNT                = 27
end

"Marker specifications"
@cenum ImPlotMarker::Cint begin
    ImPlotMarker_None       = -1    # no marker
    ImPlotMarker_Circle     = 0     # a circle marker
    ImPlotMarker_Square     = 1     # a square maker
    ImPlotMarker_Diamond    = 2     # a diamond marker
    ImPlotMarker_Up         = 3     # an upward-pointing triangle marker
    ImPlotMarker_Down       = 4     # an downward-pointing triangle marker
    ImPlotMarker_Left       = 5     # an leftward-pointing triangle marker
    ImPlotMarker_Right      = 6     # an rightward-pointing triangle marker
    ImPlotMarker_Cross      = 7     # a cross marker (not fillable)
    ImPlotMarker_Plus       = 8     # a plus marker (not fillable)
    ImPlotMarker_Asterisk   = 9     # a asterisk marker (not fillable)
    ImPlotMarker_COUNT      = 10
end

"Built-in colormaps"
@cenum ImPlotColormap::Cint begin
    ImPlotColormap_Default  =  0    # ImPlot default colormap         (n=10)
    ImPlotColormap_Deep     =  1    # a.k.a. seaborn deep             (n=10)
    ImPlotColormap_Dark     =  2    # a.k.a. matplotlib "Set1"        (n=9) 
    ImPlotColormap_Pastel   =  3    # a.k.a. matplotlib "Pastel1"     (n=9) 
    ImPlotColormap_Paired   =  4    # a.k.a. matplotlib "Paired"      (n=12)
    ImPlotColormap_Viridis  =  5    # a.k.a. matplotlib "viridis"     (n=11)
    ImPlotColormap_Plasma   =  6    # a.k.a. matplotlib "plasma"      (n=11)
    ImPlotColormap_Hot      =  7    # a.k.a. matplotlib/MATLAB "hot"  (n=11)
    ImPlotColormap_Cool     =  8    # a.k.a. matplotlib/MATLAB "cool" (n=11)
    ImPlotColormap_Pink     =  9    # a.k.a. matplotlib/MATLAB "pink" (n=11)
    ImPlotColormap_Jet      =  10   # a.k.a. MATLAB "jet"             (n=11)
    ImPlotColormap_COUNT    =  11
end

"Used to position items on a plot (e.g. legends, labels, etc.)"
@cenum ImPlotLocation::Cint begin
    ImPlotLocation_Center    = 0                   # center-center
    ImPlotLocation_North     = 1 << 0              # top-center
    ImPlotLocation_South     = 1 << 1              # bottom-center
    ImPlotLocation_West      = 1 << 2              # center-left
    ImPlotLocation_East      = 1 << 3              # center-right
    ImPlotLocation_NorthWest = (1 << 0) | (1 << 2) # top-left
    ImPlotLocation_NorthEast = (1 << 0) | (1 << 3) # top-right
    ImPlotLocation_SouthWest = (1 << 1) | (1 << 2) # bottom-left
    ImPlotLocation_SouthEast = (1 << 1) | (1 << 3) # bottom-right
end

@cenum ImPlotOrientation::Cint begin
    ImPlotOrientation_Horizontal = 0
    ImPlotOrientation_Vertical   = 1
end

@cenum ImPlotYAxis::Cint begin
    ImPlotYAxis_1   = 0 # left (default
    ImPlotYaxis_2   = 1 # first on right side
    ImPlotYAxis_3   = 2 # second on right side
end

struct ImPlotPoint
    x::Cdouble
    y::Cdouble
end

struct ImPlotRange
    Min::Cdouble
    Max::Cdouble
end

struct ImPlotLimits
    X::ImPlotRange
    Y::ImPlotRange
end


struct ImPlotStyle
    LineWeight::Cfloat
    Marker::ImPlotMarker
    MarkerSize::Cfloat
    MarkerWeight::Cfloat
    FillAlpha::Cfloat
    ErrorBarSize::Cfloat
    ErrorBarWeight::Cfloat
    DigitalBitHeight::Cfloat
    DigitalBitGap::Cfloat
    # Plot styling variables
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
    Colors::NTuple{Int(ImPlotCol_COUNT), ImVec4}
    AntiAliasedLines::Bool
    UseLocalTime::Bool
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
