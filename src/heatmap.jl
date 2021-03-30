#Heatmap plots
const plot_heatmap = IdDict(Float32 => LibCImPlot.PlotHeatmapFloatPtr,
                            Float64 => LibCImPlot.PlotHeatmapdoublePtr,
                            Int8    => LibCImPlot.PlotHeatmapS8Ptr,
                            UInt8   => LibCImPlot.PlotHeatmapU8Ptr,
                            Int16   => LibCImPlot.PlotHeatmapS16Ptr,
                            UInt16  => LibCImPlot.PlotHeatmapU16Ptr,
                            Int32   => LibCImPlot.PlotHeatmapS32Ptr,
                            UInt32  => LibCImPlot.PlotHeatmapU32Ptr,
                            Int64   => LibCImPlot.PlotHeatmapS64Ptr,
                            UInt64  => LibCImPlot.PlotHeatmapU64Ptr)


function PlotHeatmap(x::AbstractArray{T,N}, rows, cols, scale_min = 0, scale_max = 0;
                 label_id = "", label_fmt="%.1f", bounds_min = ImPlotPoint(0.0,0.0),
                 bounds_max = ImPlotPoint(1.0,1.0)) where {T <: ImPlotData, N}

    plot_heatmap[T](label_id, x, Cint(rows), Cint(cols), Cdouble(scale_min),
                    Cdouble(scale_max), label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(x::AbstractArray{T,N}, rows, cols, scale_min = 0, scale_max = 0;
                 label_id = "", label_fmt="%.1f", bounds_min = ImPlotPoint(0.0,0.0),
                 bounds_max = ImPlotPoint(1.0,1.0)) where {T <: Real, N}

        plot_heatmap[Float64](label_id, Float64.(x), Cint(rows), Cint(cols), Cdouble(scale_min),
                                    Cdouble(scale_max), label_fmt, bounds_min, bounds_max)
end

