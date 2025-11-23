local Util = require("frankie.util")

---@class frankie.Colorscheme
local M = {}

-- https://paletton.com/#uid=32P0u0kw05lnbdVrx9aIh2qUr0w
---@class frankie.Palette
M.palette = {
  -- bg = "#002200",
  -- fg = "#6F431F",
  -- accent = "#59193D",

  bg = "#002200",
  fg = "#bbaa88",
  accent = "#6F431F",

  -- bg = "#6F431F",
  -- fg = "#002200",
  -- accent = "#59193D",

  -- bg = "#59193D",
  -- fg = "#002200",
  -- accent = "#6F431F",

  success = "#00FF00",
  info = "#0000FF",
  warn = "#FFFF00",
  error = "#FF0000",
}

-- Adjust palette
-- M.palette.fg = Util.brighten(M.palette.fg, 0.3, 0.1)
M.palette.accent = Util.brighten(M.palette.accent, 0.3, 0.3)

M.palette.success = Util.blend("#00FF00", 0.5, M.palette.bg)
M.palette.info = Util.blend("#0000FF", 0.5, M.palette.bg)
M.palette.warn = Util.blend("#FFFF00", 0.5, M.palette.bg)
M.palette.error = Util.blend("#FF0000", 0.5, M.palette.bg)

return M
