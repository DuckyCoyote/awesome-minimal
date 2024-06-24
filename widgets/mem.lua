local vc = require('vicious')
local wibox = require('wibox')
local palette = require('theme/.palette')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/crayon/mem.png'

local color = palette.yellow

-- Crear el widget de fecha
local memwidget = wibox.widget.textbox()
vc.cache(vc.widgets.mem)
vc.register(memwidget, vc.widgets.mem, "<span color='" .. color .. "'>  </span>$2 MiB", 13)
-- #b3de54
local mem = memwidget

return mem
