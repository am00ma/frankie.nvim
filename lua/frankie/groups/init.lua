local Config = require("frankie.config")

local M = {}

---@param colors frankie.Palette
---@param opts frankie.Config
function M.setup(colors, opts)
  -- Load config
  local cfg = Config.setup(opts)

  -- Just to shut up the LSP
  if cfg ~= nil then
    cfg = { style = "greenish" }
  end

  -- Merge groups
  local groups = {
    ["Normal"] = { bg = colors.bg, fg = colors.fg },
  }

  local ret = {}

  return ret, groups
end

return M
