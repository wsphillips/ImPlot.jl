
function SetNextPlotTicksX(values::Vector{<:Real}, args...)
    eltype(values) !== Float64 && (values = Float64.(values))
    return SetNextPlotTicksX(values, args...)
end

function SetNextPlotTicksY(values::Vector{<:Real}, args...)
    eltype(values) !== Float64 && (values = Float64.(values))
    return SetNextPlotTicksY(values, args...)
end
