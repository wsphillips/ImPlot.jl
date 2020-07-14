# Pie charts

function PlotPieChart(values::Vector{Float32}, count::Integer,
                      x, y, radius; normalize::Bool = false, label_fmt::String = "%.1f",
                      angle0 = 90, label_ids::Vector{String} = ["" for _ in 1:length(values)])

    typeof(x) !== Float32 && (x = Float32(x))
    typeof(y) !== Float32 && (y = Float32(y))
    typeof(radius) !== Float32 && (radius = Float32(radius))
    typeof(angle0) !== Float32 && (angle0 = Float32(angle0))


    LibCImPlot.PlotPieChartFloatPtr(label_ids, values, Cint(count), x, y, radius, normalize,
                                    label_fmt, angle0)
end

function PlotPieChart(values::Vector{Float64}, count::Integer,
                      x, y, radius; normalize::Bool = false, label_fmt::String = "%.1f",
                      angle0 = 90, label_ids::Vector{String} = ["" for _ in 1:length(values)])

    typeof(x) !== Float64 && (x = Float64(x))
    typeof(y) !== Float64 && (y = Float64(y))
    typeof(radius) !== Float64 && (radius = Float64(radius))
    typeof(angle0) !== Float64 && (angle0 = Float64(angle0))


    LibCImPlot.PlotPieChartdoublePtr(label_ids, values, Cint(count), x, y, radius, normalize,
                                    label_fmt, angle0)
end
