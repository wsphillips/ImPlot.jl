# Error bar plotting/annotation

function PlotErrorBars(label_id::String, x::Vector{Float32}, y::Vector{Float32},
                       error::Vector{Float32};
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotErrorBarsFloatPtrFloatPtrFloatPtrInt(label_id, x, y, error,
                                                        Cint(count), Cint(offset),
                                                        Cint(stride * sizeof(Float32)))
end

function PlotErrorBars(label_id::String, x::Vector{Float64}, y::Vector{Float64},
                       error::Vector{Float64};
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotErrorBarsdoublePtrdoublePtrdoublePtrInt(label_id, x, y, error,
                                                        Cint(count), Cint(offset),
                                                        Cint(stride * sizeof(Float64)))
end

function PlotErrorBars(label_id::String, x::Vector{Float32}, y::Vector{Float32},
                       negative::Vector{Float32}, positive::Vector{Float32};
                       count::Integer = min(length(x), length(y), length(negative), length(positive)),
                       offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr(label_id, x, y, error,
                                                        Cint(count), Cint(offset),
                                                        Cint(stride * sizeof(Float32)))
end

function PlotErrorBars(label_id::String, x::Vector{Float64}, y::Vector{Float64},
                       negative::Vector{Float64}, positive::Vector{Float64};
                       count::Integer = min(length(x), length(y), length(negative), length(positive)),
                       offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr(label_id, x, y, error,
                                                        Cint(count), Cint(offset),
                                                        Cint(stride * sizeof(Float64)))
end

# Horizontal error bars/annotations

function PlotErrorBarsH(label_id::String, x::Vector{Float32}, y::Vector{Float32},
                       error::Vector{Float32};
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt(label_id, x, y, error,
                                                        Cint(count), Cint(offset),
                                                        Cint(stride * sizeof(Float32)))
end

function PlotErrorBarsH(label_id::String, x::Vector{Float64}, y::Vector{Float64},
                       error::Vector{Float64};
                       count::Integer = min(length(x), length(y), length(error)),
                       offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt(label_id, x, y, error,
                                                        Cint(count), Cint(offset),
                                                        Cint(stride * sizeof(Float64)))
end

function PlotErrorBarsH(label_id::String, x::Vector{Float32}, y::Vector{Float32},
                       negative::Vector{Float32}, positive::Vector{Float32};
                       count::Integer = min(length(x), length(y), length(negative), length(positive)),
                       offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr(label_id, x, y, error,
                                                        Cint(count), Cint(offset),
                                                        Cint(stride * sizeof(Float32)))
end

function PlotErrorBarsH(label_id::String, x::Vector{Float64}, y::Vector{Float64},
                       negative::Vector{Float64}, positive::Vector{Float64};
                       count::Integer = min(length(x), length(y), length(negative), length(positive)),
                       offset::Integer = 0, stride::Integer = 1)

    LibCImPlot.PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr(label_id, x, y, error,
                                                        Cint(count), Cint(offset),
                                                        Cint(stride * sizeof(Float64)))
end


