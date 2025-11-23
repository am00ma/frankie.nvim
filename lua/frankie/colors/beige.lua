local Util = require("frankie.util")

---@class frankie.Colorscheme
local M = {}

-- https://paletton.com/#uid=32P0u0kw05lnbdVrx9aIh2qUr0w
---@class frankie.Palette
M.palette = {
  bg = "#FFE2AF",
  fg = "#9E8BFF",
  accent = "#7AFFE9",

  success = "#00FF00",
  info = "#0000FF",
  warn = "#FFFF00",
  error = "#FF0000",
}

---@class frankie.Diags
M.diags = {}

-- Adjust palette
M.palette.fg = Util.brighten(M.palette.fg, -0.5, -0.4)
M.palette.accent = Util.brighten(M.palette.accent, -0.4, 0.2)
M.palette.success = Util.blend("#00FF00", 0.5, M.palette.bg)
M.palette.info = Util.blend("#0000FF", 0.5, M.palette.bg)
M.palette.warn = Util.blend("#FFFF00", 0.5, M.palette.bg)
M.palette.error = Util.blend("#FF0000", 0.5, M.palette.bg)

return M
