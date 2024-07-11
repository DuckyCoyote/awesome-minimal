local vc = require("vicious")
local wibox = require("wibox")
local color = require("theme/.palette")
local gfs = require("gears.filesystem")

local pkg_text = wibox.widget.textbox()

local color = color.green

vc.register(pkg_text, vc.widgets.pkg, '<span color="' .. color .. '"> </span>$1', 10, "Arch")
-- #ff7b70
local pkg = pkg_text
return pkg
