local Util = require("frankie.util")

local M = {}

---@type frankie.HighlightsFn
function M.get(colors, _)
  local c = colors.palette

  local s = Util.spectrum(c)
  -- local d = colors.diags

  -- stylua: ignore
  local ret = {
    ["@annotation"]                 = "PreProc",
    ["@attribute"]                  = "PreProc",
    ["@boolean"]                    = "Boolean",
    ["@character"]                  = "Character",
    ["@character.printf"]           = "SpecialChar",
    ["@character.special"]          = "SpecialChar",
    ["@comment"]                    = "Comment",
    ["@comment.error"]              = { bg = s.bg, fg = s.fg },
    ["@comment.hint"]               = { bg = s.bg, fg = s.fg },
    ["@comment.info"]               = { bg = s.bg, fg = s.fg },
    ["@comment.note"]               = { bg = s.bg, fg = s.fg },
    ["@comment.todo"]               = { bg = s.bg, fg = s.fg },
    ["@comment.warning"]            = { bg = s.bg, fg = s.fg },
    ["@constant"]                   = "Constant",
    ["@constant.builtin"]           = "Special",
    ["@constant.macro"]             = "Define",
    ["@constructor"]                = { bg = s.bg, fg = s.fg }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@constructor.tsx"]            = { bg = s.bg, fg = s.fg },
    ["@diff.delta"]                 = "DiffChange",
    ["@diff.minus"]                 = "DiffDelete",
    ["@diff.plus"]                  = "DiffAdd",
    ["@function"]                   = "Function",
    ["@function.builtin"]           = "Special",
    ["@function.call"]              = "@function",
    ["@function.macro"]             = "Macro",
    ["@function.method"]            = "Function",
    ["@function.method.call"]       = "@function.method",
    ["@keyword"]                    = { bg = s.bg, fg = s.fg }, -- For keywords that don't fall in previous categories.
    ["@keyword.conditional"]        = "Conditional",
    ["@keyword.coroutine"]          = "@keyword",
    ["@keyword.debug"]              = "Debug",
    ["@keyword.directive"]          = "PreProc",
    ["@keyword.directive.define"]   = "Define",
    ["@keyword.exception"]          = "Exception",
    ["@keyword.function"]           = { bg = s.bg, fg = s.fg }, -- For keywords used to define a function.
    ["@keyword.import"]             = "Include",
    ["@keyword.operator"]           = "@operator",
    ["@keyword.repeat"]             = "Repeat",
    ["@keyword.return"]             = "@keyword",
    ["@keyword.storage"]            = "StorageClass",
    ["@label"]                      = { bg = s.bg, fg = s.fg }, -- For labels: `label:` in C and `:label:` in Lua.
    ["@markup"]                     = "@none",
    ["@markup.emphasis"]            = { italic = true },
    ["@markup.environment"]         = "Macro",
    ["@markup.environment.name"]    = "Type",
    ["@markup.heading"]             = "Title",
    ["@markup.italic"]              = { italic = true },
    ["@markup.link"]                = { bg = s.bg, fg = s.fg },
    ["@markup.link.label"]          = "SpecialChar",
    ["@markup.link.label.symbol"]   = "Identifier",
    ["@markup.link.url"]            = "Underlined",
    ["@markup.list"]                = { bg = s.bg, fg = s.fg }, -- For special punctutation that does not fall in the categories before.
    ["@markup.list.checked"]        = { bg = s.bg, fg = s.fg }, -- For brackets and parens.
    ["@markup.list.markdown"]       = { bg = s.bg, fg = s.fg },
    ["@markup.list.unchecked"]      = { bg = s.bg, fg = s.fg }, -- For brackets and parens.
    ["@markup.math"]                = "Special",
    ["@markup.raw"]                 = "String",
    ["@markup.raw.markdown_inline"] = { bg = s.bg, fg = s.fg },
    ["@markup.strikethrough"]       = { strikethrough = true },
    ["@markup.strong"]              = { bold = true },
    ["@markup.underline"]           = { underline = true },
    ["@module"]                     = "Include",
    ["@module.builtin"]             = { bg = s.bg, fg = s.fg }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@namespace.builtin"]          = "@variable.builtin",
    ["@none"]                       = {},
    ["@number"]                     = "Number",
    ["@number.float"]               = "Float",
    ["@operator"]                   = { bg = s.bg, fg = s.fg }, -- For any operator: `+`, but also `->` and `*` in C.
    ["@property"]                   = { bg = s.bg, fg = s.fg },
    ["@punctuation.bracket"]        = { bg = s.bg, fg = s.fg }, -- For brackets and parens.
    ["@punctuation.delimiter"]      = { bg = s.bg, fg = s.fg }, -- For delimiters ie: `.`
    ["@punctuation.special"]        = { bg = s.bg, fg = s.fg }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special.markdown"] = { bg = s.bg, fg = s.fg }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@string"]                     = "String",
    ["@string.documentation"]       = { bg = s.bg, fg = s.fg },
    ["@string.escape"]              = { bg = s.bg, fg = s.fg }, -- For escape characters within a string.
    ["@string.regexp"]              = { bg = s.bg, fg = s.fg }, -- For regexes.
    ["@tag"]                        = "Label",
    ["@tag.attribute"]              = "@property",
    ["@tag.delimiter"]              = "Delimiter",
    ["@tag.delimiter.tsx"]          = { bg = s.bg, fg = s.fg },
    ["@tag.tsx"]                    = { bg = s.bg, fg = s.fg },
    ["@tag.javascript"]             = { bg = s.bg, fg = s.fg },
    ["@type"]                       = "Type",
    ["@type.builtin"]               = { bg = s.bg, fg = s.fg },
    ["@type.definition"]            = "Typedef",
    ["@type.qualifier"]             = "@keyword",
    ["@variable"]                   = { bg = s.bg, fg = s.fg }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"]           = { bg = s.bg, fg = s.fg }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@variable.member"]            = { bg = s.bg, fg = s.fg }, -- For fields.
    ["@variable.parameter"]         = { bg = s.bg, fg = s.fg }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { bg = s.bg, fg = s.fg }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]
  }

  -- for i, color in ipairs(c.rainbow) do
  --   ret["@markup.heading." .. i .. ".markdown"] = { bg = s.bg, fg = s.fg }
  -- end
  return ret
end

return M
