# Automatically generated using Clang.jl

@cenum ImPlotMarker::Cint begin
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

@cenum ImPlotFlags::Cint begin
    ImPlotFlags_MousePos = 1      # the mouse position, in plot coordinates, will be
                                  # displayed in the bottom-right
                                  
    ImPlotFlags_Legend = 2        # a legend will be displayed in the top-left

    ImPlotFlags_Highlight = 4     # plot items will be highlighted when their legend
                                  # entry is hovered
                                  
    ImPlotFlags_BoxSelect = 8     # the user will be able to box-select with right-mouse

    ImPlotFlags_Query = 16        # the user will be able to draw query rects with 
                                  # middle-mouse
                                  
    ImPlotFlags_ContextMenu = 32  # the user will be able to open a context menu with
                                  # double-right click
                                  
    ImPlotFlags_Crosshairs = 64   # the default mouse cursor will be replaced with a
                                  # crosshair when hovered
                                  
    ImPlotFlags_CullData = 128    # plot data outside the plot area will be culled from
                                  # rendering
                                  
    ImPlotFlags_AntiAliased = 256 # lines and fills will be anti-aliased (not recommended)

    ImPlotFlags_NoChild = 512     # a child window region will not be used to capture
                                  # mouse scroll (can boost performance for single 
                                  # ImGui window applications)
                                  
    ImPlotFlags_YAxis2 = 1024     # enable a 2nd y axis

    ImPlotFlags_YAxis3 = 2048     # enable a 3rd y axis

    ImPlotFlags_Default = 175 # MousePos+Legend+Highlight+BoxSelect+ContextMenu+CullData
end

@cenum ImPlotAxisFlags::Cint begin
    ImPlotAxisFlags_NULL = 0         # Unused flag (ex. 2nd and 3rd Y-axis flags)

    ImPlotAxisFlags_GridLines = 1    # grid lines will be displayed

    ImPlotAxisFlags_TickMarks = 2    # tick marks will be displayed for each grid line

    ImPlotAxisFlags_TickLabels = 4   # text labels will be displayed for each grid line

    ImPlotAxisFlags_Invert = 8       # the axis will be inverted

    ImPlotAxisFlags_LockMin = 16     # the axis minimum value will be locked when
                                     # panning/zooming

    ImPlotAxisFlags_LockMax = 32     # the axis maximum value will be locked when
                                     # panning/zooming

    ImPlotAxisFlags_Adaptive = 64    # grid divisions will adapt to the current pixel size
                                     # the axis

    ImPlotAxisFlags_LogScale = 128   # a logartithmic (base 10) axis scale will be used
    ImPlotAxisFlags_Scientific = 256 # scientific notation will be used for tick labels if
                                     # displayed (WIP, not very good yet)

    ImPlotAxisFlags_Default = 71 # GridLines+TickMarks+TickLabels+Adaptive
    ImPlotAxisFlags_Auxiliary = 70 # Default - GridLines
end

@cenum ImPlotCol::Cint begin
    ImPlotCol_Line = 0          # plot line/outline color (defaults to a rotating color set)    
    ImPlotCol_Fill = 1          # plot fill color for bars (defaults to the current line color) 
    ImPlotCol_MarkerOutline = 2 # marker outline color (defaults to the current line color)     
    ImPlotCol_MarkerFill = 3    # marker fill color (defaults to the current line color)        
    ImPlotCol_ErrorBar = 4      # error bar color (defaults to ImGuiCol_Text)                   
    ImPlotCol_FrameBg = 5       # plot frame background color (defaults to ImGuiCol_FrameBg)    
    ImPlotCol_PlotBg = 6        # plot area background color (defaults to ImGuiCol_WindowBg)    
    ImPlotCol_PlotBorder = 7    # plot area border color (defaults to ImGuiCol_Text)            
    ImPlotCol_XAxis = 8         # x-axis grid/label color (defaults to 25% ImGuiCol_Text)       
    ImPlotCol_YAxis = 9         # y-axis grid/label color (defaults to 25% ImGuiCol_Text)       
    ImPlotCol_YAxis2 = 10       # 2nd y-axis grid/label color (defaults to 25% ImGuiCol_Text)   
    ImPlotCol_YAxis3 = 11       # 3rd y-axis grid/label color (defaults to 25% ImGuiCol_Text)   
    ImPlotCol_Selection = 12    # box-selection color (defaults to yellow)                      
    ImPlotCol_Query = 13        # box-query color (defaults to green)                           
    ImPlotCol_COUNT = 14        # total color options; used for array field sizing
end

@cenum ImPlotStyleVar::Cint begin
    ImPlotStyleVar_LineWeight = 0       # float, line weight in pixels                                 
    ImPlotStyleVar_Marker = 1           # int,   marker specification                                  
    ImPlotStyleVar_MarkerSize = 2       # float, marker size in pixels (roughly the marker's "radius") 
    ImPlotStyleVar_MarkerWeight = 3     # float, outline weight of markers in pixels                   
    ImPlotStyleVar_ErrorBarSize = 4     # float, error bar whisker width in pixels                     
    ImPlotStyleVar_ErrorBarWeight = 5   # float, error bar whisker weight in pixels                    
    ImPlotStyleVar_DigitalBitHeight = 6 # float, digital channels bit height (at 1) in pixels          
    ImPlotStyleVar_DigitalBitGap = 7    # float, digital channels bit padding gap in pixels            
    ImPlotStyleVar_COUNT = 8            # total plot style options; used for array field sizing
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
    Min::Cfloat
    Max::Cfloat
end

struct ImPlotLimits
    X::ImPlotRange
    Y::ImPlotRange
end

