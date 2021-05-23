# Utils for modifying plot style variables

function PushStyleColor(idx, col::UInt32)
    LibCImPlot.PushStyleColorU32(idx, col)
end

function PushStyleColor(idx, col::ImVec4)
    LibCImPlot.PushStyleColorVec4(idx, col)
end

function PushStyleVar(idx, val::AbstractFloat)
    LibCImPlot.PushStyleVarFloat(idx, Float32(val))
end

function PushStyleVar(idx, val::Integer)
    LibCImPlot.PushStyleVarInt(idx, Cint(val))
end

function PopStyleColor(count::Integer = 1)
    LibCImPlot.PopStyleColor(count)
end

function PopStyleVar(count::Integer = 1)
    LibCImPlot.PopStyleVar(count)
end
