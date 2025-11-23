local Util = require("frankie.util")

---@class frankie.Colorscheme
local M = {}

-- https://paletton.com/#uid=32P0u0kw05lnbdVrx9aIh2qUr0w
---@class frankie.Palette
M.palette = {
  bg = "#FFE2AF",
  fg = "#9E8BFF",
  accent = "#7AFFE9",
}

---@class frankie.Diags
M.diags = {
  success = "#000000",
  info = "#000000",
  warn = "#000000",
  error = "#000000",
}

-- Adjust palette
M.palette.fg = Util.brighten(M.palette.fg, -0.5, -0.4)
M.palette.accent = Util.brighten(M.palette.accent, -0.4, 0.2)

return M
