local M = {}

---@param opts? frankie.Config
function M.setup(opts)
  opts = require("frankie.config").extend(opts)

  local colors = require("frankie.colors").setup(opts)
  local _, groups = require("frankie.groups").setup(colors.palette, opts)

  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "frankie"

  for group, hl in pairs(groups) do
    hl = type(hl) == "string" and { link = hl } or hl
    vim.api.nvim_set_hl(0, group, hl)
  end

  return colors, groups, opts
end

return M
