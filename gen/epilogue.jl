function Annotate(x::Real, y::Real, pix_offset::ImVec2, fmt::String...)
    ccall((:ImPlot_Annotate_Str, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec2,Cstring...),
          x, y, pix_offset, fmt...)
end

function AnnotateClamped(x::Real, y::Real, pix_offset::ImVec2, fmt::String...)
    ccall((:ImPlot_AnnotateClamped_Str, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec2,Cstring...),
          x, y, pix_offset, fmt...)
end

function Annotate(x::Real, y::Real, pix_offset::ImVec2, color::ImVec4, fmt::String...)
    ccall((:ImPlot_Annotate_Vec4, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec2,ImVec4,Cstring...),
          x, y, pix_offset, color, fmt...)
end

function AnnotateClamped(x::Real, y::Real, pix_offset::ImVec2, color::ImVec4, fmt::String...)
    ccall((:ImPlot_AnnotateClamped_Vec4, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec2,ImVec4,Cstring...),
          x, y, pix_offset, color, fmt...)
end
