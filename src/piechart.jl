# Pie charts
const plot_pie = IdDict(Float32 => LibCImPlot.PlotPieChartFloatPtr,
                        Float64 => LibCImPlot.PlotPieChartdoublePtr,
                        Int8    => LibCImPlot.PlotPieChartS8Ptr,
                        UInt8   => LibCImPlot.PlotPieChartU8Ptr,
                        Int16   => LibCImPlot.PlotPieChartS16Ptr,
                        UInt16  => LibCImPlot.PlotPieChartU16Ptr,
                        Int32   => LibCImPlot.PlotPieChartS32Ptr,
                        UInt32  => LibCImPlot.PlotPieChartU32Ptr,
                        Int64   => LibCImPlot.PlotPieChartS64Ptr,
                        UInt64  => LibCImPlot.PlotPieChartU64Ptr)

function PlotPieChart(values::Vector{T}, count::Integer, x, y, radius; normalize::Bool = false,
                      label_fmt::String = "%.1f", angle0 = 90.0,
                      label_ids::Vector{String} = ["" for _ in 1:length(values)]) where {T <: ImPlotData}

    plot_pie[T](label_ids, values, Cint(count), Float64(x), Float64(y), Float64(radius), normalize,
                                    label_fmt, Float64(angle0))
end

function PlotPieChart(values::Vector{T}, count::Integer, x, y, radius; normalize::Bool = false,
                      label_fmt::String = "%.1f", angle0 = 90.0,
                      label_ids::Vector{String} = ["" for _ in 1:length(values)]) where {T <: Real}

    plot_pie[Float64](label_ids, Float64.(values), Cint(count), Float64(x), Float64(y),
                      Float64(radius), normalize, label_fmt, Float64(angle0))
end

