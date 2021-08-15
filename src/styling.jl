# Utils for modifying plot style variables

function PushStyleColor(idx, col::UInt32)
    return LibCImPlot.PushStyleColorU32(idx, col)
end

function PushStyleColor(idx, col::ImVec4)
    return LibCImPlot.PushStyleColorVec4(idx, col)
end

function PushStyleVar(idx, val::AbstractFloat)
    return LibCImPlot.PushStyleVarFloat(idx, Float32(val))
end

function PushStyleVar(idx, val::Integer)
    return LibCImPlot.PushStyleVarInt(idx, Cint(val))
end

function PopStyleColor(count::Integer=1)
    return LibCImPlot.PopStyleColor(count)
end

function PopStyleVar(count::Integer=1)
    return LibCImPlot.PopStyleVar(count)
end
