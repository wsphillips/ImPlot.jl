
include("Renderer.jl")
using .Renderer
using Printf

using CImGui
using CImGui.CSyntax
using CImGui.CSyntax.CStatic

import CImGui:  # do we need to import this separately?
    ImVec2, # I don't get all of this Im*, ImGui_* and so on - instead of a consistent namespace CImGui.* (or Im::*)
    ImGuiCond_Appearing, # CImGui.Cond_Appearing would be cleaner, but probably too excessive to replace all...
    ImGuiCond_FirstUseEver,
    ImGuiCond_Once,
    ImGuiWindowFlags_MenuBar,
    ImGuiBackendFlags_RendererHasVtxOffset

import CImGui.LibCImGui:  # do we need to import this separately?
    ImDrawIdx

using ImPlot

import ImPlot.LibCImPlot: # do we need to import this separately?
    ImPlotMarker_Circle,
    ShowUserGuide,
    ShowMetricsWindow,
    ShowStyleSelector,
    ShowColormapSelector,
    SetNextMarkerStyle,
    IMPLOT_AUTO,
    IMPLOT_AUTO_COL,
    ImPlotStyleVar_FillAlpha

using Random

# ==== fixes in api (should be fixed after auto-generation...) ====
function SetNextMarkerStyle_fix(marker = IMPLOT_AUTO, size = IMPLOT_AUTO, fill = IMPLOT_AUTO_COL, weight = IMPLOT_AUTO, outline = IMPLOT_AUTO_COL)
    ccall((:ImPlot_SetNextMarkerStyle, ImPlot.LibCImPlot.libcimplot), Cvoid, 
        (ImPlot.LibCImPlot.ImPlotMarker, Cfloat, CImGui.ImVec4, Cfloat, CImGui.ImVec4), marker, size, fill, weight, outline)
end
function SetNextLineStyle_fix(col = IMPLOT_AUTO_COL, weight = IMPLOT_AUTO)
    ccall((:ImPlot_SetNextLineStyle, ImPlot.LibCImPlot.libcimplot), Cvoid, 
        (CImGui.ImVec4, Cfloat), col, weight)
end
# ======================


function ShowDemoWindow()

    DEMO_TIME = CImGui.GetTime()
    #? ouch... maybe a mutable state will handle these fields?
    #? bool* p_open was input argument
    @cstatic p_open, show_imgui_metrics, show_implot_metrics, show_imgui_style_editor, show_implot_style_editor, show_implot_benchmark = false, false, false, false, false, false begin
        if (show_imgui_metrics) 
            @c CImGui.ShowMetricsWindow(&show_imgui_metrics)
        end
        if (show_implot_metrics) 
            @c ShowMetricsWindow(&show_implot_metrics) #? ImPlot.LibCImPlot.
        end
        if (show_imgui_style_editor) 
            @c CImGui.Begin("Style Editor (CImGui)", &show_imgui_style_editor)
            CImGui.ShowStyleEditor()
            CImGui.End()
        end
        if (show_implot_style_editor) 
            CImGui.SetNextWindowSize(ImVec2(415,762), ImGuiCond_Appearing)
            @c CImGui.Begin("Style Editor (ImPlot)", &show_implot_style_editor)
            ImPlot.ShowStyleEditor()
            CImGui.End()
        end
        if (show_implot_benchmark) 
            CImGui.SetNextWindowSize(ImVec2(530,740), ImGuiCond_Appearing)
            @c CImGui.Begin("ImPlot Benchmark Tool", &show_implot_benchmark)
            ImPlot.ShowBenchmarkTool()
            CImGui.End()
            return
        end

        CImGui.SetNextWindowPos(ImVec2(50, 50), ImGuiCond_FirstUseEver)
        CImGui.SetNextWindowSize(ImVec2(600, 750), ImGuiCond_FirstUseEver) 
        @c CImGui.Begin("ImPlot Demo", &p_open, ImGuiWindowFlags_MenuBar)
        if (CImGui.BeginMenuBar()) 
            if (CImGui.BeginMenu("Tools")) 
                @c CImGui.MenuItem("Metrics (CImGui)",      "", &show_imgui_metrics) # NULL -> ""
                @c CImGui.MenuItem("Metrics (ImPlot)",      "", &show_implot_metrics)
                @c CImGui.MenuItem("Style Editor (CImGui)", "", &show_imgui_style_editor)
                @c CImGui.MenuItem("Style Editor (ImPlot)", "", &show_implot_style_editor)
                @c CImGui.MenuItem("Benchmark",             "", &show_implot_benchmark)
                CImGui.EndMenu()
            end
            CImGui.EndMenuBar()
        end
    end # @cstatic
    
    #-------------------------------------------------------------------------
    CImGui.Text("ImPlot says hello - but what version?") #! IMPLOT_VERSION)
    CImGui.Spacing()

    if (CImGui.CollapsingHeader("Help")) 
        CImGui.Text("ABOUT THIS DEMO:")
        CImGui.BulletText("Sections below are demonstrating many aspects of the library.")
        CImGui.BulletText("The \"Tools\" menu above gives access to: Style Editors (ImPlot/CImGui)\nand Metrics (general purpose Dear CImGui debugging tool).")
        CImGui.Separator()
        CImGui.Text("PROGRAMMER GUIDE:")
        CImGui.BulletText("See the ShowDemoWindow() code in implot_demo.cpp. <- you are here!")
        CImGui.BulletText("By default, anti-aliased lines are turned OFF.")
        CImGui.Indent()
            CImGui.BulletText("Software AA can be enabled globally with ImPlotStyle.AntiAliasedLines.")
            CImGui.BulletText("Software AA can be enabled per plot with ImPlotFlags_AntiAliased.")
            CImGui.BulletText("AA for plots can be toggled from the plot's context menu.")
            CImGui.BulletText("If permitable, you are better off using hardware AA (e.g. MSAA).")
        CImGui.Unindent()
        CImGui.BulletText("If you see visual artifacts, do one of the following:")
        CImGui.Indent()
        CImGui.BulletText("Handle ImGuiBackendFlags_RendererHasVtxOffset for 16-bit indices in your backend.")
        CImGui.BulletText("Or, enable 32-bit indices in imconfig.h.")
        CImGui.BulletText("Your current configuration is:")
        CImGui.Indent()
        CImGui.BulletText(@sprintf("ImDrawIdx: %d-bit", sizeof(ImDrawIdx) * 8)) #? why not $interpolate
        CImGui.BulletText(@sprintf("ImGuiBackendFlags_RendererHasVtxOffset: %s", (CImGui.GetIO().BackendFlags & ImGuiBackendFlags_RendererHasVtxOffset > 0) ? "True" : "False"))
        CImGui.Unindent()
        CImGui.Unindent()
#ifdef IMPLOT_DEMO_USE_DOUBLE
        CImGui.BulletText("The demo data precision is: double")
#else
#        CImGui.BulletText("The demo data precision is: float") #?
#endif

        CImGui.Separator()
        CImGui.Text("USER GUIDE:")
        ShowUserGuide()
    end
    #-------------------------------------------------------------------------
    if (CImGui.CollapsingHeader("Configuration")) 
        CImGui.ShowFontSelector("Font")
        CImGui.ShowStyleSelector("CImGui Style")
        ShowStyleSelector("ImPlot Style") #? ImPlot.LibCImPlot
        ShowColormapSelector("ImPlot Colormap") #? ImPlot.LibCImPlot
        indent = CImGui.CalcItemWidth() - CImGui.GetFrameHeight()
        CImGui.Indent(CImGui.CalcItemWidth() - CImGui.GetFrameHeight())
        #! CImGui.Checkbox("Anti-Aliased Lines", &ImPlot.GetStyle().AntiAliasedLines)
        CImGui.Unindent(indent)
    end
    
    #-------------------------------------------------------------------------
    if (CImGui.CollapsingHeader("Line Plots")) 
        #? ouch...
        @cstatic xs1, ys1, xs2, ys2 = zeros(Float32, 1001), zeros(Float32, 1001), zeros(Float32, 11), zeros(Float32, 11) begin
            for i = 1:1001 #! not 0-based 
                xs1[i] = i * 0.001
                ys1[i] = 0.5 + 0.5 * sin(50 * (xs1[i] + DEMO_TIME / 10))
            end
            for i = 1:11 #! not 0-based 
                xs2[i] = i * 0.1
                ys2[i] = xs2[i] * xs2[i]
            end
            CImGui.BulletText("Anti-aliasing can be enabled from the plot's context menu (see Help).")
            if ImPlot.BeginPlot("Line Plot", "x", "f(x)", ImVec2(-1, 200)) #? ImVec2 required, no default value
                ImPlot.PlotLine(xs1, ys1, label = "sin(x)")
                SetNextMarkerStyle_fix(ImPlotMarker_Circle) #! error in api #? ImPlot.LibCImPlot #? no default values
                ImPlot.PlotLine(xs2, ys2, label = "x^2")
                ImPlot.EndPlot()
            end
        end
    end
    #-------------------------------------------------------------------------
    if (CImGui.CollapsingHeader("Filled Line Plots")) 
        @cstatic xs1, ys1, ys2, ys3, show_lines, show_fills, fill_ref = zeros(Float64, 101), zeros(Float64, 101), zeros(Float64, 101), zeros(Float64, 101), true, true, Float32(0.0) begin
            Random.seed!(0)
            for i = 1:101 
                xs1[i] = i
                ys1[i] = rand(400.0 : 0.001 : 450.0)
                ys2[i] = rand(275.0 : 0.001 : 350.0)
                ys3[i] = rand(150.0 : 0.001 : 225.0)
            end

            @c CImGui.Checkbox("Lines", &show_lines) 
            CImGui.SameLine()
            @c CImGui.Checkbox("Fills", &show_fills)
            @c CImGui.DragFloat("Reference", &fill_ref, 1, -100, 500)

            ImPlot.SetNextPlotLimits(0, 100, 0, 500, ImGuiCond_Once) #? no default cond argument
            if (ImPlot.BeginPlot("Stock Prices", "Days", "Price", ImVec2(-1, 200))) #? no default size
                if (show_fills) 
                    ImPlot.PushStyleVar(ImPlotStyleVar_FillAlpha, 0.25)
                    ImPlot.PlotShaded(xs1, ys1, fill_ref, label = "Stock 1")
                    ImPlot.PlotShaded(xs1, ys2, fill_ref, label = "Stock 2")
                    ImPlot.PlotShaded(xs1, ys3, fill_ref, label = "Stock 3")
                    ImPlot.PopStyleVar()
                end
                if (show_lines) 
                    ImPlot.PlotLine(xs1, ys1, label = "Stock 1")
                    ImPlot.PlotLine(xs1, ys2, label = "Stock 2")
                    ImPlot.PlotLine(xs1, ys3, label = "Stock 3")
                end
                ImPlot.EndPlot()
            end
        end
    end
    #-------------------------------------------------------------------------
    if (CImGui.CollapsingHeader("Shaded Plots##")) 
        @cstatic xs, ys, ys1, ys2, ys3, ys4, alpha = zeros(Float32, 1001), zeros(Float32, 1001), zeros(Float32, 1001), zeros(Float32, 1001), zeros(Float32, 1001), zeros(Float32, 1001), Float32(0.25) begin
            Random.seed!(0)
            for i = 1:1001
                xs[i]  = i * 0.001
                ys[i]  = 0.25 + 0.25 * sin(25 * xs[i]) * sin(5 * xs[i]) + rand(-0.01 : 0.00001 : 0.01)
                ys1[i] = ys[i] + rand(0.1 : 0.00001 : 0.12)
                ys2[i] = ys[i] - rand(0.1 : 0.00001 : 0.12)
                ys3[i] = 0.75 + 0.2 * sin(25 * xs[i])
                ys4[i] = 0.75 + 0.1 * cos(25 * xs[i])
            end
            @c CImGui.DragFloat("Alpha", &alpha, 0.01, 0, 1)

            if (ImPlot.BeginPlot("Shaded Plots", "X-Axis", "Y-Axis", ImVec2(-1, 200))) #? no default size
                ImPlot.PushStyleVar(ImPlotStyleVar_FillAlpha, alpha)
                ImPlot.PlotShaded(xs, ys1, ys2, label = "Uncertain Data")
                ImPlot.PlotLine(xs, ys, label = "Uncertain Data")
                ImPlot.PlotShaded(xs, ys3, ys4, label = "Overlapping")
                ImPlot.PlotLine(xs, ys3, label = "Overlapping")
                ImPlot.PlotLine(xs, ys4, label = "Overlapping")
                ImPlot.PopStyleVar()
                ImPlot.EndPlot()
            end
        end
    end
    #-------------------------------------------------------------------------
    # TODO the rest ...
end

# main functinon
function show() 

    Renderer.render(
        ()->ShowDemoWindow(), 
        width = 1360, 
        height = 780, 
        title = "Demo plots", 
        hotloading = true
    )
end

