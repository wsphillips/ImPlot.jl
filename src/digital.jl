# Digital signal plots

function PlotDigital(x::AbstractArray{T,1}, y::AbstractArray{T,1}; label::String = "",
                     count::Integer = min(length(x),length(y)), offset::Integer = 0,
                     stride::Integer = 1) where {T}

    if eltype(x) == Float64
        LibCImPlot.PlotDigitaldoublePtrdoublePtr(label, x, y, Cint(count), Cint(offset),
                                                 Cint(stride * sizeof(Float64)))
    elseif eltype(x) == Float32
        LibCImPlot.PlotDigitalFloatPtrFloatPtr(label, x, y, Cint(count), Cint(offset),
                                               Cint(stride * sizeof(Float32)))
    else
        x = convert.(Float32, x)
        y = convert.(Float32, y)
        LibCImPlot.PlotDigitalFloatPtrFloatPtr(label, x, y, Cint(count), Cint(offset),
                                               Cint(stride * sizeof(Float32)))
    end
end

function PlotDigital(x::AbstractArray{T1,1}, y::AbstractArray{T2,1}; kwargs...) where {T1,T2}
    (x, y) = promote(x,y)
    PlotDigital(x,y; kwargs...)
end


