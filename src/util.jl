#=
function SetNextPlotTicksX(values::Vector{<:Real}, n_ticks::Integer, args...)
    eltype(values) !== Float64 && (values = Float64.(values))
    return SetNextPlotTicksX(values, n_ticks, args...)
end

function SetNextPlotTicksY(values::Vector{<:Real}, n_ticks::Integer, args...)
    eltype(values) !== Float64 && (values = Float64.(values))
    return SetNextPlotTicksY(values, n_ticks, args...)
end
=#
