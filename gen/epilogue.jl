function Annotate(x::Real, y::Real, pix_offset::ImVec2, fmt::String...)
    ccall((:ImPlot_AnnotateStr, libcimplot), Cvoid, (Cdouble,Cdouble,ImVec2,Cstring...),
          x, y, pix_offset, fmt...)
end

function AnnotateClamped(x::Real, y::Real, pix_offset::ImVec2, fmt::String...)
    ccall((:ImPlot_AnnotateClampedStr, libcimplot), Cvoid, (Cdouble,Cdouble,ImVec2,Cstring...),
          x, y, pix_offset, fmt...)
end

function Annotate(x::Real, y::Real, pix_offset::ImVec2, color::ImVec4, fmt::String...)
    ccall((:ImPlot_AnnotateVec4, libcimplot), Cvoid, (Cdouble,Cdouble,ImVec2,ImVec4,Cstring...),
          x, y, pix_offset, color, fmt...)
end

function AnnotateClamped(x::Real, y::Real, pix_offset::ImVec2, color::ImVec4, fmt::String...)
    ccall((:ImPlot_AnnotateClampedVec4, libcimplot), Cvoid, (Cdouble,Cdouble,ImVec2,ImVec4,Cstring...),
          x, y, pix_offset, color, fmt...)
end
