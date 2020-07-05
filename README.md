# ImPlot.jl
Plotting extension library that can be used in conjunction with 
[CImGui.jl](https://github.com/Gnimuc/CImGui.jl) to provide enhanced immediate-mode data 
visualization.

ImPlot.jl provides an interface to [cimplot](https://github.com/cimgui/cimplot), 
which is an auto-generated C API to [implot](https://github.com/epezent/implot), a C++ 
plotting extension library for [imgui](https://github.com/ocornut/imgui).

## Installation
```julia
]add https://github.com/wsphillips/ImPlot.jl
```

## Example Usage

Plots are delcarative and follow a similar pattern as CImGui.jl:

```julia

## within a CImGui.jl render loop
## This assumes you have CImGui.LibCImGui.ImGuiCond_Once in scope
...

if show_window
    @c CImGui.Begin("Plot Window", &show_window)
    y = rand(1000)
    ImPlot.SetNextPlotLimits(0.0,1000,0.0,1.0, ImGuiCond_Once)
    if (ImPlot.BeginPlot("Foo", "x1", "y1", CImGui.ImVec2(-1,300)))
        ImPlot.PlotLine(y)
        ImPlot.EndPlot()
    end
    CImGui.End()
end
```
