local M = {}

---@param opts? frankie.Config
---@return frankie.Colorscheme
function M.setup(opts)
  local colors = require("frankie.colors.greenish")
  if opts ~= nil then
    if opts.style ~= nil then
      colors = require("frankie.colors." .. opts.style)
    end
  end
  return colors
end

return M
