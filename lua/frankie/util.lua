local hsluv = require("frankie.hsluv")

local M = {}

M.bg = "#000000"
M.fg = "#ffffff"
M.day_brightness = 0.3

---@param c  string
local function rgb(c)
  c = string.lower(c)
  return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, alpha, background)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = rgb(background)
  local fg = rgb(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.blend_bg(hex, amount, bg)
  return M.blend(hex, amount, bg or M.bg)
end
M.darken = M.blend_bg

function M.blend_fg(hex, amount, fg)
  return M.blend(hex, amount, fg or M.fg)
end
M.lighten = M.blend_fg

---@param color string|frankie.Colorscheme
function M.invert(color)
  if type(color) == "table" then
    for key, value in pairs(color) do
      color[key] = M.invert(value)
    end
  elseif type(color) == "string" then
    if color ~= "NONE" then
      local hsl = hsluv.hex_to_hsluv(color)
      hsl[3] = 100 - hsl[3]
      if hsl[3] < 40 then
        hsl[3] = hsl[3] + (100 - hsl[3]) * M.day_brightness
      end
      return hsluv.hsluv_to_hex(hsl)
    end
  end
  return color
end

---@param color string  -- The hex color string to be adjusted
---@param lightness_amount number? -- The amount to increase lightness by (optional, default: 0.1)
---@param saturation_amount number? -- The amount to increase saturation by (optional, default: 0.15)
function M.brighten(color, lightness_amount, saturation_amount)
  lightness_amount = lightness_amount or 0.05
  saturation_amount = saturation_amount or 0.2

  -- Convert the hex color to HSLuv
  local hsl = hsluv.hex_to_hsluv(color)

  -- Increase lightness slightly
  hsl[3] = math.min(hsl[3] + (lightness_amount * 100), 100)

  -- Increase saturation a bit more to make the color more vivid
  hsl[2] = math.min(hsl[2] + (saturation_amount * 100), 100)

  -- Convert the HSLuv back to hex and return
  return hsluv.hsluv_to_hex(hsl)
end

---@param c frankie.Palette
function M.spectrum(c)
  -- brighten/darken foreground color
  return {
    bg = c.bg,
    bg_1f = M.blend(c.fg, 0.1, c.bg),
    bg_2f = M.blend(c.fg, 0.2, c.bg),
    bg_3f = M.blend(c.fg, 0.3, c.bg),

    fg = c.fg,
    fg_1b = M.blend(c.bg, 0.1, c.fg),
    fg_2b = M.blend(c.bg, 0.2, c.fg),
    fg_3b = M.blend(c.bg, 0.3, c.fg),
    fg_5b = M.blend(c.bg, 0.5, c.fg),
    fg_8b = M.blend(c.bg, 0.85, c.fg),
    fg_9b = M.blend(c.bg, 0.95, c.fg),

    accent = c.accent,
    accent_1b = M.blend(c.bg, 0.1, c.accent),
    accent_2b = M.blend(c.bg, 0.2, c.accent),
    accent_3b = M.blend(c.bg, 0.3, c.accent),
    accent_5b = M.blend(c.bg, 0.5, c.accent),
    accent_8b = M.blend(c.bg, 0.85, c.accent),
    accent_9b = M.blend(c.bg, 0.95, c.accent),

    accent_1f = M.blend(c.fg, 0.1, c.accent),
    accent_2f = M.blend(c.fg, 0.2, c.accent),
    accent_3f = M.blend(c.fg, 0.3, c.accent),
    accent_5f = M.blend(c.fg, 0.5, c.accent),
    accent_8f = M.blend(c.fg, 0.85, c.accent),
    accent_9f = M.blend(c.fg, 0.95, c.accent),

    error = c.error,
    success = c.success,
    info = c.info,
    warn = c.warn,
  }
end

return M
