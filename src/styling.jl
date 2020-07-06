# Utils for modifying plot style variables

import .LibCImPlot: GetStyle, PopStyleVar, PopStyleColor

function PushStyleColor(idx::ImPlotCol, col::UInt32)
    LibCImPlot.PushStyleColorU32(idx, col)
end

function PushStyleColor(idx::ImPlotCol, col::ImVec4)
    LibCImPlot.PushStyleColorVec4(idx, col)
end

function PushStyleVar(idx::ImPlotStyleVar, val::AbstractFloat)
    LibCImPlot.PushStyleVarFloat(idx, Float32(val))
end

function PushStyleVar(idx::ImPlotStyleVar, val::Integer)
    LibCImPlot.PushStyleVarInt(idx, Cint(val))
end
