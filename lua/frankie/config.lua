local M = {}

M.version = "0.0.1"

---@class frankie.Config
M.defaults = {
  style = "greenish",
}

---@type frankie.Config
M.options = nil

---@param options? frankie.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
  return M.options
end

---@param opts? frankie.Config
function M.extend(opts)
  return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
  __index = function(_, k)
    if k == "options" then
      return M.defaults
    end
  end,
})

return M
