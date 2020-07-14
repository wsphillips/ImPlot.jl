# Histogram (Bar) plots
#
# Vertical bars
function PlotBars(values::Vector{Float32}; count::Integer = length(values),
                  label_id::String = "", width = 0.67, shift = 0.0, offset::Integer = 0,
                  stride::Integer = 1)

    LibCImPlot.PlotBarsFloatPtrIntFloat(label_id, values, Cint(count), Float32(width),
                                        Float32(shift), Cint(offset),
                                        Cint(stride * sizeof(Float32)))
end

function PlotBars(values::Vector{Float64}; count::Integer = length(values),
                  label_id::String = "", width = 0.67, shift = 0.0, offset::Integer = 0,
                  stride::Integer = 1)

    LibCImPlot.PlotBarsdoublePtrIntdouble(label_id, values, Cint(count), Float64(width),
                                          Float64(shift), Cint(offset),
                                          Cint(stride * sizeof(Float64)))
end

function PlotBars(x::Vector{Float32}, y::Vector{Float32};
                  count::Integer = min(length(x),length(y)), label_id::String = "",
                  width = 0.67, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsFloatPtrFloatPtr(label_id, x, y, Cint(count), Float32(width),
                                        Cint(offset), Cint(stride * sizeof(Float32)))
end

function PlotBars(x::Vector{Float64}, y::Vector{Float64};
                  count::Integer = min(length(x), length(y)), label_id::String = "",
                  width = 0.67, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsdoublePtrdoublePtr(label_id, x, y, Cint(count), Float64(width),
                                        Cint(offset), Cint(stride * sizeof(Float64)))
end

# Horizontal bars
function PlotBarsH(values::Vector{Float32}; count::Integer = length(values),
                  label_id::String = "", width = 0.67, shift = 0.0, offset::Integer = 0,
                  stride::Integer = 1)

    LibCImPlot.PlotBarsHFloatPtrIntFloat(label_id, values, Cint(count), Float32(width),
                                        Float32(shift), Cint(offset),
                                        Cint(stride * sizeof(Float32)))
end

function PlotBarsH(values::Vector{Float64}; count::Integer = length(values),
                  label_id::String = "", width = 0.67, shift = 0.0, offset::Integer = 0,
                  stride::Integer = 1)

    LibCImPlot.PlotBarsHdoublePtrIntdouble(label_id, values, Cint(count), Float64(width),
                                          Float64(shift), Cint(offset),
                                          Cint(stride * sizeof(Float64)))
end

function PlotBarsH(x::Vector{Float32}, y::Vector{Float32};
                  count::Integer = min(length(x),length(y)), label_id::String = "",
                  width = 0.67, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsHFloatPtrFloatPtr(label_id, x, y, Cint(count), Float32(width),
                                        Cint(offset), Cint(stride * sizeof(Float32)))
end

function PlotBarsH(x::Vector{Float64}, y::Vector{Float64};
                  count::Integer = min(length(x), length(y)), label_id::String = "",
                  width = 0.67, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsHdoublePtrdoublePtr(label_id, x, y, Cint(count), Float64(width),
                                        Cint(offset), Cint(stride * sizeof(Float64)))
end


