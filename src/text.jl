# Plot text labels at arbitrary coordinate points

function PlotText(text::String, x::Float32, y::Float32; vertical::Bool = false,
                  pixel_offset::ImVec2 = ImVec2(0,0))
    LibCImPlot.PlotTextFloat(text, x, y, vertical, pixel_offset)
end

function PlotText(text::String, x::Float64, y::Float64; vertical::Bool = false,
                  pixel_offset::ImVec2 = ImVec2(0,0))
    LibCImPlot.PlotTextdouble(text, x, y, vertical, pixel_offset)
end
