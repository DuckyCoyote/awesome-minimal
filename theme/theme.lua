local gears = require("gears")
local color = require("theme/.palette")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local gfs = require("gears.filesystem")
local dpi = xresources.apply_dpi
local theme_path = gfs.get_configuration_dir() .. "/themes/"
local themes_path = gfs.get_themes_dir()

local theme = {}

-- theme.font = "Hack Nerd Font Bold 11"
theme.font = "CaskaydiaMono Nerd Font Bold 11"
-- theme.nerd_font = "CaskaydiaMono Nerd Font Bold 11"
-- theme.font = "Cartograph CF medium 12"

theme.bg_normal = color.dark
theme.bg_focus = color.dark_inactive
theme.bg_minimize = color.dark

theme.wibar_bg = color.dark

theme.useless_gap = dpi(6)
-- theme.border_radius = dpi(50)
theme.tasklist_disable_task_name = true

theme.fg_normal = color.light
theme.fg_focus = color.light_active

theme.hotkeys_fg = color.light
theme.hotkeys_modifiers_fg = color.light_active

theme.border_width = dpi(4)
-- theme.border_normal = '#FF7070'
-- theme.border_focus = '#2d3640'
theme.border_focus = color.dark_inactive
-- theme.border_focus = '#0094FA'
theme.border_normal = color.dark
-- theme.border_normal = '#15191e'

-- Menu Colors

theme.menu_font = "Roboto Mono Nerd Font 15"
theme.menu_height = dpi(20)
theme.menu_width = dpi(200)
theme.menu_border_width = dpi(2)
theme.menu_border_radius = dpi(50)
theme.menu_bg_normal = color.dark
theme.menu_fg_normal = color.light
theme.menu_bg_focus = color.dark_inactive
theme.menu_fg_focus = color.light_active

-- Layout icon
theme.layout_fairh = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "default/layouts/cornersew.png"

-- -- Notifications
-- function rounded_shape(cr, width, height)
-- 	gears.shape.margin = margin
-- 	gears.shape.rounded_rect(cr, width, height, 10)
-- end
--
-- theme.notification_width = dpi(300)
theme.notification_height = dpi(100)
-- theme.notification_shape = rounded_shape
--
-- theme.notification_icon_resize_strategy = 'center'
-- theme.notification_icon_size = dpi(300)

---------------------------------------
-----Notifications---------------------
---------------------------------------
theme.notification_font = "Fira Code Nerd Fon Bold 13"
theme.notification_fg = "#a9b1d6"
theme.notification_position = "top_middle"
theme.notification_margin = dpi(10)
theme.notification_border_width = dpi(0)
theme.notification_spacing = dpi(15)
theme.notification_icon_resize_strategy = "center"
theme.notification_icon_size = dpi(300)

return theme
