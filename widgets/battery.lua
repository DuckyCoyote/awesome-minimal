local vc = require('vicious')
local wibox = require('wibox')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/crayon/heart.png'

-- Crear el widget de fecha
local bat_text = wibox.widget.textbox()
vc.register(bat_text, vc.widgets.bat, '   87 %', 10, 'BAT1')

local bat = bat_text

return bat
