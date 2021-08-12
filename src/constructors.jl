ImPlotPoint() = ImPlotPoint(0, 0)
ImPlotPoint(p::ImVec2) = ImPlotPoint(p.x, p.y)
ImPlotRange() = ImPlotRange(0, 0)
ImPlotLimits() = ImPlotLimits(ImPlotRange(), ImPlotRange())
