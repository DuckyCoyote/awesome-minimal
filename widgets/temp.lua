local vc = require('vicious')
local wibox = require('wibox')
local palette = require('theme/.palette')

local color = palette.green

-- Crear el widget de fecha
local temp_text = wibox.widget.textbox()
vc.register(temp_text, vc.widgets.thermal, "<span color='" .. color .. "'>󰔏 </span>$1°C", 5,
  { "thermal_zone3", "sys", "temp" })

local temp = temp_text

return temp
