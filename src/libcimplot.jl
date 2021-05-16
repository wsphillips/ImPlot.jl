module LibCImPlot

using CEnum

using CImPlot_jll

using CImGui

# import CImGui:
#     # Vector primitives:
#     ImVec2, ImVec4,
#     # Enums
#     ImGuiMouseButton, ImGuiKeyModFlags, ImGuiCond, ImGuiDragDropFlags,
#     # Primitive type aliases; uncomment after CImGui update
#     #=ImS8,=# ImU8, ImS16, ImU16, ImS32, ImU32, ImS64, ImU64,
#     ImTextureID,
#     ImDrawList,
#     ImGuiContext

# #Temporary patch; CImGui.jl v1.79.0 aliases ImS8 incorrectly
# const ImS8 = Int8


struct ImGuiPtrOrIndex
    Ptr::Ptr{Cvoid}
    Index::Cint
end

struct ImGuiShrinkWidthItem
    Index::Cint
    Width::Cfloat
end

struct ImVec2ih
    x::Cshort
    y::Cshort
end

struct ImVec1
    x::Cfloat
end

struct StbUndoRecord
    where::Cint
    insert_length::Cint
    delete_length::Cint
    char_storage::Cint
end

const ImWchar16 = Cushort

const ImWchar = ImWchar16

struct StbUndoState
    undo_rec::NTuple{99, StbUndoRecord}
    undo_char::NTuple{999, ImWchar}
    undo_point::Cshort
    redo_point::Cshort
    undo_char_point::Cint
    redo_char_point::Cint
end

struct STB_TexteditState
    cursor::Cint
    select_start::Cint
    select_end::Cint
    insert_mode::Cuchar
    row_count_per_page::Cint
    cursor_at_end_of_line::Cuchar
    initialized::Cuchar
    has_preferred_x::Cuchar
    single_line::Cuchar
    padding1::Cuchar
    padding2::Cuchar
    padding3::Cuchar
    preferred_x::Cfloat
    undostate::StbUndoState
end

const ImGuiID = Cuint

struct ImGuiWindowSettings
    ID::ImGuiID
    Pos::ImVec2ih
    Size::ImVec2ih
    Collapsed::Bool
    WantApply::Bool
end

struct ImVec2
    x::Cfloat
    y::Cfloat
end

const ImGuiItemStatusFlags = Cint

struct ImRect
    Min::ImVec2
    Max::ImVec2
end

@cenum ImGuiNavLayer::UInt32 begin
    ImGuiNavLayer_Main = 0
    ImGuiNavLayer_Menu = 1
    ImGuiNavLayer_COUNT = 2
end

struct ImGuiMenuColumns
    Spacing::Cfloat
    Width::Cfloat
    NextWidth::Cfloat
    Pos::NTuple{3, Cfloat}
    NextWidths::NTuple{3, Cfloat}
end

const ImU32 = Cuint

struct ImVector_ImGuiWindowPtr
    Size::Cint
    Capacity::Cint
    # Data::Ptr{Ptr{ImGuiWindow}}
    Data::Ptr{Ptr{Cvoid}}
end

function Base.getproperty(x::ImVector_ImGuiWindowPtr, f::Symbol)
    f === :Data && return Ptr{Ptr{ImGuiWindow}}(getfield(x, f))
    return getfield(x, f)
end

struct ImGuiStoragePair
    data::NTuple{16, UInt8}
end

function Base.getproperty(x::Ptr{ImGuiStoragePair}, f::Symbol)
    f === :key && return Ptr{ImGuiID}(x + 0)
    f === :val_i && return Ptr{Cint}(x + 8)
    f === :val_f && return Ptr{Cfloat}(x + 8)
    f === :val_p && return Ptr{Ptr{Cvoid}}(x + 8)
    return getfield(x, f)
end

function Base.getproperty(x::ImGuiStoragePair, f::Symbol)
    r = Ref{ImGuiStoragePair}(x)
    ptr = Base.unsafe_convert(Ptr{ImGuiStoragePair}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ImGuiStoragePair}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct ImVector_ImGuiStoragePair
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiStoragePair}
end

struct ImGuiStorage
    Data::ImVector_ImGuiStoragePair
end

const ImGuiColumnsFlags = Cint

struct ImGuiColumnData
    OffsetNorm::Cfloat
    OffsetNormBeforeResize::Cfloat
    Flags::ImGuiColumnsFlags
    ClipRect::ImRect
end

struct ImVector_ImGuiColumnData
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiColumnData}
end

struct ImVec4
    x::Cfloat
    y::Cfloat
    z::Cfloat
    w::Cfloat
end

const ImTextureID = Ptr{Cvoid}

# typedef void ( * ImDrawCallback ) ( const ImDrawList * parent_list , const ImDrawCmd * cmd )
const ImDrawCallback = Ptr{Cvoid}

struct ImDrawCmd
    ClipRect::ImVec4
    TextureId::ImTextureID
    VtxOffset::Cuint
    IdxOffset::Cuint
    ElemCount::Cuint
    UserCallback::ImDrawCallback
    UserCallbackData::Ptr{Cvoid}
end

struct ImVector_ImDrawCmd
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImDrawCmd}
end

const ImDrawIdx = Cushort

struct ImVector_ImDrawIdx
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImDrawIdx}
end

struct ImDrawChannel
    _CmdBuffer::ImVector_ImDrawCmd
    _IdxBuffer::ImVector_ImDrawIdx
end

struct ImVector_ImDrawChannel
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImDrawChannel}
end

struct ImDrawListSplitter
    _Current::Cint
    _Count::Cint
    _Channels::ImVector_ImDrawChannel
end

struct ImGuiColumns
    ID::ImGuiID
    Flags::ImGuiColumnsFlags
    IsFirstFrame::Bool
    IsBeingResized::Bool
    Current::Cint
    Count::Cint
    OffMinX::Cfloat
    OffMaxX::Cfloat
    LineMinY::Cfloat
    LineMaxY::Cfloat
    HostCursorPosY::Cfloat
    HostCursorMaxPosX::Cfloat
    HostInitialClipRect::ImRect
    HostBackupClipRect::ImRect
    HostBackupParentWorkRect::ImRect
    Columns::ImVector_ImGuiColumnData
    Splitter::ImDrawListSplitter
end

const ImGuiLayoutType = Cint

const ImGuiItemFlags = Cint

struct ImVector_ImGuiItemFlags
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiItemFlags}
end

struct ImVector_float
    Size::Cint
    Capacity::Cint
    Data::Ptr{Cfloat}
end

struct ImGuiGroupData
    BackupCursorPos::ImVec2
    BackupCursorMaxPos::ImVec2
    BackupIndent::ImVec1
    BackupGroupOffset::ImVec1
    BackupCurrLineSize::ImVec2
    BackupCurrLineTextBaseOffset::Cfloat
    BackupActiveIdIsAlive::ImGuiID
    BackupActiveIdPreviousFrameIsAlive::Bool
    EmitItem::Bool
end

struct ImVector_ImGuiGroupData
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiGroupData}
end

struct ImGuiWindowTempData
    CursorPos::ImVec2
    CursorPosPrevLine::ImVec2
    CursorStartPos::ImVec2
    CursorMaxPos::ImVec2
    CurrLineSize::ImVec2
    PrevLineSize::ImVec2
    CurrLineTextBaseOffset::Cfloat
    PrevLineTextBaseOffset::Cfloat
    Indent::ImVec1
    ColumnsOffset::ImVec1
    GroupOffset::ImVec1
    LastItemId::ImGuiID
    LastItemStatusFlags::ImGuiItemStatusFlags
    LastItemRect::ImRect
    LastItemDisplayRect::ImRect
    NavLayerCurrent::ImGuiNavLayer
    NavLayerActiveMask::Cint
    NavLayerActiveMaskNext::Cint
    NavFocusScopeIdCurrent::ImGuiID
    NavHideHighlightOneFrame::Bool
    NavHasScroll::Bool
    MenuBarAppending::Bool
    MenuBarOffset::ImVec2
    MenuColumns::ImGuiMenuColumns
    TreeDepth::Cint
    TreeJumpToParentOnPopMask::ImU32
    ChildWindows::ImVector_ImGuiWindowPtr
    StateStorage::Ptr{ImGuiStorage}
    CurrentColumns::Ptr{ImGuiColumns}
    LayoutType::ImGuiLayoutType
    ParentLayoutType::ImGuiLayoutType
    FocusCounterRegular::Cint
    FocusCounterTabStop::Cint
    ItemFlags::ImGuiItemFlags
    ItemWidth::Cfloat
    TextWrapPos::Cfloat
    ItemFlagsStack::ImVector_ImGuiItemFlags
    ItemWidthStack::ImVector_float
    TextWrapPosStack::ImVector_float
    GroupStack::ImVector_ImGuiGroupData
    StackSizesBackup::NTuple{6, Cshort}
end

const ImGuiWindowFlags = Cint

const ImS8 = Int8

const ImGuiDir = Cint

const ImGuiCond = Cint

struct ImVector_ImGuiID
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiID}
end

struct ImVector_ImGuiColumns
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiColumns}
end

struct ImDrawVert
    pos::ImVec2
    uv::ImVec2
    col::ImU32
end

struct ImVector_ImDrawVert
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImDrawVert}
end

const ImDrawListFlags = Cint

struct ImVector_ImVec4
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImVec4}
end

struct ImVector_ImTextureID
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImTextureID}
end

struct ImVector_ImVec2
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImVec2}
end

struct ImDrawList
    CmdBuffer::ImVector_ImDrawCmd
    IdxBuffer::ImVector_ImDrawIdx
    VtxBuffer::ImVector_ImDrawVert
    Flags::ImDrawListFlags
    # _Data::Ptr{ImDrawListSharedData}
    _Data::Ptr{Cvoid}
    _OwnerName::Ptr{Cchar}
    _VtxCurrentIdx::Cuint
    _VtxWritePtr::Ptr{ImDrawVert}
    _IdxWritePtr::Ptr{ImDrawIdx}
    _ClipRectStack::ImVector_ImVec4
    _TextureIdStack::ImVector_ImTextureID
    _Path::ImVector_ImVec2
    _CmdHeader::ImDrawCmd
    _Splitter::ImDrawListSplitter
end

function Base.getproperty(x::ImDrawList, f::Symbol)
    f === :_Data && return Ptr{ImDrawListSharedData}(getfield(x, f))
    return getfield(x, f)
end

struct ImGuiWindow
    Name::Ptr{Cchar}
    ID::ImGuiID
    Flags::ImGuiWindowFlags
    Pos::ImVec2
    Size::ImVec2
    SizeFull::ImVec2
    ContentSize::ImVec2
    ContentSizeExplicit::ImVec2
    WindowPadding::ImVec2
    WindowRounding::Cfloat
    WindowBorderSize::Cfloat
    NameBufLen::Cint
    MoveId::ImGuiID
    ChildId::ImGuiID
    Scroll::ImVec2
    ScrollMax::ImVec2
    ScrollTarget::ImVec2
    ScrollTargetCenterRatio::ImVec2
    ScrollTargetEdgeSnapDist::ImVec2
    ScrollbarSizes::ImVec2
    ScrollbarX::Bool
    ScrollbarY::Bool
    Active::Bool
    WasActive::Bool
    WriteAccessed::Bool
    Collapsed::Bool
    WantCollapseToggle::Bool
    SkipItems::Bool
    Appearing::Bool
    Hidden::Bool
    IsFallbackWindow::Bool
    HasCloseButton::Bool
    ResizeBorderHeld::Int8
    BeginCount::Cshort
    BeginOrderWithinParent::Cshort
    BeginOrderWithinContext::Cshort
    PopupId::ImGuiID
    AutoFitFramesX::ImS8
    AutoFitFramesY::ImS8
    AutoFitChildAxises::ImS8
    AutoFitOnlyGrows::Bool
    AutoPosLastDirection::ImGuiDir
    HiddenFramesCanSkipItems::Cint
    HiddenFramesCannotSkipItems::Cint
    SetWindowPosAllowFlags::ImGuiCond
    SetWindowSizeAllowFlags::ImGuiCond
    SetWindowCollapsedAllowFlags::ImGuiCond
    SetWindowPosVal::ImVec2
    SetWindowPosPivot::ImVec2
    IDStack::ImVector_ImGuiID
    DC::ImGuiWindowTempData
    OuterRectClipped::ImRect
    InnerRect::ImRect
    InnerClipRect::ImRect
    WorkRect::ImRect
    ParentWorkRect::ImRect
    ClipRect::ImRect
    ContentRegionRect::ImRect
    HitTestHoleSize::ImVec2ih
    HitTestHoleOffset::ImVec2ih
    LastFrameActive::Cint
    LastTimeActive::Cfloat
    ItemWidthDefault::Cfloat
    StateStorage::ImGuiStorage
    ColumnsStorage::ImVector_ImGuiColumns
    FontWindowScale::Cfloat
    SettingsOffset::Cint
    DrawList::Ptr{ImDrawList}
    DrawListInst::ImDrawList
    ParentWindow::Ptr{ImGuiWindow}
    RootWindow::Ptr{ImGuiWindow}
    RootWindowForTitleBarHighlight::Ptr{ImGuiWindow}
    RootWindowForNav::Ptr{ImGuiWindow}
    NavLastChildNavWindow::Ptr{ImGuiWindow}
    NavLastIds::NTuple{2, ImGuiID}
    NavRectRel::NTuple{2, ImRect}
    MemoryCompacted::Bool
    MemoryDrawListIdxCapacity::Cint
    MemoryDrawListVtxCapacity::Cint
end

const ImGuiTabItemFlags = Cint

const ImS16 = Cshort

struct ImGuiTabItem
    ID::ImGuiID
    Flags::ImGuiTabItemFlags
    LastFrameVisible::Cint
    LastFrameSelected::Cint
    Offset::Cfloat
    Width::Cfloat
    ContentWidth::Cfloat
    NameOffset::ImS16
    BeginOrder::ImS8
    IndexDuringLayout::ImS8
    WantClose::Bool
end

struct ImVector_ImGuiTabItem
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiTabItem}
end

const ImGuiTabBarFlags = Cint

struct ImVector_char
    Size::Cint
    Capacity::Cint
    Data::Ptr{Cchar}
end

struct ImGuiTextBuffer
    Buf::ImVector_char
end

struct ImGuiTabBar
    Tabs::ImVector_ImGuiTabItem
    ID::ImGuiID
    SelectedTabId::ImGuiID
    NextSelectedTabId::ImGuiID
    VisibleTabId::ImGuiID
    CurrFrameVisible::Cint
    PrevFrameVisible::Cint
    BarRect::ImRect
    LastTabContentHeight::Cfloat
    WidthAllTabs::Cfloat
    WidthAllTabsIdeal::Cfloat
    ScrollingAnim::Cfloat
    ScrollingTarget::Cfloat
    ScrollingTargetDistToVisibility::Cfloat
    ScrollingSpeed::Cfloat
    ScrollingRectMinX::Cfloat
    ScrollingRectMaxX::Cfloat
    Flags::ImGuiTabBarFlags
    ReorderRequestTabId::ImGuiID
    ReorderRequestDir::ImS8
    TabsActiveCount::ImS8
    WantLayout::Bool
    VisibleTabWasSubmitted::Bool
    TabsAddedNew::Bool
    LastTabItemIdx::Cshort
    FramePadding::ImVec2
    TabsNames::ImGuiTextBuffer
end

const ImGuiStyleVar = Cint

struct ImGuiStyleMod
    data::NTuple{12, UInt8}
end

function Base.getproperty(x::Ptr{ImGuiStyleMod}, f::Symbol)
    f === :VarIdx && return Ptr{ImGuiStyleVar}(x + 0)
    f === :BackupInt && return Ptr{NTuple{2, Cint}}(x + 4)
    f === :BackupFloat && return Ptr{NTuple{2, Cfloat}}(x + 4)
    return getfield(x, f)
end

function Base.getproperty(x::ImGuiStyleMod, f::Symbol)
    r = Ref{ImGuiStyleMod}(x)
    ptr = Base.unsafe_convert(Ptr{ImGuiStyleMod}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{ImGuiStyleMod}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct ImGuiSettingsHandler
    TypeName::Ptr{Cchar}
    TypeHash::ImGuiID
    ClearAllFn::Ptr{Cvoid}
    ReadInitFn::Ptr{Cvoid}
    ReadOpenFn::Ptr{Cvoid}
    ReadLineFn::Ptr{Cvoid}
    ApplyAllFn::Ptr{Cvoid}
    WriteAllFn::Ptr{Cvoid}
    UserData::Ptr{Cvoid}
end

struct ImGuiPopupData
    PopupId::ImGuiID
    Window::Ptr{ImGuiWindow}
    SourceWindow::Ptr{ImGuiWindow}
    OpenFrameCount::Cint
    OpenParentId::ImGuiID
    OpenPopupPos::ImVec2
    OpenMousePos::ImVec2
end

const ImGuiNextItemDataFlags = Cint

struct ImGuiNextItemData
    Flags::ImGuiNextItemDataFlags
    Width::Cfloat
    FocusScopeId::ImGuiID
    OpenCond::ImGuiCond
    OpenVal::Bool
end

const ImGuiNextWindowDataFlags = Cint

# typedef void ( * ImGuiSizeCallback ) ( ImGuiSizeCallbackData * data )
const ImGuiSizeCallback = Ptr{Cvoid}

struct ImGuiNextWindowData
    Flags::ImGuiNextWindowDataFlags
    PosCond::ImGuiCond
    SizeCond::ImGuiCond
    CollapsedCond::ImGuiCond
    PosVal::ImVec2
    PosPivotVal::ImVec2
    SizeVal::ImVec2
    ContentSizeVal::ImVec2
    ScrollVal::ImVec2
    CollapsedVal::Bool
    SizeConstraintRect::ImRect
    SizeCallback::ImGuiSizeCallback
    SizeCallbackUserData::Ptr{Cvoid}
    BgAlphaVal::Cfloat
    MenuBarOffsetMinVal::ImVec2
end

struct ImGuiNavMoveResult
    Window::Ptr{ImGuiWindow}
    ID::ImGuiID
    FocusScopeId::ImGuiID
    DistBox::Cfloat
    DistCenter::Cfloat
    DistAxial::Cfloat
    RectRel::ImRect
end

struct ImVector_ImWchar
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImWchar}
end

const ImGuiInputTextFlags = Cint

# typedef int ( * ImGuiInputTextCallback ) ( ImGuiInputTextCallbackData * data )
const ImGuiInputTextCallback = Ptr{Cvoid}

struct ImGuiInputTextState
    ID::ImGuiID
    CurLenW::Cint
    CurLenA::Cint
    TextW::ImVector_ImWchar
    TextA::ImVector_char
    InitialTextA::ImVector_char
    TextAIsValid::Bool
    BufCapacityA::Cint
    ScrollX::Cfloat
    Stb::STB_TexteditState
    CursorAnim::Cfloat
    CursorFollow::Bool
    SelectedAllMouseLock::Bool
    Edited::Bool
    UserFlags::ImGuiInputTextFlags
    UserCallback::ImGuiInputTextCallback
    UserCallbackData::Ptr{Cvoid}
end

const ImGuiCol = Cint

struct ImGuiColorMod
    Col::ImGuiCol
    BackupValue::ImVec4
end

struct ImVector_ImDrawListPtr
    Size::Cint
    Capacity::Cint
    Data::Ptr{Ptr{ImDrawList}}
end

struct ImDrawDataBuilder
    Layers::NTuple{2, ImVector_ImDrawListPtr}
end

struct ImFontAtlasCustomRect
    Width::Cushort
    Height::Cushort
    X::Cushort
    Y::Cushort
    GlyphID::Cuint
    GlyphAdvanceX::Cfloat
    GlyphOffset::ImVec2
    # Font::Ptr{ImFont}
    Font::Ptr{Cvoid}
end

function Base.getproperty(x::ImFontAtlasCustomRect, f::Symbol)
    f === :Font && return Ptr{ImFont}(getfield(x, f))
    return getfield(x, f)
end

struct ImGuiStyle
    Alpha::Cfloat
    WindowPadding::ImVec2
    WindowRounding::Cfloat
    WindowBorderSize::Cfloat
    WindowMinSize::ImVec2
    WindowTitleAlign::ImVec2
    WindowMenuButtonPosition::ImGuiDir
    ChildRounding::Cfloat
    ChildBorderSize::Cfloat
    PopupRounding::Cfloat
    PopupBorderSize::Cfloat
    FramePadding::ImVec2
    FrameRounding::Cfloat
    FrameBorderSize::Cfloat
    ItemSpacing::ImVec2
    ItemInnerSpacing::ImVec2
    TouchExtraPadding::ImVec2
    IndentSpacing::Cfloat
    ColumnsMinSpacing::Cfloat
    ScrollbarSize::Cfloat
    ScrollbarRounding::Cfloat
    GrabMinSize::Cfloat
    GrabRounding::Cfloat
    LogSliderDeadzone::Cfloat
    TabRounding::Cfloat
    TabBorderSize::Cfloat
    TabMinWidthForCloseButton::Cfloat
    ColorButtonPosition::ImGuiDir
    ButtonTextAlign::ImVec2
    SelectableTextAlign::ImVec2
    DisplayWindowPadding::ImVec2
    DisplaySafeAreaPadding::ImVec2
    MouseCursorScale::Cfloat
    AntiAliasedLines::Bool
    AntiAliasedLinesUseTex::Bool
    AntiAliasedFill::Bool
    CurveTessellationTol::Cfloat
    CircleSegmentMaxError::Cfloat
    Colors::NTuple{48, ImVec4}
end

struct ImGuiPayload
    Data::Ptr{Cvoid}
    DataSize::Cint
    SourceId::ImGuiID
    SourceParentId::ImGuiID
    DataFrameCount::Cint
    DataType::NTuple{33, Cchar}
    Preview::Bool
    Delivery::Bool
end

const ImGuiConfigFlags = Cint

const ImGuiBackendFlags = Cint

const ImFontAtlasFlags = Cint

struct ImVector_ImFontPtr
    Size::Cint
    Capacity::Cint
    # Data::Ptr{Ptr{ImFont}}
    Data::Ptr{Ptr{Cvoid}}
end

function Base.getproperty(x::ImVector_ImFontPtr, f::Symbol)
    f === :Data && return Ptr{Ptr{ImFont}}(getfield(x, f))
    return getfield(x, f)
end

struct ImVector_ImFontAtlasCustomRect
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImFontAtlasCustomRect}
end

struct ImFontConfig
    FontData::Ptr{Cvoid}
    FontDataSize::Cint
    FontDataOwnedByAtlas::Bool
    FontNo::Cint
    SizePixels::Cfloat
    OversampleH::Cint
    OversampleV::Cint
    PixelSnapH::Bool
    GlyphExtraSpacing::ImVec2
    GlyphOffset::ImVec2
    GlyphRanges::Ptr{ImWchar}
    GlyphMinAdvanceX::Cfloat
    GlyphMaxAdvanceX::Cfloat
    MergeMode::Bool
    RasterizerFlags::Cuint
    RasterizerMultiply::Cfloat
    EllipsisChar::ImWchar
    Name::NTuple{40, Cchar}
    # DstFont::Ptr{ImFont}
    DstFont::Ptr{Cvoid}
end

function Base.getproperty(x::ImFontConfig, f::Symbol)
    f === :DstFont && return Ptr{ImFont}(getfield(x, f))
    return getfield(x, f)
end

struct ImVector_ImFontConfig
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImFontConfig}
end

struct ImFontAtlas
    Locked::Bool
    Flags::ImFontAtlasFlags
    TexID::ImTextureID
    TexDesiredWidth::Cint
    TexGlyphPadding::Cint
    TexPixelsAlpha8::Ptr{Cuchar}
    TexPixelsRGBA32::Ptr{Cuint}
    TexWidth::Cint
    TexHeight::Cint
    TexUvScale::ImVec2
    TexUvWhitePixel::ImVec2
    Fonts::ImVector_ImFontPtr
    CustomRects::ImVector_ImFontAtlasCustomRect
    ConfigData::ImVector_ImFontConfig
    TexUvLines::NTuple{64, ImVec4}
    PackIdMouseCursors::Cint
    PackIdLines::Cint
end

struct ImFontGlyph
    data::NTuple{40, UInt8}
end

function Base.getproperty(x::Ptr{ImFontGlyph}, f::Symbol)
    f === :Codepoint && return Ptr{Cuint}(x + 0)
    f === :Visible && return (Ptr{Cuint}(x + 3), 7, 1)
    f === :AdvanceX && return Ptr{Cfloat}(x + 4)
    f === :X0 && return Ptr{Cfloat}(x + 8)
    f === :Y0 && return Ptr{Cfloat}(x + 12)
    f === :X1 && return Ptr{Cfloat}(x + 16)
    f === :Y1 && return Ptr{Cfloat}(x + 20)
    f === :U0 && return Ptr{Cfloat}(x + 24)
    f === :V0 && return Ptr{Cfloat}(x + 28)
    f === :U1 && return Ptr{Cfloat}(x + 32)
    f === :V1 && return Ptr{Cfloat}(x + 36)
    return getfield(x, f)
end

function Base.getproperty(x::ImFontGlyph, f::Symbol)
    r = Ref{ImFontGlyph}(x)
    ptr = Base.unsafe_convert(Ptr{ImFontGlyph}, r)
    fptr = getproperty(ptr, f)
    begin
        if fptr isa Ptr
            return GC.@preserve(r, unsafe_load(fptr))
        else
            (baseptr, offset, width) = fptr
            ty = eltype(baseptr)
            i8 = GC.@preserve(r, unsafe_load(baseptr))
            bitstr = bitstring(i8)
            sig = bitstr[(end - offset) - (width - 1):end - offset]
            zexted = lpad(sig, 8 * sizeof(ty), '0')
            return parse(ty, zexted; base = 2)
        end
    end
end

function Base.setproperty!(x::Ptr{ImFontGlyph}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

struct ImVector_ImFontGlyph
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImFontGlyph}
end

const ImU8 = Cuchar

struct ImFont
    IndexAdvanceX::ImVector_float
    FallbackAdvanceX::Cfloat
    FontSize::Cfloat
    IndexLookup::ImVector_ImWchar
    Glyphs::ImVector_ImFontGlyph
    FallbackGlyph::Ptr{ImFontGlyph}
    ContainerAtlas::Ptr{ImFontAtlas}
    ConfigData::Ptr{ImFontConfig}
    ConfigDataCount::Cshort
    FallbackChar::ImWchar
    EllipsisChar::ImWchar
    DirtyLookupTables::Bool
    Scale::Cfloat
    Ascent::Cfloat
    Descent::Cfloat
    MetricsTotalSurface::Cint
    Used4kPagesMap::NTuple{2, ImU8}
end

const ImGuiKeyModFlags = Cint

struct ImGuiIO
    ConfigFlags::ImGuiConfigFlags
    BackendFlags::ImGuiBackendFlags
    DisplaySize::ImVec2
    DeltaTime::Cfloat
    IniSavingRate::Cfloat
    IniFilename::Ptr{Cchar}
    LogFilename::Ptr{Cchar}
    MouseDoubleClickTime::Cfloat
    MouseDoubleClickMaxDist::Cfloat
    MouseDragThreshold::Cfloat
    KeyMap::NTuple{22, Cint}
    KeyRepeatDelay::Cfloat
    KeyRepeatRate::Cfloat
    UserData::Ptr{Cvoid}
    Fonts::Ptr{ImFontAtlas}
    FontGlobalScale::Cfloat
    FontAllowUserScaling::Bool
    FontDefault::Ptr{ImFont}
    DisplayFramebufferScale::ImVec2
    MouseDrawCursor::Bool
    ConfigMacOSXBehaviors::Bool
    ConfigInputTextCursorBlink::Bool
    ConfigWindowsResizeFromEdges::Bool
    ConfigWindowsMoveFromTitleBarOnly::Bool
    ConfigWindowsMemoryCompactTimer::Cfloat
    BackendPlatformName::Ptr{Cchar}
    BackendRendererName::Ptr{Cchar}
    BackendPlatformUserData::Ptr{Cvoid}
    BackendRendererUserData::Ptr{Cvoid}
    BackendLanguageUserData::Ptr{Cvoid}
    GetClipboardTextFn::Ptr{Cvoid}
    SetClipboardTextFn::Ptr{Cvoid}
    ClipboardUserData::Ptr{Cvoid}
    ImeSetInputScreenPosFn::Ptr{Cvoid}
    ImeWindowHandle::Ptr{Cvoid}
    RenderDrawListsFnUnused::Ptr{Cvoid}
    MousePos::ImVec2
    MouseDown::NTuple{5, Bool}
    MouseWheel::Cfloat
    MouseWheelH::Cfloat
    KeyCtrl::Bool
    KeyShift::Bool
    KeyAlt::Bool
    KeySuper::Bool
    KeysDown::NTuple{512, Bool}
    NavInputs::NTuple{21, Cfloat}
    WantCaptureMouse::Bool
    WantCaptureKeyboard::Bool
    WantTextInput::Bool
    WantSetMousePos::Bool
    WantSaveIniSettings::Bool
    NavActive::Bool
    NavVisible::Bool
    Framerate::Cfloat
    MetricsRenderVertices::Cint
    MetricsRenderIndices::Cint
    MetricsRenderWindows::Cint
    MetricsActiveWindows::Cint
    MetricsActiveAllocations::Cint
    MouseDelta::ImVec2
    KeyMods::ImGuiKeyModFlags
    MousePosPrev::ImVec2
    MouseClickedPos::NTuple{5, ImVec2}
    MouseClickedTime::NTuple{5, Cdouble}
    MouseClicked::NTuple{5, Bool}
    MouseDoubleClicked::NTuple{5, Bool}
    MouseReleased::NTuple{5, Bool}
    MouseDownOwned::NTuple{5, Bool}
    MouseDownWasDoubleClick::NTuple{5, Bool}
    MouseDownDuration::NTuple{5, Cfloat}
    MouseDownDurationPrev::NTuple{5, Cfloat}
    MouseDragMaxDistanceAbs::NTuple{5, ImVec2}
    MouseDragMaxDistanceSqr::NTuple{5, Cfloat}
    KeysDownDuration::NTuple{512, Cfloat}
    KeysDownDurationPrev::NTuple{512, Cfloat}
    NavInputsDownDuration::NTuple{21, Cfloat}
    NavInputsDownDurationPrev::NTuple{21, Cfloat}
    PenPressure::Cfloat
    InputQueueSurrogate::ImWchar16
    InputQueueCharacters::ImVector_ImWchar
end

struct ImDrawListSharedData
    TexUvWhitePixel::ImVec2
    Font::Ptr{ImFont}
    FontSize::Cfloat
    CurveTessellationTol::Cfloat
    CircleSegmentMaxError::Cfloat
    ClipRectFullscreen::ImVec4
    InitialFlags::ImDrawListFlags
    ArcFastVtx::NTuple{12, ImVec2}
    CircleSegmentCounts::NTuple{64, ImU8}
    TexUvLines::Ptr{ImVec4}
end

const ImU64 = UInt64

@cenum ImGuiInputSource::UInt32 begin
    ImGuiInputSource_None = 0
    ImGuiInputSource_Mouse = 1
    ImGuiInputSource_Nav = 2
    ImGuiInputSource_NavKeyboard = 3
    ImGuiInputSource_NavGamepad = 4
    ImGuiInputSource_COUNT = 5
end

struct ImVector_ImGuiColorMod
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiColorMod}
end

struct ImVector_ImGuiStyleMod
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiStyleMod}
end

struct ImVector_ImGuiPopupData
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiPopupData}
end

const ImGuiNavMoveFlags = Cint

@cenum ImGuiNavForward::UInt32 begin
    ImGuiNavForward_None = 0
    ImGuiNavForward_ForwardQueued = 1
    ImGuiNavForward_ForwardActive = 2
end

struct ImDrawData
    Valid::Bool
    CmdLists::Ptr{Ptr{ImDrawList}}
    CmdListsCount::Cint
    TotalIdxCount::Cint
    TotalVtxCount::Cint
    DisplayPos::ImVec2
    DisplaySize::ImVec2
    FramebufferScale::ImVec2
end

const ImGuiMouseCursor = Cint

const ImGuiDragDropFlags = Cint

struct ImVector_unsigned_char
    Size::Cint
    Capacity::Cint
    Data::Ptr{Cuchar}
end

struct ImVector_ImGuiTabBar
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiTabBar}
end

const ImPoolIdx = Cint

struct ImPool_ImGuiTabBar
    Buf::ImVector_ImGuiTabBar
    Map::ImGuiStorage
    FreeIdx::ImPoolIdx
end

struct ImVector_ImGuiPtrOrIndex
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiPtrOrIndex}
end

struct ImVector_ImGuiShrinkWidthItem
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiShrinkWidthItem}
end

const ImGuiColorEditFlags = Cint

struct ImVector_ImGuiSettingsHandler
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiSettingsHandler}
end

struct ImVector_ImGuiWindowSettings
    Size::Cint
    Capacity::Cint
    Data::Ptr{ImGuiWindowSettings}
end

struct ImChunkStream_ImGuiWindowSettings
    Buf::ImVector_ImGuiWindowSettings
end

@cenum ImGuiLogType::UInt32 begin
    ImGuiLogType_None = 0
    ImGuiLogType_TTY = 1
    ImGuiLogType_File = 2
    ImGuiLogType_Buffer = 3
    ImGuiLogType_Clipboard = 4
end

const ImFileHandle = Ptr{Libc.FILE}

mutable struct ImGuiContext
    Initialized::Bool
    FontAtlasOwnedByContext::Bool
    IO::ImGuiIO
    Style::ImGuiStyle
    Font::Ptr{ImFont}
    FontSize::Cfloat
    FontBaseSize::Cfloat
    DrawListSharedData::ImDrawListSharedData
    Time::Cdouble
    FrameCount::Cint
    FrameCountEnded::Cint
    FrameCountRendered::Cint
    WithinFrameScope::Bool
    WithinFrameScopeWithImplicitWindow::Bool
    WithinEndChild::Bool
    TestEngineHookItems::Bool
    TestEngineHookIdInfo::ImGuiID
    TestEngine::Ptr{Cvoid}
    Windows::ImVector_ImGuiWindowPtr
    WindowsFocusOrder::ImVector_ImGuiWindowPtr
    WindowsTempSortBuffer::ImVector_ImGuiWindowPtr
    CurrentWindowStack::ImVector_ImGuiWindowPtr
    WindowsById::ImGuiStorage
    WindowsActiveCount::Cint
    CurrentWindow::Ptr{ImGuiWindow}
    HoveredWindow::Ptr{ImGuiWindow}
    HoveredRootWindow::Ptr{ImGuiWindow}
    HoveredWindowUnderMovingWindow::Ptr{ImGuiWindow}
    MovingWindow::Ptr{ImGuiWindow}
    WheelingWindow::Ptr{ImGuiWindow}
    WheelingWindowRefMousePos::ImVec2
    WheelingWindowTimer::Cfloat
    HoveredId::ImGuiID
    HoveredIdPreviousFrame::ImGuiID
    HoveredIdAllowOverlap::Bool
    HoveredIdDisabled::Bool
    HoveredIdTimer::Cfloat
    HoveredIdNotActiveTimer::Cfloat
    ActiveId::ImGuiID
    ActiveIdIsAlive::ImGuiID
    ActiveIdTimer::Cfloat
    ActiveIdIsJustActivated::Bool
    ActiveIdAllowOverlap::Bool
    ActiveIdNoClearOnFocusLoss::Bool
    ActiveIdHasBeenPressedBefore::Bool
    ActiveIdHasBeenEditedBefore::Bool
    ActiveIdHasBeenEditedThisFrame::Bool
    ActiveIdUsingNavDirMask::ImU32
    ActiveIdUsingNavInputMask::ImU32
    ActiveIdUsingKeyInputMask::ImU64
    ActiveIdClickOffset::ImVec2
    ActiveIdWindow::Ptr{ImGuiWindow}
    ActiveIdSource::ImGuiInputSource
    ActiveIdMouseButton::Cint
    ActiveIdPreviousFrame::ImGuiID
    ActiveIdPreviousFrameIsAlive::Bool
    ActiveIdPreviousFrameHasBeenEditedBefore::Bool
    ActiveIdPreviousFrameWindow::Ptr{ImGuiWindow}
    LastActiveId::ImGuiID
    LastActiveIdTimer::Cfloat
    NextWindowData::ImGuiNextWindowData
    NextItemData::ImGuiNextItemData
    ColorModifiers::ImVector_ImGuiColorMod
    StyleModifiers::ImVector_ImGuiStyleMod
    FontStack::ImVector_ImFontPtr
    OpenPopupStack::ImVector_ImGuiPopupData
    BeginPopupStack::ImVector_ImGuiPopupData
    NavWindow::Ptr{ImGuiWindow}
    NavId::ImGuiID
    NavFocusScopeId::ImGuiID
    NavActivateId::ImGuiID
    NavActivateDownId::ImGuiID
    NavActivatePressedId::ImGuiID
    NavInputId::ImGuiID
    NavJustTabbedId::ImGuiID
    NavJustMovedToId::ImGuiID
    NavJustMovedToFocusScopeId::ImGuiID
    NavJustMovedToKeyMods::ImGuiKeyModFlags
    NavNextActivateId::ImGuiID
    NavInputSource::ImGuiInputSource
    NavScoringRect::ImRect
    NavScoringCount::Cint
    NavLayer::ImGuiNavLayer
    NavIdTabCounter::Cint
    NavIdIsAlive::Bool
    NavMousePosDirty::Bool
    NavDisableHighlight::Bool
    NavDisableMouseHover::Bool
    NavAnyRequest::Bool
    NavInitRequest::Bool
    NavInitRequestFromMove::Bool
    NavInitResultId::ImGuiID
    NavInitResultRectRel::ImRect
    NavMoveRequest::Bool
    NavMoveRequestFlags::ImGuiNavMoveFlags
    NavMoveRequestForward::ImGuiNavForward
    NavMoveRequestKeyMods::ImGuiKeyModFlags
    NavMoveDir::ImGuiDir
    NavMoveDirLast::ImGuiDir
    NavMoveClipDir::ImGuiDir
    NavMoveResultLocal::ImGuiNavMoveResult
    NavMoveResultLocalVisibleSet::ImGuiNavMoveResult
    NavMoveResultOther::ImGuiNavMoveResult
    NavWrapRequestWindow::Ptr{ImGuiWindow}
    NavWrapRequestFlags::ImGuiNavMoveFlags
    NavWindowingTarget::Ptr{ImGuiWindow}
    NavWindowingTargetAnim::Ptr{ImGuiWindow}
    NavWindowingListWindow::Ptr{ImGuiWindow}
    NavWindowingTimer::Cfloat
    NavWindowingHighlightAlpha::Cfloat
    NavWindowingToggleLayer::Bool
    FocusRequestCurrWindow::Ptr{ImGuiWindow}
    FocusRequestNextWindow::Ptr{ImGuiWindow}
    FocusRequestCurrCounterRegular::Cint
    FocusRequestCurrCounterTabStop::Cint
    FocusRequestNextCounterRegular::Cint
    FocusRequestNextCounterTabStop::Cint
    FocusTabPressed::Bool
    DrawData::ImDrawData
    DrawDataBuilder::ImDrawDataBuilder
    DimBgRatio::Cfloat
    BackgroundDrawList::ImDrawList
    ForegroundDrawList::ImDrawList
    MouseCursor::ImGuiMouseCursor
    DragDropActive::Bool
    DragDropWithinSource::Bool
    DragDropWithinTarget::Bool
    DragDropSourceFlags::ImGuiDragDropFlags
    DragDropSourceFrameCount::Cint
    DragDropMouseButton::Cint
    DragDropPayload::ImGuiPayload
    DragDropTargetRect::ImRect
    DragDropTargetId::ImGuiID
    DragDropAcceptFlags::ImGuiDragDropFlags
    DragDropAcceptIdCurrRectSurface::Cfloat
    DragDropAcceptIdCurr::ImGuiID
    DragDropAcceptIdPrev::ImGuiID
    DragDropAcceptFrameCount::Cint
    DragDropHoldJustPressedId::ImGuiID
    DragDropPayloadBufHeap::ImVector_unsigned_char
    DragDropPayloadBufLocal::NTuple{16, Cuchar}
    CurrentTabBar::Ptr{ImGuiTabBar}
    TabBars::ImPool_ImGuiTabBar
    CurrentTabBarStack::ImVector_ImGuiPtrOrIndex
    ShrinkWidthBuffer::ImVector_ImGuiShrinkWidthItem
    LastValidMousePos::ImVec2
    InputTextState::ImGuiInputTextState
    InputTextPasswordFont::ImFont
    TempInputId::ImGuiID
    ColorEditOptions::ImGuiColorEditFlags
    ColorEditLastHue::Cfloat
    ColorEditLastSat::Cfloat
    ColorEditLastColor::NTuple{3, Cfloat}
    ColorPickerRef::ImVec4
    SliderCurrentAccum::Cfloat
    SliderCurrentAccumDirty::Bool
    DragCurrentAccumDirty::Bool
    DragCurrentAccum::Cfloat
    DragSpeedDefaultRatio::Cfloat
    ScrollbarClickDeltaToGrabCenter::Cfloat
    TooltipOverrideCount::Cint
    ClipboardHandlerData::ImVector_char
    MenusIdSubmittedThisFrame::ImVector_ImGuiID
    PlatformImePos::ImVec2
    PlatformImeLastPos::ImVec2
    PlatformLocaleDecimalPoint::Cchar
    SettingsLoaded::Bool
    SettingsDirtyTimer::Cfloat
    SettingsIniData::ImGuiTextBuffer
    SettingsHandlers::ImVector_ImGuiSettingsHandler
    SettingsWindows::ImChunkStream_ImGuiWindowSettings
    LogEnabled::Bool
    LogType::ImGuiLogType
    LogFile::ImFileHandle
    LogBuffer::ImGuiTextBuffer
    LogLinePosY::Cfloat
    LogLineFirstItem::Bool
    LogDepthRef::Cint
    LogDepthToExpand::Cint
    LogDepthToExpandDefault::Cint
    DebugItemPickerActive::Bool
    DebugItemPickerBreakId::ImGuiID
    FramerateSecPerFrame::NTuple{120, Cfloat}
    FramerateSecPerFrameIdx::Cint
    FramerateSecPerFrameAccum::Cfloat
    WantCaptureMouseNextFrame::Cint
    WantCaptureKeyboardNextFrame::Cint
    WantTextInputNextFrame::Cint
    TempBuffer::NTuple{3073, Cchar}
    ImGuiContext() = new()
end

const ImGuiMouseButton = Cint

const ImU16 = Cushort

const ImS32 = Cint

const ImS64 = Int64

mutable struct ImPlotInputMap
    PanButton::ImGuiMouseButton
    PanMod::ImGuiKeyModFlags
    FitButton::ImGuiMouseButton
    ContextMenuButton::ImGuiMouseButton
    BoxSelectButton::ImGuiMouseButton
    BoxSelectMod::ImGuiKeyModFlags
    BoxSelectCancelButton::ImGuiMouseButton
    QueryButton::ImGuiMouseButton
    QueryMod::ImGuiKeyModFlags
    QueryToggleMod::ImGuiKeyModFlags
    HorizontalMod::ImGuiKeyModFlags
    VerticalMod::ImGuiKeyModFlags
    ImPlotInputMap() = new()
end

mutable struct ImPlotStyle
    LineWeight::Cfloat
    Marker::Cint
    MarkerSize::Cfloat
    MarkerWeight::Cfloat
    FillAlpha::Cfloat
    ErrorBarSize::Cfloat
    ErrorBarWeight::Cfloat
    DigitalBitHeight::Cfloat
    DigitalBitGap::Cfloat
    PlotBorderSize::Cfloat
    MinorAlpha::Cfloat
    MajorTickLen::ImVec2
    MinorTickLen::ImVec2
    MajorTickSize::ImVec2
    MinorTickSize::ImVec2
    MajorGridSize::ImVec2
    MinorGridSize::ImVec2
    PlotPadding::ImVec2
    LabelPadding::ImVec2
    LegendPadding::ImVec2
    LegendInnerPadding::ImVec2
    LegendSpacing::ImVec2
    MousePosPadding::ImVec2
    AnnotationPadding::ImVec2
    FitPadding::ImVec2
    PlotDefaultSize::ImVec2
    PlotMinSize::ImVec2
    Colors::NTuple{24, ImVec4}
    AntiAliasedLines::Bool
    UseLocalTime::Bool
    UseISO8601::Bool
    Use24HourClock::Bool
    ImPlotStyle() = new()
end

struct ImPlotRange
    Min::Cdouble
    Max::Cdouble
end

mutable struct ImPlotLimits
    X::ImPlotRange
    Y::ImPlotRange
    ImPlotLimits() = new()
end

mutable struct ImPlotPoint
    x::Cdouble
    y::Cdouble
    ImPlotPoint() = new()
end

mutable struct ImPlotContext end

const ImPlotFlags = Cint

const ImPlotAxisFlags = Cint

const ImPlotCol = Cint

const ImPlotStyleVar = Cint

const ImPlotMarker = Cint

const ImPlotColormap = Cint

const ImPlotLocation = Cint

const ImPlotOrientation = Cint

const ImPlotYAxis = Cint

@cenum ImPlotFlags_::UInt32 begin
    ImPlotFlags_None = 0
    ImPlotFlags_NoTitle = 1
    ImPlotFlags_NoLegend = 2
    ImPlotFlags_NoMenus = 4
    ImPlotFlags_NoBoxSelect = 8
    ImPlotFlags_NoMousePos = 16
    ImPlotFlags_NoHighlight = 32
    ImPlotFlags_NoChild = 64
    ImPlotFlags_Equal = 128
    ImPlotFlags_YAxis2 = 256
    ImPlotFlags_YAxis3 = 512
    ImPlotFlags_Query = 1024
    ImPlotFlags_Crosshairs = 2048
    ImPlotFlags_AntiAliased = 4096
    ImPlotFlags_CanvasOnly = 31
end

@cenum ImPlotAxisFlags_::UInt32 begin
    ImPlotAxisFlags_None = 0
    ImPlotAxisFlags_NoGridLines = 1
    ImPlotAxisFlags_NoTickMarks = 2
    ImPlotAxisFlags_NoTickLabels = 4
    ImPlotAxisFlags_LogScale = 8
    ImPlotAxisFlags_Time = 16
    ImPlotAxisFlags_Invert = 32
    ImPlotAxisFlags_LockMin = 64
    ImPlotAxisFlags_LockMax = 128
    ImPlotAxisFlags_Lock = 192
    ImPlotAxisFlags_NoDecorations = 7
end

@cenum ImPlotCol_::UInt32 begin
    ImPlotCol_Line = 0
    ImPlotCol_Fill = 1
    ImPlotCol_MarkerOutline = 2
    ImPlotCol_MarkerFill = 3
    ImPlotCol_ErrorBar = 4
    ImPlotCol_FrameBg = 5
    ImPlotCol_PlotBg = 6
    ImPlotCol_PlotBorder = 7
    ImPlotCol_LegendBg = 8
    ImPlotCol_LegendBorder = 9
    ImPlotCol_LegendText = 10
    ImPlotCol_TitleText = 11
    ImPlotCol_InlayText = 12
    ImPlotCol_XAxis = 13
    ImPlotCol_XAxisGrid = 14
    ImPlotCol_YAxis = 15
    ImPlotCol_YAxisGrid = 16
    ImPlotCol_YAxis2 = 17
    ImPlotCol_YAxisGrid2 = 18
    ImPlotCol_YAxis3 = 19
    ImPlotCol_YAxisGrid3 = 20
    ImPlotCol_Selection = 21
    ImPlotCol_Query = 22
    ImPlotCol_Crosshairs = 23
    ImPlotCol_COUNT = 24
end

@cenum ImPlotStyleVar_::UInt32 begin
    ImPlotStyleVar_LineWeight = 0
    ImPlotStyleVar_Marker = 1
    ImPlotStyleVar_MarkerSize = 2
    ImPlotStyleVar_MarkerWeight = 3
    ImPlotStyleVar_FillAlpha = 4
    ImPlotStyleVar_ErrorBarSize = 5
    ImPlotStyleVar_ErrorBarWeight = 6
    ImPlotStyleVar_DigitalBitHeight = 7
    ImPlotStyleVar_DigitalBitGap = 8
    ImPlotStyleVar_PlotBorderSize = 9
    ImPlotStyleVar_MinorAlpha = 10
    ImPlotStyleVar_MajorTickLen = 11
    ImPlotStyleVar_MinorTickLen = 12
    ImPlotStyleVar_MajorTickSize = 13
    ImPlotStyleVar_MinorTickSize = 14
    ImPlotStyleVar_MajorGridSize = 15
    ImPlotStyleVar_MinorGridSize = 16
    ImPlotStyleVar_PlotPadding = 17
    ImPlotStyleVar_LabelPadding = 18
    ImPlotStyleVar_LegendPadding = 19
    ImPlotStyleVar_LegendInnerPadding = 20
    ImPlotStyleVar_LegendSpacing = 21
    ImPlotStyleVar_MousePosPadding = 22
    ImPlotStyleVar_AnnotationPadding = 23
    ImPlotStyleVar_FitPadding = 24
    ImPlotStyleVar_PlotDefaultSize = 25
    ImPlotStyleVar_PlotMinSize = 26
    ImPlotStyleVar_COUNT = 27
end

@cenum ImPlotMarker_::Int32 begin
    ImPlotMarker_None = -1
    ImPlotMarker_Circle = 0
    ImPlotMarker_Square = 1
    ImPlotMarker_Diamond = 2
    ImPlotMarker_Up = 3
    ImPlotMarker_Down = 4
    ImPlotMarker_Left = 5
    ImPlotMarker_Right = 6
    ImPlotMarker_Cross = 7
    ImPlotMarker_Plus = 8
    ImPlotMarker_Asterisk = 9
    ImPlotMarker_COUNT = 10
end

@cenum ImPlotColormap_::UInt32 begin
    ImPlotColormap_Default = 0
    ImPlotColormap_Deep = 1
    ImPlotColormap_Dark = 2
    ImPlotColormap_Pastel = 3
    ImPlotColormap_Paired = 4
    ImPlotColormap_Viridis = 5
    ImPlotColormap_Plasma = 6
    ImPlotColormap_Hot = 7
    ImPlotColormap_Cool = 8
    ImPlotColormap_Pink = 9
    ImPlotColormap_Jet = 10
    ImPlotColormap_COUNT = 11
end

@cenum ImPlotLocation_::UInt32 begin
    ImPlotLocation_Center = 0
    ImPlotLocation_North = 1
    ImPlotLocation_South = 2
    ImPlotLocation_West = 4
    ImPlotLocation_East = 8
    ImPlotLocation_NorthWest = 5
    ImPlotLocation_NorthEast = 9
    ImPlotLocation_SouthWest = 6
    ImPlotLocation_SouthEast = 10
end

@cenum ImPlotOrientation_::UInt32 begin
    ImPlotOrientation_Horizontal = 0
    ImPlotOrientation_Vertical = 1
end

@cenum ImPlotYAxis_::UInt32 begin
    ImPlotYAxis_1 = 0
    ImPlotYAxis_2 = 1
    ImPlotYAxis_3 = 2
end

function ImPlotPoint_ImPlotPointNil()
    ccall((:ImPlotPoint_ImPlotPointNil, libcimplot), Ptr{ImPlotPoint}, ())
end

function ImPlotPoint_destroy(self)
    ccall((:ImPlotPoint_destroy, libcimplot), Cvoid, (Ptr{ImPlotPoint},), self)
end

function ImPlotPoint_ImPlotPointdouble(_x, _y)
    ccall((:ImPlotPoint_ImPlotPointdouble, libcimplot), Ptr{ImPlotPoint}, (Cdouble, Cdouble), _x, _y)
end

function ImPlotPoint_ImPlotPointVec2(p)
    ccall((:ImPlotPoint_ImPlotPointVec2, libcimplot), Ptr{ImPlotPoint}, (ImVec2,), p)
end

function ImPlotRange_ImPlotRangeNil()
    ccall((:ImPlotRange_ImPlotRangeNil, libcimplot), Ptr{ImPlotRange}, ())
end

function ImPlotRange_destroy(self)
    ccall((:ImPlotRange_destroy, libcimplot), Cvoid, (Ptr{ImPlotRange},), self)
end

function ImPlotRange_ImPlotRangedouble(_min, _max)
    ccall((:ImPlotRange_ImPlotRangedouble, libcimplot), Ptr{ImPlotRange}, (Cdouble, Cdouble), _min, _max)
end

function ImPlotRange_Contains(self, value)
    ccall((:ImPlotRange_Contains, libcimplot), Bool, (Ptr{ImPlotRange}, Cdouble), self, value)
end

function ImPlotRange_Size(self)
    ccall((:ImPlotRange_Size, libcimplot), Cdouble, (Ptr{ImPlotRange},), self)
end

function ImPlotLimits_ContainsPlotPoInt(self, p)
    ccall((:ImPlotLimits_ContainsPlotPoInt, libcimplot), Bool, (Ptr{ImPlotLimits}, ImPlotPoint), self, p)
end

function ImPlotLimits_Containsdouble(self, x, y)
    ccall((:ImPlotLimits_Containsdouble, libcimplot), Bool, (Ptr{ImPlotLimits}, Cdouble, Cdouble), self, x, y)
end

function ImPlotStyle_ImPlotStyle()
    ccall((:ImPlotStyle_ImPlotStyle, libcimplot), Ptr{ImPlotStyle}, ())
end

function ImPlotStyle_destroy(self)
    ccall((:ImPlotStyle_destroy, libcimplot), Cvoid, (Ptr{ImPlotStyle},), self)
end

function ImPlotInputMap_ImPlotInputMap()
    ccall((:ImPlotInputMap_ImPlotInputMap, libcimplot), Ptr{ImPlotInputMap}, ())
end

function ImPlotInputMap_destroy(self)
    ccall((:ImPlotInputMap_destroy, libcimplot), Cvoid, (Ptr{ImPlotInputMap},), self)
end

function CreateContext()
    ccall((:ImPlot_CreateContext, libcimplot), Ptr{ImPlotContext}, ())
end

function DestroyContext(ctx)
    ccall((:ImPlot_DestroyContext, libcimplot), Cvoid, (Ptr{ImPlotContext},), ctx)
end

function GetCurrentContext()
    ccall((:ImPlot_GetCurrentContext, libcimplot), Ptr{ImPlotContext}, ())
end

function SetCurrentContext(ctx)
    ccall((:ImPlot_SetCurrentContext, libcimplot), Cvoid, (Ptr{ImPlotContext},), ctx)
end

function BeginPlot(title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags)
    ccall((:ImPlot_BeginPlot, libcimplot), Bool, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, ImVec2, ImPlotFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags, ImPlotAxisFlags), title_id, x_label, y_label, size, flags, x_flags, y_flags, y2_flags, y3_flags)
end

function EndPlot()
    ccall((:ImPlot_EndPlot, libcimplot), Cvoid, ())
end

function PlotLine(label_id, values::AbstractArray{Cfloat}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineFloatPtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{Cdouble}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLinedoublePtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImS8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImU8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImS16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImU16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImS32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImU32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImS64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, values::AbstractArray{ImU64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineFloatPtrFloatPtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLinedoublePtrdoublePtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS8PtrS8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU8PtrU8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS16PtrS16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU16PtrU16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS32PtrS32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU32PtrU32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineS64PtrS64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotLine(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotLineU64PtrU64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{Cfloat}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterFloatPtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{Cdouble}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterdoublePtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImS8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImU8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImS16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImU16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImS32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImU32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImS64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, values::AbstractArray{ImU64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterFloatPtrFloatPtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterdoublePtrdoublePtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS8PtrS8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU8PtrU8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS16PtrS16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU16PtrU16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS32PtrS32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU32PtrU32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterS64PtrS64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotScatter(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotScatterU64PtrU64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{Cfloat}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsFloatPtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{Cdouble}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsdoublePtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImS8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImU8}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImS16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImU16}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImS32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImU32}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImS64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, values::AbstractArray{ImU64}, count::Integer, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, xscale, x0, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsFloatPtrFloatPtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsdoublePtrdoublePtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS8PtrS8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU8PtrU8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS16PtrS16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU16PtrU16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS32PtrS32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU32PtrU32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsS64PtrS64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairs(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStairsU64PtrU64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotStairsG(label_id, getter, data, count::Integer, offset::Integer)
    ccall((:ImPlot_PlotStairsG, libcimplot), Cvoid, (Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function PlotShaded(label_id, values::AbstractArray{Cfloat}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedFloatPtrIntdoubledoubleInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{Cdouble}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadeddoublePtrIntdoubledoubleInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImS8}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS8PtrIntdoubledoubleInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImU8}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU8PtrIntdoubledoubleInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImS16}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS16PtrIntdoubledoubleInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImU16}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU16PtrIntdoubledoubleInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImS32}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS32PtrIntdoubledoubleInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImU32}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU32PtrIntdoubledoubleInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImS64}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS64PtrIntdoubledoubleInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, values::AbstractArray{ImU64}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU64PtrIntdoubledoubleInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedFloatPtrFloatPtrIntInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadeddoublePtrdoublePtrIntInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS8PtrS8PtrIntInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU8PtrU8PtrIntInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS16PtrS16PtrIntInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU16PtrU16PtrIntInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS32PtrS32PtrIntInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU32PtrU32PtrIntInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS64PtrS64PtrIntInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU64PtrU64PtrIntInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{Cfloat}, ys1::AbstractArray{Cfloat}, ys2::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{Cdouble}, ys1::AbstractArray{Cdouble}, ys2::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadeddoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS8}, ys1::AbstractArray{ImS8}, ys2::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU8}, ys1::AbstractArray{ImU8}, ys2::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS16}, ys1::AbstractArray{ImS16}, ys2::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU16}, ys1::AbstractArray{ImU16}, ys2::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS32}, ys1::AbstractArray{ImS32}, ys2::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU32}, ys1::AbstractArray{ImU32}, ys2::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImS64}, ys1::AbstractArray{ImS64}, ys2::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotShaded(label_id, xs::AbstractArray{ImU64}, ys1::AbstractArray{ImU64}, ys2::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotShadedU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys1, ys2, count, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{Cfloat}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsFloatPtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{Cdouble}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsdoublePtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImS8}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImU8}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImS16}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImU16}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImS32}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImU32}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImS64}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, values::AbstractArray{ImU64}, count::Integer, width::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, width, shift, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsFloatPtrFloatPtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsdoublePtrdoublePtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS8PtrS8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU8PtrU8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS16PtrS16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU16PtrU16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS32PtrS32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU32PtrU32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsS64PtrS64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBars(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, width::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsU64PtrU64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, width, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{Cfloat}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHFloatPtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{Cdouble}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHdoublePtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImS8}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImU8}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImS16}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImU16}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImS32}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImU32}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImS64}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, values::AbstractArray{ImU64}, count::Integer, height::Real, shift::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Cint, Cdouble, Cdouble, Cint, Cint), label_id, values, count, height, shift, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHFloatPtrFloatPtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHdoublePtrdoublePtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS8PtrS8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU8PtrU8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS16PtrS16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU16PtrU16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS32PtrS32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU32PtrU32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHS64PtrS64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotBarsH(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, height::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotBarsHU64PtrU64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, height, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, err::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, err::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, err::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS8PtrS8PtrS8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, err::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU8PtrU8PtrU8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, err::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS16PtrS16PtrS16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, err::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU16PtrU16PtrU16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, err::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS32PtrS32PtrS32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, err::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU32PtrU32PtrU32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, err::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS64PtrS64PtrS64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, err::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU64PtrU64PtrU64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, neg::AbstractArray{Cfloat}, pos::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, neg::AbstractArray{Cdouble}, pos::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, neg::AbstractArray{ImS8}, pos::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS8PtrS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, neg::AbstractArray{ImU8}, pos::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU8PtrU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, neg::AbstractArray{ImS16}, pos::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS16PtrS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, neg::AbstractArray{ImU16}, pos::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU16PtrU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, neg::AbstractArray{ImS32}, pos::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS32PtrS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, neg::AbstractArray{ImU32}, pos::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU32PtrU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, neg::AbstractArray{ImS64}, pos::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsS64PtrS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBars(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, neg::AbstractArray{ImU64}, pos::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsU64PtrU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, err::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, err::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, err::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS8PtrS8PtrS8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, err::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU8PtrU8PtrU8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, err::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS16PtrS16PtrS16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, err::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU16PtrU16PtrU16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, err::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS32PtrS32PtrS32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, err::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU32PtrU32PtrU32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, err::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS64PtrS64PtrS64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, err::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU64PtrU64PtrU64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, err, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, neg::AbstractArray{Cfloat}, pos::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHFloatPtrFloatPtrFloatPtrFloatPtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, neg::AbstractArray{Cdouble}, pos::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHdoublePtrdoublePtrdoublePtrdoublePtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, neg::AbstractArray{ImS8}, pos::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS8PtrS8PtrS8PtrS8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, neg::AbstractArray{ImU8}, pos::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU8PtrU8PtrU8PtrU8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, neg::AbstractArray{ImS16}, pos::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS16PtrS16PtrS16PtrS16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, neg::AbstractArray{ImU16}, pos::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU16PtrU16PtrU16PtrU16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, neg::AbstractArray{ImS32}, pos::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS32PtrS32PtrS32PtrS32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, neg::AbstractArray{ImU32}, pos::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU32PtrU32PtrU32PtrU32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, neg::AbstractArray{ImS64}, pos::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHS64PtrS64PtrS64PtrS64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotErrorBarsH(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, neg::AbstractArray{ImU64}, pos::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotErrorBarsHU64PtrU64PtrU64PtrU64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, neg, pos, count, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{Cfloat}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsFloatPtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{Cdouble}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsdoublePtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImS8}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImU8}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU8PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImS16}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImU16}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU16PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImS32}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImU32}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU32PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImS64}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, values::AbstractArray{ImU64}, count::Integer, y_ref::Real, xscale::Real, x0::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU64PtrInt, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Cint, Cint), label_id, values, count, y_ref, xscale, x0, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsFloatPtrFloatPtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsdoublePtrdoublePtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS8PtrS8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU8PtrU8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS16PtrS16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU16PtrU16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS32PtrS32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU32PtrU32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsS64PtrS64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotStems(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, y_ref::Real, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotStemsU64PtrU64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Cint, Cdouble, Cint, Cint), label_id, xs, ys, count, y_ref, offset, stride)
end

function PlotPieChart(label_ids, values::AbstractArray{Cfloat}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartFloatPtr, libcimplot), Cvoid, (Ptr{Ptr{Cchar}}, Ref{Cfloat}, Cint, Cdouble, Cdouble, Cdouble, Bool, Ptr{Cchar}, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{Cdouble}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartdoublePtr, libcimplot), Cvoid, (Ptr{Ptr{Cchar}}, Ref{Cdouble}, Cint, Cdouble, Cdouble, Cdouble, Bool, Ptr{Cchar}, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImS8}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartS8Ptr, libcimplot), Cvoid, (Ptr{Ptr{Cchar}}, Ref{ImS8}, Cint, Cdouble, Cdouble, Cdouble, Bool, Ptr{Cchar}, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImU8}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartU8Ptr, libcimplot), Cvoid, (Ptr{Ptr{Cchar}}, Ref{ImU8}, Cint, Cdouble, Cdouble, Cdouble, Bool, Ptr{Cchar}, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImS16}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartS16Ptr, libcimplot), Cvoid, (Ptr{Ptr{Cchar}}, Ref{ImS16}, Cint, Cdouble, Cdouble, Cdouble, Bool, Ptr{Cchar}, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImU16}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartU16Ptr, libcimplot), Cvoid, (Ptr{Ptr{Cchar}}, Ref{ImU16}, Cint, Cdouble, Cdouble, Cdouble, Bool, Ptr{Cchar}, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImS32}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartS32Ptr, libcimplot), Cvoid, (Ptr{Ptr{Cchar}}, Ref{ImS32}, Cint, Cdouble, Cdouble, Cdouble, Bool, Ptr{Cchar}, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImU32}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartU32Ptr, libcimplot), Cvoid, (Ptr{Ptr{Cchar}}, Ref{ImU32}, Cint, Cdouble, Cdouble, Cdouble, Bool, Ptr{Cchar}, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImS64}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartS64Ptr, libcimplot), Cvoid, (Ptr{Ptr{Cchar}}, Ref{ImS64}, Cint, Cdouble, Cdouble, Cdouble, Bool, Ptr{Cchar}, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotPieChart(label_ids, values::AbstractArray{ImU64}, count::Integer, x::Real, y::Real, radius::Real, normalize, label_fmt, angle0::Real)
    ccall((:ImPlot_PlotPieChartU64Ptr, libcimplot), Cvoid, (Ptr{Ptr{Cchar}}, Ref{ImU64}, Cint, Cdouble, Cdouble, Cdouble, Bool, Ptr{Cchar}, Cdouble), label_ids, values, count, x, y, radius, normalize, label_fmt, angle0)
end

function PlotHeatmap(label_id, values::AbstractArray{Cfloat}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapFloatPtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Cint, Cint, Cdouble, Cdouble, Ptr{Cchar}, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{Cdouble}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapdoublePtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Cint, Cint, Cdouble, Cdouble, Ptr{Cchar}, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImS8}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Cint, Cint, Cdouble, Cdouble, Ptr{Cchar}, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImU8}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Cint, Cint, Cdouble, Cdouble, Ptr{Cchar}, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImS16}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Cint, Cint, Cdouble, Cdouble, Ptr{Cchar}, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImU16}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Cint, Cint, Cdouble, Cdouble, Ptr{Cchar}, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImS32}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Cint, Cint, Cdouble, Cdouble, Ptr{Cchar}, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImU32}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Cint, Cint, Cdouble, Cdouble, Ptr{Cchar}, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImS64}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapS64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Cint, Cint, Cdouble, Cdouble, Ptr{Cchar}, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotHeatmap(label_id, values::AbstractArray{ImU64}, rows::Integer, cols::Integer, scale_min::Real, scale_max::Real, label_fmt, bounds_min, bounds_max)
    ccall((:ImPlot_PlotHeatmapU64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Cint, Cint, Cdouble, Cdouble, Ptr{Cchar}, ImPlotPoint, ImPlotPoint), label_id, values, rows, cols, scale_min, scale_max, label_fmt, bounds_min, bounds_max)
end

function PlotDigital(label_id, xs::AbstractArray{Cfloat}, ys::AbstractArray{Cfloat}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalFloatPtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cfloat}, Ref{Cfloat}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{Cdouble}, ys::AbstractArray{Cdouble}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitaldoublePtr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{Cdouble}, Ref{Cdouble}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImS8}, ys::AbstractArray{ImS8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalS8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS8}, Ref{ImS8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImU8}, ys::AbstractArray{ImU8}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalU8Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU8}, Ref{ImU8}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImS16}, ys::AbstractArray{ImS16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalS16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS16}, Ref{ImS16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImU16}, ys::AbstractArray{ImU16}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalU16Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU16}, Ref{ImU16}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImS32}, ys::AbstractArray{ImS32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalS32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS32}, Ref{ImS32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImU32}, ys::AbstractArray{ImU32}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalU32Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU32}, Ref{ImU32}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImS64}, ys::AbstractArray{ImS64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalS64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImS64}, Ref{ImS64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotDigital(label_id, xs::AbstractArray{ImU64}, ys::AbstractArray{ImU64}, count::Integer, offset::Integer, stride::Integer)
    ccall((:ImPlot_PlotDigitalU64Ptr, libcimplot), Cvoid, (Ptr{Cchar}, Ref{ImU64}, Ref{ImU64}, Cint, Cint, Cint), label_id, xs, ys, count, offset, stride)
end

function PlotImage(label_id, user_texture_id, bounds_min, bounds_max, uv0, uv1, tint_col)
    ccall((:ImPlot_PlotImage, libcimplot), Cvoid, (Ptr{Cchar}, ImTextureID, ImPlotPoint, ImPlotPoint, ImVec2, ImVec2, ImVec4), label_id, user_texture_id, bounds_min, bounds_max, uv0, uv1, tint_col)
end

function PlotText(text, x::Real, y::Real, vertical, pix_offset)
    ccall((:ImPlot_PlotText, libcimplot), Cvoid, (Ptr{Cchar}, Cdouble, Cdouble, Bool, ImVec2), text, x, y, vertical, pix_offset)
end

function PlotDummy(label_id)
    ccall((:ImPlot_PlotDummy, libcimplot), Cvoid, (Ptr{Cchar},), label_id)
end

function SetNextPlotLimits(xmin, xmax, ymin, ymax, cond)
    ccall((:ImPlot_SetNextPlotLimits, libcimplot), Cvoid, (Cdouble, Cdouble, Cdouble, Cdouble, ImGuiCond), xmin, xmax, ymin, ymax, cond)
end

function SetNextPlotLimitsX(xmin, xmax, cond)
    ccall((:ImPlot_SetNextPlotLimitsX, libcimplot), Cvoid, (Cdouble, Cdouble, ImGuiCond), xmin, xmax, cond)
end

function SetNextPlotLimitsY(ymin, ymax, cond, y_axis)
    ccall((:ImPlot_SetNextPlotLimitsY, libcimplot), Cvoid, (Cdouble, Cdouble, ImGuiCond, ImPlotYAxis), ymin, ymax, cond, y_axis)
end

function LinkNextPlotLimits(xmin, xmax, ymin, ymax, ymin2, ymax2, ymin3, ymax3)
    ccall((:ImPlot_LinkNextPlotLimits, libcimplot), Cvoid, (Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}), xmin, xmax, ymin, ymax, ymin2, ymax2, ymin3, ymax3)
end

function FitNextPlotAxes(x, y, y2, y3)
    ccall((:ImPlot_FitNextPlotAxes, libcimplot), Cvoid, (Bool, Bool, Bool, Bool), x, y, y2, y3)
end

function SetNextPlotTicksXdoublePtr(values, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdoublePtr, libcimplot), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Ptr{Cchar}}, Bool), values, n_ticks, labels, show_default)
end

function SetNextPlotTicksXdouble(x_min, x_max, n_ticks, labels, show_default)
    ccall((:ImPlot_SetNextPlotTicksXdouble, libcimplot), Cvoid, (Cdouble, Cdouble, Cint, Ptr{Ptr{Cchar}}, Bool), x_min, x_max, n_ticks, labels, show_default)
end

function SetNextPlotTicksYdoublePtr(values, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdoublePtr, libcimplot), Cvoid, (Ptr{Cdouble}, Cint, Ptr{Ptr{Cchar}}, Bool, ImPlotYAxis), values, n_ticks, labels, show_default, y_axis)
end

function SetNextPlotTicksYdouble(y_min, y_max, n_ticks, labels, show_default, y_axis)
    ccall((:ImPlot_SetNextPlotTicksYdouble, libcimplot), Cvoid, (Cdouble, Cdouble, Cint, Ptr{Ptr{Cchar}}, Bool, ImPlotYAxis), y_min, y_max, n_ticks, labels, show_default, y_axis)
end

function SetPlotYAxis(y_axis)
    ccall((:ImPlot_SetPlotYAxis, libcimplot), Cvoid, (ImPlotYAxis,), y_axis)
end

function HideNextItem(hidden, cond)
    ccall((:ImPlot_HideNextItem, libcimplot), Cvoid, (Bool, ImGuiCond), hidden, cond)
end

function PixelsToPlotVec2(pOut, pix, y_axis)
    ccall((:ImPlot_PixelsToPlotVec2, libcimplot), Cvoid, (Ptr{ImPlotPoint}, ImVec2, ImPlotYAxis), pOut, pix, y_axis)
end

function PixelsToPlotFloat(pOut, x, y, y_axis)
    ccall((:ImPlot_PixelsToPlotFloat, libcimplot), Cvoid, (Ptr{ImPlotPoint}, Cfloat, Cfloat, ImPlotYAxis), pOut, x, y, y_axis)
end

function PlotToPixelsPlotPoInt(pOut, plt, y_axis)
    ccall((:ImPlot_PlotToPixelsPlotPoInt, libcimplot), Cvoid, (Ptr{ImVec2}, ImPlotPoint, ImPlotYAxis), pOut, plt, y_axis)
end

function PlotToPixelsdouble(pOut, x::Real, y::Real, y_axis)
    ccall((:ImPlot_PlotToPixelsdouble, libcimplot), Cvoid, (Ptr{ImVec2}, Cdouble, Cdouble, ImPlotYAxis), pOut, x, y, y_axis)
end

function GetPlotPos(pOut)
    ccall((:ImPlot_GetPlotPos, libcimplot), Cvoid, (Ptr{ImVec2},), pOut)
end

function GetPlotSize(pOut)
    ccall((:ImPlot_GetPlotSize, libcimplot), Cvoid, (Ptr{ImVec2},), pOut)
end

function IsPlotHovered()
    ccall((:ImPlot_IsPlotHovered, libcimplot), Bool, ())
end

function IsPlotXAxisHovered()
    ccall((:ImPlot_IsPlotXAxisHovered, libcimplot), Bool, ())
end

function IsPlotYAxisHovered(y_axis)
    ccall((:ImPlot_IsPlotYAxisHovered, libcimplot), Bool, (ImPlotYAxis,), y_axis)
end

function GetPlotMousePos(pOut, y_axis)
    ccall((:ImPlot_GetPlotMousePos, libcimplot), Cvoid, (Ptr{ImPlotPoint}, ImPlotYAxis), pOut, y_axis)
end

function GetPlotLimits(pOut, y_axis)
    ccall((:ImPlot_GetPlotLimits, libcimplot), Cvoid, (Ptr{ImPlotLimits}, ImPlotYAxis), pOut, y_axis)
end

function IsPlotQueried()
    ccall((:ImPlot_IsPlotQueried, libcimplot), Bool, ())
end

function GetPlotQuery(pOut, y_axis)
    ccall((:ImPlot_GetPlotQuery, libcimplot), Cvoid, (Ptr{ImPlotLimits}, ImPlotYAxis), pOut, y_axis)
end

function DragLineX(id, x_value, show_label, col, thickness)
    ccall((:ImPlot_DragLineX, libcimplot), Bool, (Ptr{Cchar}, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, x_value, show_label, col, thickness)
end

function DragLineY(id, y_value, show_label, col, thickness)
    ccall((:ImPlot_DragLineY, libcimplot), Bool, (Ptr{Cchar}, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, y_value, show_label, col, thickness)
end

function DragPoint(id, x, y, show_label, col, radius)
    ccall((:ImPlot_DragPoint, libcimplot), Bool, (Ptr{Cchar}, Ptr{Cdouble}, Ptr{Cdouble}, Bool, ImVec4, Cfloat), id, x, y, show_label, col, radius)
end

function SetLegendLocation(location, orientation, outside)
    ccall((:ImPlot_SetLegendLocation, libcimplot), Cvoid, (ImPlotLocation, ImPlotOrientation, Bool), location, orientation, outside)
end

function SetMousePosLocation(location)
    ccall((:ImPlot_SetMousePosLocation, libcimplot), Cvoid, (ImPlotLocation,), location)
end

function IsLegendEntryHovered(label_id)
    ccall((:ImPlot_IsLegendEntryHovered, libcimplot), Bool, (Ptr{Cchar},), label_id)
end

function BeginLegendDragDropSource(label_id, flags)
    ccall((:ImPlot_BeginLegendDragDropSource, libcimplot), Bool, (Ptr{Cchar}, ImGuiDragDropFlags), label_id, flags)
end

function EndLegendDragDropSource()
    ccall((:ImPlot_EndLegendDragDropSource, libcimplot), Cvoid, ())
end

function BeginLegendPopup(label_id, mouse_button)
    ccall((:ImPlot_BeginLegendPopup, libcimplot), Bool, (Ptr{Cchar}, ImGuiMouseButton), label_id, mouse_button)
end

function EndLegendPopup()
    ccall((:ImPlot_EndLegendPopup, libcimplot), Cvoid, ())
end

function GetStyle()
    ccall((:ImPlot_GetStyle, libcimplot), Ptr{ImPlotStyle}, ())
end

function StyleColorsAuto(dst)
    ccall((:ImPlot_StyleColorsAuto, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function StyleColorsClassic(dst)
    ccall((:ImPlot_StyleColorsClassic, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function StyleColorsDark(dst)
    ccall((:ImPlot_StyleColorsDark, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function StyleColorsLight(dst)
    ccall((:ImPlot_StyleColorsLight, libcimplot), Cvoid, (Ptr{ImPlotStyle},), dst)
end

function PushStyleColorU32(idx, col)
    ccall((:ImPlot_PushStyleColorU32, libcimplot), Cvoid, (ImPlotCol, ImU32), idx, col)
end

function PushStyleColorVec4(idx, col)
    ccall((:ImPlot_PushStyleColorVec4, libcimplot), Cvoid, (ImPlotCol, ImVec4), idx, col)
end

function PopStyleColor(count)
    ccall((:ImPlot_PopStyleColor, libcimplot), Cvoid, (Cint,), count)
end

function PushStyleVarFloat(idx, val)
    ccall((:ImPlot_PushStyleVarFloat, libcimplot), Cvoid, (ImPlotStyleVar, Cfloat), idx, val)
end

function PushStyleVarInt(idx, val)
    ccall((:ImPlot_PushStyleVarInt, libcimplot), Cvoid, (ImPlotStyleVar, Cint), idx, val)
end

function PushStyleVarVec2(idx, val)
    ccall((:ImPlot_PushStyleVarVec2, libcimplot), Cvoid, (ImPlotStyleVar, ImVec2), idx, val)
end

function PopStyleVar(count)
    ccall((:ImPlot_PopStyleVar, libcimplot), Cvoid, (Cint,), count)
end

function SetNextLineStyle(col, weight)
    ccall((:ImPlot_SetNextLineStyle, libcimplot), Cvoid, (ImVec4, Cfloat), col, weight)
end

function SetNextFillStyle(col, alpha_mod)
    ccall((:ImPlot_SetNextFillStyle, libcimplot), Cvoid, (ImVec4, Cfloat), col, alpha_mod)
end

function SetNextMarkerStyle(marker, size, fill, weight, outline)
    ccall((:ImPlot_SetNextMarkerStyle, libcimplot), Cvoid, (ImPlotMarker, Cfloat, ImVec4, Cfloat, ImVec4), marker, size, fill, weight, outline)
end

function SetNextErrorBarStyle(col, size, weight)
    ccall((:ImPlot_SetNextErrorBarStyle, libcimplot), Cvoid, (ImVec4, Cfloat, Cfloat), col, size, weight)
end

function GetLastItemColor(pOut)
    ccall((:ImPlot_GetLastItemColor, libcimplot), Cvoid, (Ptr{ImVec4},), pOut)
end

function GetStyleColorName(idx)
    ccall((:ImPlot_GetStyleColorName, libcimplot), Ptr{Cchar}, (ImPlotCol,), idx)
end

function GetMarkerName(idx)
    ccall((:ImPlot_GetMarkerName, libcimplot), Ptr{Cchar}, (ImPlotMarker,), idx)
end

function PushColormapPlotColormap(colormap)
    ccall((:ImPlot_PushColormapPlotColormap, libcimplot), Cvoid, (ImPlotColormap,), colormap)
end

function PushColormapVec4Ptr(colormap, size)
    ccall((:ImPlot_PushColormapVec4Ptr, libcimplot), Cvoid, (Ptr{ImVec4}, Cint), colormap, size)
end

function PopColormap(count)
    ccall((:ImPlot_PopColormap, libcimplot), Cvoid, (Cint,), count)
end

function SetColormapVec4Ptr(colormap, size)
    ccall((:ImPlot_SetColormapVec4Ptr, libcimplot), Cvoid, (Ptr{ImVec4}, Cint), colormap, size)
end

function SetColormapPlotColormap(colormap, samples)
    ccall((:ImPlot_SetColormapPlotColormap, libcimplot), Cvoid, (ImPlotColormap, Cint), colormap, samples)
end

function GetColormapSize()
    ccall((:ImPlot_GetColormapSize, libcimplot), Cint, ())
end

function GetColormapColor(pOut, index)
    ccall((:ImPlot_GetColormapColor, libcimplot), Cvoid, (Ptr{ImVec4}, Cint), pOut, index)
end

function LerpColormap(pOut, t)
    ccall((:ImPlot_LerpColormap, libcimplot), Cvoid, (Ptr{ImVec4}, Cfloat), pOut, t)
end

function NextColormapColor(pOut)
    ccall((:ImPlot_NextColormapColor, libcimplot), Cvoid, (Ptr{ImVec4},), pOut)
end

function ShowColormapScale(scale_min, scale_max, height)
    ccall((:ImPlot_ShowColormapScale, libcimplot), Cvoid, (Cdouble, Cdouble, Cfloat), scale_min, scale_max, height)
end

function GetColormapName(colormap)
    ccall((:ImPlot_GetColormapName, libcimplot), Ptr{Cchar}, (ImPlotColormap,), colormap)
end

function GetInputMap()
    ccall((:ImPlot_GetInputMap, libcimplot), Ptr{ImPlotInputMap}, ())
end

function GetPlotDrawList()
    ccall((:ImPlot_GetPlotDrawList, libcimplot), Ptr{ImDrawList}, ())
end

function PushPlotClipRect()
    ccall((:ImPlot_PushPlotClipRect, libcimplot), Cvoid, ())
end

function PopPlotClipRect()
    ccall((:ImPlot_PopPlotClipRect, libcimplot), Cvoid, ())
end

function ShowStyleSelector(label)
    ccall((:ImPlot_ShowStyleSelector, libcimplot), Bool, (Ptr{Cchar},), label)
end

function ShowColormapSelector(label)
    ccall((:ImPlot_ShowColormapSelector, libcimplot), Bool, (Ptr{Cchar},), label)
end

function ShowStyleEditor(ref)
    ccall((:ImPlot_ShowStyleEditor, libcimplot), Cvoid, (Ptr{ImPlotStyle},), ref)
end

function ShowUserGuide()
    ccall((:ImPlot_ShowUserGuide, libcimplot), Cvoid, ())
end

function ShowMetricsWindow(p_popen)
    ccall((:ImPlot_ShowMetricsWindow, libcimplot), Cvoid, (Ptr{Bool},), p_popen)
end

function SetImGuiContext(ctx)
    ccall((:ImPlot_SetImGuiContext, libcimplot), Cvoid, (Ptr{ImGuiContext},), ctx)
end

function ShowDemoWindow(p_open)
    ccall((:ImPlot_ShowDemoWindow, libcimplot), Cvoid, (Ptr{Bool},), p_open)
end

function PlotLineG(label_id, getter, data, count::Integer, offset::Integer)
    ccall((:ImPlot_PlotLineG, libcimplot), Cvoid, (Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function PlotScatterG(label_id, getter, data, count::Integer, offset::Integer)
    ccall((:ImPlot_PlotScatterG, libcimplot), Cvoid, (Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

function PlotShadedG(label_id, getter1, data1, getter2, data2, count::Integer, offset::Integer)
    ccall((:ImPlot_PlotShadedG, libcimplot), Cvoid, (Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter1, data1, getter2, data2, count, offset)
end

function PlotBarsG(label_id, getter, data, count::Integer, width::Real, offset::Integer)
    ccall((:ImPlot_PlotBarsG, libcimplot), Cvoid, (Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, width, offset)
end

function PlotBarsH(label_id, getter, data, count::Integer, height::Real, offset::Integer)
    ccall((:ImPlot_PlotBarsHG, libcimplot), Cvoid, (Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cdouble, Cint), label_id, getter, data, count, height, offset)
end

function PlotDigitalG(label_id, getter, data, count::Integer, offset::Integer)
    ccall((:ImPlot_PlotDigitalG, libcimplot), Cvoid, (Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Cint), label_id, getter, data, count, offset)
end

# Skipping MacroDefinition: API __attribute__ ( ( __visibility__ ( "default" ) ) )

# Skipping MacroDefinition: EXTERN extern

export ImPlotPoint, ImPlotRange, ImPlotLimits, ImPlotStyle, ImPlotInputMap, ImPlotContext
export CreateContext, DestroyContext, GetCurrentContext, SetCurrentContext, SetImGuiContext
export EndPlot
export SetNextPlotLimits, SetNextPlotLimitsX, SetNextPlotLimitsY, LinkNextPlotLimits, FitNextPlotAxes
export SetPlotYAxis, HideNextItem, IsPlotHovered, IsPlotXAxisHovered, IsPlotYAxisHoevered, IsPlotQueried
export DragLineX, DragLineY, DragPoint
export SetLegendLocation, SetMousePosLocation, IsLegendEntryHovered
export BeginLegendDragDropSource, EndLegendDragDropSource, BeginLegendPopup, EndLegendPopup
export PopStyleColor, PopStyleVar
export SetNextLineStyle, SetNextFillStyle, SetNextMarkerStyle, SetNextErrorBarStyle
export GetStyleColorName, GetMarkerName, PopColormap, GetColormapSize, ShowColormapScale
export GetColormapName, PushPlotClipRect, PopPlotClipRect
export ShowStyleSelector, ShowColormapSelector, ShowUserGuide, ShowDemoWindow

# exports
const PREFIXES = ["ImPlotFlags_", "ImPlotAxisFlags_", "ImPlotCol_", "ImPlotStyleVar_", "ImPlotMarker_", "ImPlotColormap_", "ImPlotLocation_", "ImPlotOrientation_", "ImPlotYAxis_"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
