#Heatmap plots

function PlotHeatmap(label_id, x::AbstractArray{T}, rows::Integer, cols::Integer, scale_min::Real = 0., scale_max::Real = 0., label_fmt::String = "&.1f", bounds_min = LibCImPlot.ImPlotPoint(0.0,0.0),
                 bounds_max = LibCImPlot.ImPlotPoint(1.0,1.0)) where {T<:ImPlotData}
     LibCImPlot.PlotHeatmap(label_id, x, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end
   
function PlotHeatmap(label_id, x::AbstractArray{T}, rows::Integer, cols::Integer, scale_min::Real = 0., scale_max::Real = 0., label_fmt::String = "&.1f", bounds_min = LibCImPlot.ImPlotPoint(0.0,0.0),
                 bounds_max = LibCImPlot.ImPlotPoint(1.0,1.0)) where {T<:Float64}
    LibCImPlot.PlotHeatmap(label_id, Float64.(x), rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end
 

function PlotHeatmap(x::AbstractArray{T}, rows, cols, scale_min = 0.0, scale_max = 1.0;
                 label_id::String = "", label_fmt="%.1f", bounds_min = LibCImPlot.ImPlotPoint(0.0,0.0),
                 bounds_max = LibCImPlot.ImPlotPoint(1.0,1.0)) where {T<:ImPlotData}

    LibCImPlot.PlotHeatmap(label_id, x, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

