using CImGui
using CImGui.CSyntax
using CImGui.CSyntax.CStatic
using CImGui.GLFWBackend
using CImGui.OpenGLBackend
using CImGui.GLFWBackend.GLFW
using CImGui.OpenGLBackend.ModernGL
using Printf
using ImPlot
import CImGui.LibCImGui: ImGuiCond_Always, ImGuiCond_Once

const glsl_version = 130
GLFW.WindowHint(GLFW.CONTEXT_VERSION_MAJOR, 3)
GLFW.WindowHint(GLFW.CONTEXT_VERSION_MINOR, 0)
error_callback(err::GLFW.GLFWError) = @error "GLFW ERROR: code $(err.code) msg: $(err.description)"
GLFW.SetErrorCallback(error_callback)

window = GLFW.CreateWindow(1280, 720, "ImPlot Demo")
@assert window != C_NULL
GLFW.MakeContextCurrent(window)
GLFW.SwapInterval(1)  # enable vsync; set to 0 to benchmark

ctx = CImGui.CreateContext()
CImGui.StyleColorsDark()

fonts_dir = joinpath(@__DIR__, "..", "fonts")
fonts = CImGui.GetIO().Fonts
CImGui.AddFontFromFileTTF(fonts, joinpath(fonts_dir, "Roboto-Medium.ttf"), 16)

ImGui_ImplGlfw_InitForOpenGL(window, true)
ImGui_ImplOpenGL3_Init(glsl_version)

try
    show_another_window = false
    clear_color = Cfloat[0.45, 0.55, 0.60, 1.00]

    # make up some data
    xs1 = Float64.(collect(1:100))
    ys1 = rand(6000)
    noise = rand(length(xs1))
    bar_vals = Vector{Vector{Float64}}(undef, 5)
    bar_maxes = zeros(5)
    bar_mins = zeros(5)
    for i in 1:length(bar_vals)
        bar_vals[i] = Float64.(collect(range(rand(1:10), step=rand([-2,-1,1,2]), length=120)))
        bar_maxes[i] = maximum(bar_vals[i])
        bar_mins[i] = minimum(bar_vals[i])
    end
    bar_max = maximum(bar_maxes)
    bar_min = minimum(bar_mins)
    bar_counter = 1
    # main loop
    while !GLFW.WindowShouldClose(window)
        GLFW.PollEvents()
        
        ImGui_ImplOpenGL3_NewFrame()
        ImGui_ImplGlfw_NewFrame()
        CImGui.NewFrame()

        CImGui.Begin("Example Plots")
        
        @c CImGui.Checkbox("Show Examples", &show_another_window)
        CImGui.Text(@sprintf("Application average %.3f ms/frame (%.1f FPS)",
                             1000 / CImGui.GetIO().Framerate, CImGui.GetIO().Framerate))
        
        CImGui.End()

        if show_another_window
            @c CImGui.Begin("Examples Window", &show_another_window)
            if CImGui.CollapsingHeader("Line plots")

                ys1 .= rand(6000)
                ImPlot.SetNextPlotLimits(0.0, 6000, 0.0, 1.0, ImGuiCond_Always)
                # Using '##' in the label name hides the plot label, but lets 
                # us keep the label ID unique for modifying styling etc.
                if ImPlot.BeginPlot("##line", "x1", "y1", CImGui.ImVec2(-1,300))
                    ImPlot.PlotLine(ys1)
                    ImPlot.EndPlot()
                end
            end
            if CImGui.CollapsingHeader("Scatter plot")
                noise .= xs1 .+ rand(-5.0:0.1:5.0, length(xs1))
                ImPlot.SetNextPlotLimits(0,100,-5,105, ImGuiCond_Always)
                if ImPlot.BeginPlot("##scatter", "x2", "y2", CImGui.ImVec2(-1,300))
                    ImPlot.PlotScatter(xs1, noise)
                    ImPlot.EndPlot()
                end
            end
            if CImGui.CollapsingHeader("Bar plot")
                
                bar_val_step = [bar_vals[j][bar_counter] for j in 1:length(bar_vals)]
                
                ImPlot.SetNextPlotLimits(-0.5,4.5,bar_min, bar_max, ImGuiCond_Always)
                if ImPlot.BeginPlot("##bars", "", "", CImGui.ImVec2(-1,300))
                    ImPlot.PlotBars(bar_val_step)
                    ImPlot.EndPlot()
                end

                if bar_counter == 120
                    bar_counter = 1
                else
                    bar_counter += 1
                end
            end
            if CImGui.CollapsingHeader("Shaded plot")
                x = 1:1000
                y1 = [sin(x) for x in range(0,2π, length = length(x))]
                y_ref = -2.0
                ImPlot.SetNextPlotLimits(0,1000,-2,1, ImGuiCond_Always)
                if ImPlot.BeginPlot("##shaded", "", "", CImGui.ImVec2(-1,300))
                    ImPlot.PlotShaded(x, y1, y_ref)
                    ImPlot.EndPlot()
                end
            end
            CImGui.End()
        end
       

        # rendering
        CImGui.Render()
        GLFW.MakeContextCurrent(window)
        display_w, display_h = GLFW.GetFramebufferSize(window)
        glViewport(0, 0, display_w, display_h)
        glClearColor(clear_color...)
        glClear(GL_COLOR_BUFFER_BIT)
        ImGui_ImplOpenGL3_RenderDrawData(CImGui.GetDrawData())

        GLFW.MakeContextCurrent(window)
        GLFW.SwapBuffers(window)
    end
catch e
    @error "Error in renderloop!" exception=e
    Base.show_backtrace(stderr, catch_backtrace())
finally
    ImGui_ImplOpenGL3_Shutdown()
    ImGui_ImplGlfw_Shutdown()
    CImGui.DestroyContext(ctx)
    GLFW.DestroyWindow(window)
end
