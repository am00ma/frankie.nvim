local M = {}

---@type frankie.HighlightsFn
function M.get(colors, _)
  local c = colors.palette
  -- local d = colors.diags

  return {
    Foo = { bg = c.bg, fg = c.fg },
  }
end

return M
