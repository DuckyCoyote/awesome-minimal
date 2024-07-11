local vc = require("vicious")
local wibox = require("wibox")
local gfs = require("gears.filesystem")
local palette = require("theme/.palette")
local icon = gfs.get_configuration_dir() .. "/icons/crayon/storage.png"

local color = palette.blue
-- Crear el widget de fecha
local hdd_text = wibox.widget.textbox()
vc.register(hdd_text, vc.widgets.fs, '<span color="' .. color .. '">  </span>/${/ avail_gb} Gb ')

local hdd = hdd_text

return hdd
