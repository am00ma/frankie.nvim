local config = require("frankie.config")

local M = {}

---@param opts? frankie.Config
function M.load(opts)
  opts = require("frankie.config").extend(opts)
  -- local bg = vim.o.background

  return require("frankie.theme").setup(opts)
end

M.setup = config.setup

return M
