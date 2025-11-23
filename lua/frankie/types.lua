---@class frankie.Highlight: vim.api.keyset.highlight
---@field style? vim.api.keyset.highlight

---@class frankie.Config
---@field style string

---@class frankie.Colorscheme
---@field palette frankie.Palette

---@alias frankie.Highlights table<string,frankie.Highlight|string>
---@alias frankie.HighlightsFn fun(colors: frankie.Colorscheme, opts:frankie.Config):frankie.Highlights
