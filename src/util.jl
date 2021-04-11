
import .LibCImPlot: GetPlotPos, 
    GetPlotSize,
    PixelsToPlotVec2,
    PixelsToPlotFloat,
    PlotToPixelsPlotPoInt,
    PlotToPixelsdouble,
    GetPlotMousePos,
    GetPlotLimits,
    GetPlotQuery,
    GetLastItemColor,
    GetColormapColor,
    LerpColormap,
    NextColormapColor


function SetNextPlotTicksX(values::Vector{<:Real}, n_ticks::Integer;
                           labels::Vector{String} = [""], show_default::Bool = false)

    eltype(values) !== Float64 && (values = Float64.(values))

    LibCImPlot.SetNextPlotTicksXdoublePtr(values, Cint(n_ticks), labels, show_default) 
end

function SetNextPlotTicksX(x_min, x_max, n_ticks::Integer;
                           labels::Vector{String} = [""], show_default::Bool = false)
    
    typeof(x_min) !== Float64 && (x_min = Float64(x_min))
    typeof(x_max) !== Float64 && (x_max = Float64(x_max))

    LibCImPlot.SetNextPlotTicksXdouble(x_min, x_max, Cint(n_ticks), labels, show_default)
end

function SetNextPlotTicksY(values::Vector{<:Real}, n_ticks::Integer;
                           labels::Vector{String} = [""], show_default::Bool = false,
                           y_axis::Integer = 0)

    eltype(values) !== Float64 && (values = Float64.(values))

    LibCImPlot.SetNextPlotTicksYdoublePtr(values, Cint(n_ticks), labels, show_default,
                                          Cint(y_axis))
end

function SetNextPlotTicksY(y_min, y_max, n_ticks::Integer;
                           labels::Vector{String} = [""], show_default::Bool = false,
                           y_axis::Integer = 0)

    typeof(y_min) !== Float64 && (y_min = Float64(y_min))
    typeof(y_max) !== Float64 && (y_max = Float64(y_max))

    LibCImPlot.SetNextPlotTicksYdouble(y_min, y_max, Cint(n_ticks), labels, show_default,
                                       Cint(y_axis))
end

function GetPlotPos()
    out = Ref{ImVec2}()
    LibCImPlot.GetPlotPos(out)
    return out[]
end

function GetPlotSize()
    out = Ref{ImVec2}()
    LibCImPlot.GetPlotSize(out)
    return out[]
end

#=
function PlotToPixels(plt::ImPlotPoint, y_axis::Integer = -1)
    out = Ref{ImVec2}()
    LibCImPlot.PlotToPixels(out, plt, Cint(y_axis))
    return out[]
end
=#
LibCImPlot.SetLegendLocation(location, orientation) = LibCImPlot.SetLegendLocation(location, orientation, false)
LibCImPlot.SetLegendLocation(location) = LibCImPlot.SetLegendLocation(location, LibCImPlot.ImPlotOrientation_Vertical, false)

LibCImPlot.SetNextPlotLimits(xmin, xmax, ymin, ymax) = LibCImPlot.SetNextPlotLimits(xmin, xmax, ymin, ymax, ImGuiCond_Once)

function PixelsToPlotVec2(pix, y_axis = 0)
    out = Ref(LibCImPlot.ImPlotPoint(0, 0))
    LibCImPlot.PixelsToPlotVec2(out, pix, y_axis)
    return out[]
end
function PixelsToPlotFloat(x, y, y_axis = 0)
    out = Ref(LibCImPlot.ImPlotPoint(0, 0))
    LibCImPlot.PixelsToPlotFloat(out, x, y, y_axis)
    return out[]
end
function PlotToPixelsPlotPoInt(plt, y_axis = 0)
    out = Ref{ImVec2}()
    LibCImPlot.PlotToPixelsPlotPoInt(out, plt, y_axis)
    return out[]
end
function PlotToPixelsdouble(x::Real, y::Real, y_axis = 0)
    out = Ref{ImVec2}()
    LibCImPlot.PlotToPixelsdouble(out, x, y, y_axis)
    return out[]
end
function GetPlotMousePos(y_axis = 0)
    out = Ref(LibCImPlot.ImPlotPoint(0, 0))
    LibCImPlot.GetPlotMousePos(out, y_axis)
    return out[]
end
function GetPlotLimits(y_axis = 0)
    r = LibCImPlot.ImPlotRange(0,0)
    out = Ref(LibCImPlot.ImPlotLimits(r, r))
    LibCImPlot.GetPlotLimits(out, y_axis)
    return out[]
end
function GetPlotQuery(y_axis = 0)
    r = LibCImPlot.ImPlotRange(0,0)
    out = Ref(LibCImPlot.ImPlotLimits(r, r))
    LibCImPlot.GetPlotQuery(out, y_axis)
    return out[]
end
function GetLastItemColor()
    out = Ref{ImVec4}()
    LibCImPlot.GetLastItemColor(out)
    return out[]
end
function GetColormapColor(index)
    out = Ref{ImVec4}()
    LibCImPlot.GetColormapColor(out, index)
    return out[]
end
function LerpColormap(t)
    out = Ref{ImVec4}()
    LibCImPlot.LerpColormap(out, t)
    return out[]
end
function NextColormapColor()
    out = Ref{ImVec4}()
    LibCImPlot.NextColormapColor(out)
    return out[]
end


function Contains(range::LibCImPlot.ImPlotRange, value)
    return value >= range.Min && value <= range.Max
end
function Contains(limits::LibCImPlot.ImPlotLimits, x, y)
    return Contains(limits.X, x) && Contains(limits.Y, y)
end
function Contains(limits::LibCImPlot.ImPlotLimits, p::LibCImPlot.ImPlotPoint)
    return Contains(limits.X, p.x) && Contains(limits.Y, p.y)
end
