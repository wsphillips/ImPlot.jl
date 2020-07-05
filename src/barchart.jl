# Histogram (Bar) plots
#
# Vertical bars
function PlotBars(label_id::String, values::Vector{Float32}, count::Integer;
                  width = 0.67, shift = 0.0, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsFloatPtrIntFloat(label_id, values, Cint(count), Float32(width),
                                        Float32(shift), Cint(offset),
                                        Cint(stride * sizeof(Float32)))
end

function PlotBars(label_id::String, values::Vector{Float64}, count::Integer;
                  width = 0.67, shift = 0.0, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsdoublePtrIntdouble(label_id, values, Cint(count), Float64(width),
                                          Float64(shift), Cint(offset),
                                          Cint(stride * sizeof(Float64)))
end

function PlotBars(label_id::String, x::Vector{Float32}, y::Vector{Float32}, count::Integer;
                  width = 0.67, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsFloatPtrFloatPtr(label_id, x, y, Cint(count), Float32(width),
                                        Cint(offset), Cint(stride * sizeof(Float32)))
end

function PlotBars(label_id::String, x::Vector{Float64}, y::Vector{Float64}, count::Integer;
                  width = 0.67, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsdoublePtrdoublePtr(label_id, x, y, Cint(count), Float64(width),
                                        Cint(offset), Cint(stride * sizeof(Float64)))
end

# Horizontal bars
function PlotBarsH(label_id::String, values::Vector{Float32}, count::Integer;
                  width = 0.67, shift = 0.0, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsHFloatPtrIntFloat(label_id, values, Cint(count), Float32(width),
                                        Float32(shift), Cint(offset),
                                        Cint(stride * sizeof(Float32)))
end

function PlotBarsH(label_id::String, values::Vector{Float64}, count::Integer;
                  width = 0.67, shift = 0.0, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsHdoublePtrIntdouble(label_id, values, Cint(count), Float64(width),
                                          Float64(shift), Cint(offset),
                                          Cint(stride * sizeof(Float64)))
end

function PlotBarsH(label_id::String, x::Vector{Float32}, y::Vector{Float32}, count::Integer;
                  width = 0.67, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsHFloatPtrFloatPtr(label_id, x, y, Cint(count), Float32(width),
                                        Cint(offset), Cint(stride * sizeof(Float32)))
end

function PlotBarsH(label_id::String, x::Vector{Float64}, y::Vector{Float64}, count::Integer;
                  width = 0.67, offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotBarsHdoublePtrdoublePtr(label_id, x, y, Cint(count), Float64(width),
                                        Cint(offset), Cint(stride * sizeof(Float64)))
end


