#Heatmap plots

import .LibCImPlot: PlotHeatmap

function PlotHeatmap(x::AbstractArray{T}, rows, cols, scale_min = 0.0, scale_max = 1.0;
                 label = "", label_fmt="%.1f", bounds_min = LibCImPlot.ImPlotPoint(0.0,0.0),
                 bounds_max = LibCImPlot.ImPlotPoint(1.0,1.0)) where {T<:ImPlotData}

    LibCImPlot.PlotHeatmap(label, x, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

