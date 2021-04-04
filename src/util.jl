
import .LibCImPlot: GetPlotPos, GetPlotSize # ,PlotToPixels

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

