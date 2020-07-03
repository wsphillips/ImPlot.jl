using CImGui
using CImGui.CSyntax
using CImGui.CSyntax.CStatic
using CImGui.GLFWBackend
using CImGui.OpenGLBackend
using CImGui.GLFWBackend.GLFW
using CImGui.OpenGLBackend.ModernGL
using Printf
using CImPlot

# OpenGL 3.0 + GLSL 130
const glsl_version = 130
GLFW.WindowHint(GLFW.CONTEXT_VERSION_MAJOR, 3)
GLFW.WindowHint(GLFW.CONTEXT_VERSION_MINOR, 0)

# setup GLFW error callback
error_callback(err::GLFW.GLFWError) = @error "GLFW ERROR: code $(err.code) msg: $(err.description)"
GLFW.SetErrorCallback(error_callback)

# create window
window = GLFW.CreateWindow(1280, 720, "ImPlot Demo")
@assert window != C_NULL
GLFW.MakeContextCurrent(window)
GLFW.SwapInterval(0)  # enable vsync

# setup Dear ImGui context
ctx = CImGui.CreateContext()

# setup Dear ImGui style
CImGui.StyleColorsDark()

# load Fonts
fonts_dir = joinpath(@__DIR__, "..", "fonts")
fonts = CImGui.GetIO().Fonts
CImGui.AddFontFromFileTTF(fonts, joinpath(fonts_dir, "Roboto-Medium.ttf"), 16)

# setup Platform/Renderer bindings
ImGui_ImplGlfw_InitForOpenGL(window, true)
ImGui_ImplOpenGL3_Init(glsl_version)

try
    show_demo_window = true
    show_another_window = false
    clear_color = Cfloat[0.45, 0.55, 0.60, 1.00]

    xs1 = collect(1:600000) .* .001
    ys1 = Vector{Float32}(undef, 600000)
    while !GLFW.WindowShouldClose(window)
        GLFW.PollEvents()
        # start the Dear ImGui frame
        ImGui_ImplOpenGL3_NewFrame()
        ImGui_ImplGlfw_NewFrame()
        CImGui.NewFrame()

        # show the big demo window
        show_demo_window && @c CImPlot.ImPlot.ShowDemoWindow(&show_demo_window)
        # show a simple window that we create ourselves.
        # we use a Begin/End pair to created a named window.
        @cstatic f=Cfloat(0.0) counter=Cint(0) begin
            CImGui.Begin("Hello, world!")  # create a window called "Hello, world!" and append into it.
            CImGui.Text("This is some useful text.")  # display some text
            @c CImGui.Checkbox("Demo Window", &show_demo_window)  # edit bools storing our window open/close state
            @c CImGui.Checkbox("Another Window", &show_another_window)

            @c CImGui.SliderFloat("float", &f, 0, 1)  # edit 1 float using a slider from 0 to 1
            CImGui.ColorEdit3("clear color", clear_color)  # edit 3 floats representing a color
            CImGui.Button("Button") && (counter += 1)

            CImGui.SameLine()
            CImGui.Text("counter = $counter")
            CImGui.Text(@sprintf("Application average %.3f ms/frame (%.1f FPS)", 1000 / CImGui.GetIO().Framerate, CImGui.GetIO().Framerate))

            CImGui.End()
        end

        # show another simple window.
        if show_another_window
            @c CImGui.Begin("Plot Window", &show_another_window)
            ys1 .= rand(Float32, 600000) # 0.5 .+ 0.5 .* sin.(50 .* xs1)
            if (CImPlot.BeginPlot())
                CImPlot.plotline(xs1,ys1, count = 60000, offset = 0, stride = 10)
                CImPlot.EndPlot()
            end
            if (CImPlot.BeginPlot())
                CImPlot.plotline(500000:length(ys1),ys1)
                CImPlot.EndPlot()
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
