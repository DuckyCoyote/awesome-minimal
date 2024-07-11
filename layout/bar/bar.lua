local dpi = require("beautiful.xresources").apply_dpi
local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local gfs = require("gears.filesystem")
local color = require("theme/.palette")
local current_config = gfs.get_configuration_dir()

-- Widgets
local date = require("widgets/.clock")
local mem = require("widgets/.mem")
local wifi = require("widgets/.wifi")
local weather = require("widgets/.weather")
local hdd = require("widgets/.hdd")
local cpu = require("widgets/.cpu")
local weather_widget = require("awesome-wm-widgets.weather-widget.weather")
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
local dashboard = require("widgets/.dashboard")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")
local bat = require("widgets.battery")
-- local temp = require("widgets.temp")
local media = require("widgets/.media")
local taglist = require("layout/bar/.taglist")

local power = require("widgets.power")
local pkg = require("widgets/.pkg")

local vm_widget = require("widgets.vmware")

-- Functions
local add_margin = require("layout/.add-margin")
local baritems = require("layout/bar/.baritems")

awful.screen.connect_for_each_screen(function(s)
	-- Each scre en has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

	baritems(s)

	s.mytaglist = taglist(s)

	function rounded_shape(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 17)
	end

	function widget_shape(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 10)
	end

	local info_widgets = {
		wibox.container.margin(
			wibox.widget({
				wifi,
				volume_widget,
				pkg,
				spacing = 10,
				layout = wibox.layout.fixed.horizontal,
			}),
			10,
			10,
			0,
			0
		),
		bg = color.dark_inactive,
		shape = widget_shape,
		shape_border_color = "#34344f",
		shape_border_width = 2,
		widget = wibox.container.background,
	}
	-- #303145
	local vm_margin = {
		wibox.container.margin(
			wibox.widget({
				vm_widget,
				spacing = 10,
				layout = wibox.layout.fixed.horizontal,
			}),
			10,
			10,
			0,
			0
		),
		shape = widget_shape,
		bg = color.dark_inactive,
		shape_border_color = "#34344f",
		shape_border_width = 2,
		widget = wibox.container.background,
	}

	local right_widgets = wibox.widget({
		layout = wibox.layout.align.horizontal,
		-- wibox.container.margin(temp, 5, 15, 5, 5),
		wibox.container.margin(cpu, 5, 15, 5, 5),
		wibox.container.margin(mem, 5, 10, 5, 5),
	})

	local last_widgets = {
		wibox.container.margin(
			wibox.widget({
				weather_widget({
					api_key = "a277c8fb7aef84fe2e1cbc8f8782f832",
					coordinates = { 19.6997, -99.1475 },
					font_name = "Carter One",
					icons = "VitalyGorbachev",
					icons_extension = ".svg",
					show_hourly_forecast = true,
					show_daily_forecast = true,
				}),
				spacing = 10,
				layout = wibox.layout.fixed.horizontal,
			}),
			10,
			10,
			3,
			3
		),
		shape = widget_shape,
		bg = color.dark_inactive,
		shape_border_color = "#34344f",
		shape_border_width = 2,
		widget = wibox.container.background,
	}

	local taglist_cont = {
		wibox.container.margin(
			wibox.widget({
				s.mytaglist,
				spacing = 10,
				layout = wibox.layout.fixed.horizontal,
			}),
			10,
			10,
			3,
			3
		),
		bg = color.dark_inactive,
		shape = widget_shape,
		widget = wibox.container.background,
	}

	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = dpi(33),
		width = s.full,
		bg = color.dark,
		margins = { top = dpi(7), left = dpi(10), right = dpi(10), bottom = dpi(0) },
		-- border_width = dpi(7)
		-- shape = rounded_shape
	})

	s.mywibox:setup({
		{
			wibox.container.margin(dashboard, 15, 15, 7, 7),
			wibox.container.margin(taglist_cont, 5, 5, 3, 3),
			wibox.container.margin(vm_margin, 5, 5, 5, 3),
			layout = wibox.layout.align.horizontal,
		},
		{ -- Left Items
			wibox.container.margin(
				spotify_widget({
					font = "CaskaydiaCove Nerd Font 11",
					play_icon = gfs.get_configuration_dir() .. "/icons/jugar.png",
					pause_icon = gfs.get_configuration_dir() .. "/icons/boton-de-pausa.png",
				}),
				8,
				8,
				11,
				8
			),
			layout = wibox.layout.fixed.horizontal,
		},
		{
			wibox.container.margin(last_widgets, 5, 20, 5, 5),
			{
				right_widgets,
				wibox.container.margin(hdd, 5, 15, 5, 5),
				wibox.container.margin(info_widgets, 0, 5, 5, 5),
				widget = wibox.layout.align.horizontal,
			},
			{
				{
					wibox.container.margin(media, 7, 7, 0, 0),
					power,
					space = 20,
					layout = wibox.layout.align.horizontal,
				},
				wibox.container.margin(date, 10, 25, 5, 5),
				layout = wibox.layout.align.horizontal,
			},
			widget = wibox.layout.align.horizontal,
		},
		layout = wibox.layout.align.horizontal,
	})
end)
