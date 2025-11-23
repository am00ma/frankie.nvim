local Config = require("frankie.config")

local Base = require("frankie.groups.base")
local SemanticTokens = require("frankie.groups.semantic_tokens")
local Treesitter = require("frankie.groups.treesitter")

local M = {}

---@param colors frankie.Colorscheme
---@param opts frankie.Config
function M.setup(colors, opts)
  -- Load config
  local cfg = Config.setup(opts)

  -- Just to shut up the LSP
  if cfg ~= nil then
    cfg = { style = "greenish" }
  end

  -- Merge groups : TODO: should allow opts here to use `force` below
  local groups = {}

  -- Base (UI, Diagnostics, Native Syntax)
  groups = vim.tbl_deep_extend("force", groups, Base.get(colors, opts))
  groups = vim.tbl_deep_extend("force", groups, Treesitter.get(colors, opts))
  groups = vim.tbl_deep_extend("force", groups, SemanticTokens.get(colors, opts))

  local ret = {}

  return ret, groups
end

return M
