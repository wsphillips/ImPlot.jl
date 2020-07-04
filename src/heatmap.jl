#Heatmap plots

function heatmap(x::AbstractArray, rows, cols, scale_min = 0.0, scale_max = 1.0;
                 label = "", label_fmt="", bounds_min = ImPlot.ImPlotPoint(0.0,0.0),
                 bounds_max = ImPlot.ImPlotPoint(1.0,1.0))

    if eltype(x) == Float64
        ImPlot.PlotHeatmapdoublePtr(label, x, Cint(rows), Cint(cols), Cdouble(scale_min),
                                    Cdouble(scale_max), label_fmt, bounds_min, bounds_max)
    elseif eltype(x) == Float32
        ImPlot.PlotHeatmapFloatPtr(label, x, Cint(rows), Cint(cols), Cfloat(scale_min),
                                   Cfloat(scale_max), label_fmt, bounds_min, bounds_max)
    else
        throw("Only 32/64 bit floating point values supported")
    end
end

