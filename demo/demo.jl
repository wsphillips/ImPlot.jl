using CImGui
using CImGui.CSyntax
using CImGui.CSyntax.CStatic
using CImGui.ImGuiGLFWBackend
using CImGui.ImGuiOpenGLBackend
using CImGui.ImGuiGLFWBackend.LibGLFW
using CImGui.ImGuiOpenGLBackend.ModernGL
using Printf
using ImPlot

@static if Sys.isapple()
    # OpenGL 3.2 + GLSL 150
    const glsl_version = 150
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3)
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2)
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE) # 3.2+ only
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE) # required on Mac
else
    # OpenGL 3.0 + GLSL 130
    const glsl_version = 130
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3)
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0)
    # glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE) # 3.2+ only
    # glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE) # 3.0+ only
end

# setup GLFW error callback
error_callback(err::Exception) = @error "GLFW ERROR: code $(err.code) msg: $(err.description)"
glfwSetErrorCallback(Ref(error_callback))

# create window
window = glfwCreateWindow(1280, 720, "ImPlot Demo", C_NULL, C_NULL)
@assert window != C_NULL
glfwMakeContextCurrent(window)
glfwSwapInterval(1)  # enable vsync

# setup Dear ImGui context
ctx = CImGui.CreateContext()
pctx = ImPlot.CreateContext()
ImPlot.SetImGuiContext(ctx)
# setup Dear ImGui style
CImGui.StyleColorsDark()

# load Fonts
fonts_dir = joinpath(@__DIR__, "..", "fonts")
fonts = unsafe_load(CImGui.GetIO()).Fonts
CImGui.AddFontFromFileTTF(fonts, joinpath(fonts_dir, "Roboto-Medium.ttf"), 16)

# setup Platform/Renderer bindings
glfw_ctx = ImGuiGLFWBackend.create_context(window; install_callbacks = true)
ImGuiGLFWBackend.init(glfw_ctx)
opengl_ctx = ImGuiOpenGLBackend.create_context(glsl_version)
ImGuiOpenGLBackend.init(opengl_ctx)

try
    show_demo_window = true
    clear_color = Cfloat[0.45, 0.55, 0.60, 1.00]

    while glfwWindowShouldClose(window) == 0
        glfwPollEvents()

        # start the Dear ImGui frame
        ImGuiOpenGLBackend.new_frame(opengl_ctx)
        ImGuiGLFWBackend.new_frame(glfw_ctx)
        CImGui.NewFrame()

        # show the big demo window
        show_demo_window && @c ImPlot.ShowDemoWindow(&show_demo_window)
        
        # show a simple window that we create ourselves.
        # we use a Begin/End pair to created a named window.
        @cstatic f=Cfloat(0.0) counter=Cint(0) begin
            if CImGui.Begin("Hello, world!")
                framerate = unsafe_load(CImGui.GetIO()).Framerate

                @c CImGui.Checkbox("Show ImPlot Demo", &show_demo_window)
                CImGui.Text(@sprintf("Application average %.3f ms/frame (%.1f FPS)",
                                     1000 / framerate, framerate))

                CImGui.End()
            end
        end

        # rendering
        CImGui.Render()
        glfwMakeContextCurrent(window)

        width, height = Ref{Cint}(), Ref{Cint}()
        glfwGetFramebufferSize(window, width, height)
        display_w = width[]
        display_h = height[]

        glViewport(0, 0, display_w, display_h)
        glClearColor(clear_color...)
        glClear(GL_COLOR_BUFFER_BIT)
        ImGuiOpenGLBackend.render(opengl_ctx)

        glfwMakeContextCurrent(window)
        glfwSwapBuffers(window)
        yield()
    end
catch e
    @error "Error in renderloop!" exception=e
    Base.show_backtrace(stderr, catch_backtrace())
finally
    ImGuiOpenGLBackend.shutdown(opengl_ctx)
    ImGuiGLFWBackend.shutdown(glfw_ctx)
    ImPlot.DestroyContext(pctx)
    CImGui.DestroyContext(ctx)
    glfwDestroyWindow(window)
end
