local Util = require("frankie.util")

---@class frankie.Colorscheme
local M = {}

---@class frankie.Palette
M.palette = {
  bg = "#111111",
  fg = "#dddddd",
  accent = "#555588",
}

---@class frankie.Diags
M.diags = {
  success = "#000000",
  info = "#000000",
  warn = "#000000",
  error = "#000000",
}

-- Adjust palette
-- M.palette.fg = Util.brighten(M.palette.fg, 0.3, 0.1)
M.palette.accent = Util.brighten(M.palette.accent, 0.3, 0.1)

return M
