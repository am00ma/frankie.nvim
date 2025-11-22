local Util = require("frankie.util")
local M = {}

---@param c frankie.Palette
M.spectrum = function(c)
  -- brighten/darken foreground color
  return {
    bg = c.bg,
    bg_1f = Util.blend(c.fg, 0.1, c.bg),
    bg_2f = Util.blend(c.fg, 0.2, c.bg),
    bg_3f = Util.blend(c.fg, 0.3, c.bg),

    fg = c.fg,
    fg_1b = Util.blend(c.bg, 0.1, c.fg),
    fg_2b = Util.blend(c.bg, 0.2, c.fg),
    fg_3b = Util.blend(c.bg, 0.3, c.fg),
    fg_9b = Util.blend(c.bg, 0.95, c.fg),

    accent = c.accent,
    accent_1b = Util.blend(c.bg, 0.1, c.accent),
    accent_2b = Util.blend(c.bg, 0.2, c.accent),
    accent_3b = Util.blend(c.bg, 0.3, c.accent),
    accent_9b = Util.blend(c.bg, 0.95, c.accent),
  }
end

---@type frankie.HighlightsFn
function M.get(colors, _)
  local c = colors.palette

  -- Adjust palette
  c.fg = Util.brighten(c.fg, 0.4, 0.4)
  c.accent = Util.brighten(c.accent, 0.2, 0.2)

  local s = M.spectrum(c)
  -- local d = colors.diags

  return {
    -- UI
    Normal = { bg = s.bg, fg = s.fg_1b }, -- fade a bit so we have some 'headroom'
    NormalNC = { bg = s.bg, fg = s.fg_2b },
    NormalSB = { bg = s.bg, fg = s.fg_2b }, -- normal text in sidebar
    Conceal = { bg = s.bg, fg = s.fg_9b }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Visual = { bg = s.bg_2f, fg = s.fg },
    VisualNOS = { bg = s.bg_2f, fg = s.fg_1b }, -- not owning selection

    -- Float
    NormalFloat = { bg = s.bg, fg = s.fg },
    FloatBorder = { bg = s.bg, fg = s.fg_9b }, -- Hiding border
    FloatTitle = { bg = s.bg, fg = s.accent, bold = true },
    FloatFooter = "NormalFloat",

    -- Cursor
    Cursor = { bg = s.fg, fg = s.bg },
    lCursor = { bg = s.fg, fg = s.bg },
    CursorIM = { bg = s.fg, fg = s.bg },
    CursorColumn = { bg = s.fg, fg = s.bg },
    CursorLine = { bg = s.bg_1f, fg = s.fg },
    CursorLineNr = { bg = s.bg, fg = s.fg, bold = true },
    CursorLineFold = { bg = s.bg_1f, fg = s.fg },
    CursorLineSign = { bg = s.bg_1f, fg = s.fg },
    TermCursor = { bg = s.fg, fg = s.bg },

    -- Separators
    VertSplit = { bg = s.bg, fg = s.accent_3b }, -- the column separating vertically split windows
    WinSeparator = "VertSplit", -- the column separating vertically split windows
    ColorColumn = "CursorLine", -- used for the columns set with 'colorcolumn'

    -- Gutter
    LineNr = { bg = s.bg, fg = s.accent_3b }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove = { bg = s.bg, fg = s.accent_3b },
    LineNrBelow = "LineNrAbove",
    Folded = { bg = s.bg, fg = s.fg_3b, italic = true }, -- line used for closed folds
    FoldColumn = "Folded", -- 'foldcolumn'
    SignColumn = "Folded", -- column where |signs| are displayed
    SignColumnSB = "Folded", -- column where |signs| are displayed

    -- Statuslines
    QuickFixLine = "Normal", -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    StatusLine = "Normal", -- status line of current window
    StatusLineNC = "Normal", -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = "Normal", -- tab pages line, not active tab page label
    TabLineFill = "Normal", -- tab pages line, where there are no labels
    TabLineSel = "Normal", -- tab pages line, active tab page label
    WinBar = "StatusLine", -- window bar
    WinBarNC = "StatusLineNC", -- window bar in inactive windows

    -- Statusline
    ModeMsg = "Normal", -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = "Normal", -- Area for messages and cmdline
    MoreMsg = "Normal", -- |more-prompt|
    NonText = "Normal", -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

    -- Search
    Substitute = "Normal", -- |:substitute| replacement text highlighting
    MatchParen = "Normal", -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    Question = "Normal", -- |hit-enter| prompt and yes/no questions
    Search = "Normal", -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = "Normal", -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = "IncSearch",
    WildMenu = "Normal", -- current match in 'wildmenu' completion

    -- Popup menu
    Pmenu = "Normal", -- Popup menu: normal item.
    PmenuMatch = "Normal", -- Popup menu: Matched text in normal item.
    PmenuSel = "Normal", -- Popup menu: selected item.
    PmenuMatchSel = "Normal", -- Popup menu: Matched text in selected item.
    PmenuSbar = "Normal", -- Popup menu: scrollbar.
    PmenuThumb = "Normal", -- Popup menu: Thumb of the scrollbar.

    -- Spelling diagnostics
    SpellBad = "Normal", -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = "Normal", -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = "Normal", -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = "Normal", -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

    -- Messages
    ErrorMsg = "Normal", -- error messages on the command line
    WarningMsg = "Normal", -- warning messages

    -- Syntax
    Title = { bg = s.bg, fg = s.accent, bold = true },
    Comment = { bg = s.bg, fg = s.fg_3b, italic = true }, -- any comment
    Directory = { bg = s.bg, fg = s.fg, italic = true }, -- directory names (and other special names in listings)
    Whitespace = { bg = s.bg, fg = s.accent },
    SpecialKey = { bg = s.bg, fg = s.accent }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    EndOfBuffer = { bg = s.bg, fg = s.accent }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
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

    -- misc
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

    -- Diff
    DiffAdd = "Normal", -- diff mode: Added line |diff.txt|
    DiffChange = "Normal", -- diff mode: Changed line |diff.txt|
    DiffDelete = "Normal", -- diff mode: Deleted line |diff.txt|
    DiffText = "Normal", -- diff mode: Changed text within a changed line |diff.txt|

    -- not needed anymore?
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
