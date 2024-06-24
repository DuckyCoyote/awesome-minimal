local vc = require('vicious')
local wibox = require('wibox')
local color = require('theme/.palette')
local gfs = require("gears.filesystem")

local cpu_text = wibox.widget.textbox()

local color = color.red

vc.register(cpu_text, vc.widgets.cpu, '<span color="' .. color .. '">  </span>$1%')
-- #ff7b70
local cpu = cpu_text
return cpu
