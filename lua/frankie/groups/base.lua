local Util = require("frankie.util")
local M = {}

---@type frankie.HighlightsFn
function M.get(colors, _)
  local c = colors.palette
  -- local d = colors.diags

  return {
    -- UI
    Normal = { bg = c.bg, fg = c.fg },
    NormalNC = "Normal",

    Visual = "Normal",
    VisualNOS = "Normal", -- not owning selection

    -- Float
    NormalFloat = "Normal",
    FloatBorder = "Normal", -- Hiding border
    FloatTitle = "Normal",
    FloatFooter = "Normal",

    -- Cursor
    Cursor = "Normal",
    lCursor = "Normal",
    CursorIM = "Normal",
    CursorColumn = "Normal",
    CursorLine = "Normal",
    CursorLineNr = "Normal",
    CursorLineFold = "Normal",
    CursorLineSign = "Normal",

    TermCursor = "Normal",

    -- Syntax
    Title = "Normal",
    Whitespace = "Normal",

    Comment = "Normal", -- any comment
    ColorColumn = "Normal", -- used for the columns set with 'colorcolumn'
    Conceal = "Normal", -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor = "Normal", -- character under the cursor
    -- lCursor = "Normal", -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM = "Normal", -- like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn = "Normal", -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine = "Normal", -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = "Normal", -- directory names (and other special names in listings)
    DiffAdd = "Normal", -- diff mode: Added line |diff.txt|
    DiffChange = "Normal", -- diff mode: Changed line |diff.txt|
    DiffDelete = "Normal", -- diff mode: Deleted line |diff.txt|
    DiffText = "Normal", -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = "Normal", -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg = "Normal", -- error messages on the command line
    VertSplit = "Normal", -- the column separating vertically split windows
    WinSeparator = "Normal", -- the column separating vertically split windows
    Folded = "Normal", -- line used for closed folds
    FoldColumn = "Normal", -- 'foldcolumn'
    SignColumn = "Normal", -- column where |signs| are displayed
    SignColumnSB = "Normal", -- column where |signs| are displayed
    Substitute = "Normal", -- |:substitute| replacement text highlighting
    LineNr = "Normal", -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- CursorLineNr = "Normal", -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    LineNrAbove = "Normal",
    LineNrBelow = "Normal",
    MatchParen = "Normal", -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = "Normal", -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = "Normal", -- Area for messages and cmdline
    MoreMsg = "Normal", -- |more-prompt|
    NonText = "Normal", -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- Normal = "Normal", -- normal text
    -- NormalNC = "Normal", -- normal text in non-current windows
    NormalSB = "Normal", -- normal text in sidebar
    -- NormalFloat = "Normal", -- Normal text in floating windows.
    -- FloatBorder = "Normal",
    -- FloatTitle = "Normal",
    Pmenu = "Normal", -- Popup menu: normal item.
    PmenuMatch = "Normal", -- Popup menu: Matched text in normal item.
    PmenuSel = "Normal", -- Popup menu: selected item.
    PmenuMatchSel = "Normal", -- Popup menu: Matched text in selected item.
    PmenuSbar = "Normal", -- Popup menu: scrollbar.
    PmenuThumb = "Normal", -- Popup menu: Thumb of the scrollbar.
    Question = "Normal", -- |hit-enter| prompt and yes/no questions
    QuickFixLine = "Normal", -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = "Normal", -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = "Normal", -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = "IncSearch",
    SpecialKey = "Normal", -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = "Normal", -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = "Normal", -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = "Normal", -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = "Normal", -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = "Normal", -- status line of current window
    StatusLineNC = "Normal", -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = "Normal", -- tab pages line, not active tab page label
    TabLineFill = "Normal", -- tab pages line, where there are no labels
    TabLineSel = "Normal", -- tab pages line, active tab page label
    -- Title = "Normal", -- titles for output from ":set all", ":autocmd" etc.
    -- Visual = "Normal", -- Visual mode selection
    -- VisualNOS = "Normal", -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = "Normal", -- warning messages
    -- Whitespace = "Normal", -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = "Normal", -- current match in 'wildmenu' completion
    WinBar = "StatusLine", -- window bar
    WinBarNC = "StatusLineNC", -- window bar in inactive windows

    Bold = { bold = true, fg = c.fg }, -- (preferred) any bold text
    Character = "Normal", --  a character constant: 'c', '\n'
    Constant = "Normal", -- (preferred) any constant
    Debug = "Normal", --    debugging statements
    Delimiter = "Special", --  character that needs attention
    Error = "Normal", -- (preferred) any erroneous construct
    Function = "Normal", -- function name (also: methods for classes)
    Identifier = "Normal", -- (preferred) any variable name
    Italic = "Normal", -- (preferred) any italic text
    Keyword = "Normal", --  any other keyword
    Operator = "Normal", -- "sizeof", "+", "*", etc.
    PreProc = "Normal", -- (preferred) generic Preprocessor
    Special = "Normal", -- (preferred) any special symbol
    Statement = "Normal", -- (preferred) any statement
    String = "Normal", --   a string constant: "this is a string"
    Todo = "Normal", -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Type = "Normal", -- (preferred) int, long, char, etc.
    Underlined = "Normal", -- (preferred) text that stands out, HTML links
    debugBreakpoint = "Normal", -- used for breakpoint colors in terminal-debug
    debugPC = "Normal", -- used for highlighting the current line in terminal-debug
    dosIniLabel = "@property",
    helpCommand = "Normal",
    htmlH1 = "Normal",
    htmlH2 = "Normal",
    qfFileName = "Normal",
    qfLineNr = "Normal",

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own.
    LspReferenceText = "Normal", -- used for highlighting "text" references
    LspReferenceRead = "Normal", -- used for highlighting "read" references
    LspReferenceWrite = "Normal", -- used for highlighting "write" references
    LspSignatureActiveParameter = "Normal",
    LspCodeLens = "Normal",
    LspInlayHint = "Normal",
    LspInfoBorder = "Normal",
    ComplHint = "Normal",

    -- diagnostics
    DiagnosticError = "Normal", -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = "Normal", -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = "Normal", -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = "Normal", -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = "Normal", -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticVirtualTextError = "Normal", -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = "Normal", -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = "Normal", -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = "Normal", -- Used for "Hint" diagnostic virtual text
    DiagnosticUnderlineError = "Normal", -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = "Normal", -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = "Normal", -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = "Normal", -- Used to underline "Hint" diagnostics

    -- Health
    healthError = "Normal",
    healthSuccess = "Normal",
    healthWarning = "Normal",

    -- diff (not needed anymore?)
    diffAdded = "Normal",
    diffRemoved = "Normal",
    diffChanged = "Normal",
    diffOldFile = "Normal",
    diffNewFile = "Normal",
    diffFile = "Normal",
    diffLine = "Normal",
    diffIndexLine = "Normal",
    helpExample = "Normal",
  }
end

return M
