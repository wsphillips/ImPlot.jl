# Color mapping

import .LibCImPlot.GetColormapSize

function SetColormap(colormap, samples::Integer = 1)
    LibCImPlot.SetColormapPlotColormap(colormap, Cint(samples))
end

function SetColormap(colors::ImVec4, num_colors::Integer)
    LibCImPlot.SetColormapVec4Ptr(colors, Cint(num_colors))
end

function GetColormapColor(index::Integer)
    out = Ref{ImVec4}()
    LibCImPlot.GetColormapColor(out, Cint(index))
    return out[]
end

function LerpColormap(t::Integer)
    out = Ref{ImVec4}()
    LibCImPlot.LerpColormap(out, Cint(t))
    return out[]
end
