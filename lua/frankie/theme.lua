local Util = require("frankie.util")

local M = {}

---@param opts? frankie.Config
function M.setup(opts)
  opts = require("frankie.config").extend(opts)

  local colors = require("frankie.colors").setup(opts)

  -- Adjust palette
  colors.palette.fg = Util.brighten(colors.palette.fg, 0.4, 0.4)
  colors.palette.accent = Util.brighten(colors.palette.accent, 0.2, 0.2)

  local _, groups = require("frankie.groups").setup(colors, opts)

  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "frankie-" .. opts.style

  for group, hl in pairs(groups) do
    hl = type(hl) == "string" and { link = hl } or hl
    vim.api.nvim_set_hl(0, group, hl)
  end

  return opts, colors, groups
end

return M
