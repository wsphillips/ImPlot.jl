function Annotation(x::Real, y::Real, pix_offset::ImVec2, fmt::String)
    col = GetLastItemColor()
    ccall((:ImPlot_Annotation_Str, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec4,ImVec2,Bool,Cstring),
          x, y, col, pix_offset, false, fmt)
end

function AnnotationClamped(x::Real, y::Real, pix_offset::ImVec2, fmt::String)
    col = GetLastItemColor()
    ccall((:ImPlot_Annotation_Str, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec4,ImVec2,Bool,Cstring),
          x, y, col, pix_offset, true, fmt)
end

function Annotation(x::Real, y::Real, col::ImVec4, pix_offset::ImVec2, fmt::String)
    ccall((:ImPlot_Annotation_Str, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec4,ImVec2,Bool,Cstring),
          x, y, col, pix_offset, false, fmt)
end

function AnnotationClamped(x::Real, y::Real, col::ImVec4, pix_offset::ImVec2, fmt::String)
    ccall((:ImPlot_Annotation_Str, libcimgui), Cvoid, (Cdouble,Cdouble,ImVec4,ImVec2,Bool,Cstring),
          x, y, col, pix_offset, true, fmt)
end
