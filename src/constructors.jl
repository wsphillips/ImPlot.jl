
LibCImPlot.ImPlotPoint() = LibCImPlot.ImPlotPoint(0,0)
LibCImPlot.ImPlotPoint(p::ImVec2) = LibCImPlot.ImPlotPoint(p.x, p.y)

LibCImPlot.ImPlotRange() = LibCImPlot.ImPlotRange(0,0)

LibCImPlot.ImPlotLimits() = LibCImPlot.ImPlotLimits(ImPlotRange(), ImPlotRange())
