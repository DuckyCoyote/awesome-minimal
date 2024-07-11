local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")
local color = require("theme/.palette")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

function widget_shape(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, 10)
end

local power = wibox.widget({
	{
		markup = '<span color="#ff7b70"> </span>',
		widget = wibox.widget.textbox,
	},
	layout = wibox.layout.fixed.horizontal,
})

local shutdown = wibox.widget({
	{
		{
			id = "clienticon",
			markup = '<span color="#c4c4b5" face="feather" size="50pt"></span>',
			widget = wibox.widget.textbox,
		},
		margins = { top = 20, bottom = 20, left = 20, right = 20 },

		widget = wibox.container.margin,
	},
	align = "center",
	valign = "center",
	bg = color.dark_inactive,
	focusable = true,
	shape_border_color = color.grey,
	shape_border_width = dpi(3),
	shape = widget_shape,
	widget = wibox.container.background,
})

local reset = wibox.widget({
	{
		{
			markup = '<span color="#c4c4b5" face="feather" size="50pt"></span>',
			widget = wibox.widget.textbox,
		},
		margins = { top = 20, bottom = 20, left = 20, right = 20 },
		widget = wibox.container.margin,
	},
	align = "center",
	valign = "center",
	bg = color.dark_inactive,
	shape_border_color = color.grey,
	shape_border_width = dpi(3),
	shape = widget_shape,
	widget = wibox.container.background,
})

local block = wibox.widget({
	{
		{
			markup = '<span color="#c4c4b5" face="feather" size="50pt"></span>',
			widget = wibox.widget.textbox,
		},
		margins = { top = 20, bottom = 20, left = 20, right = 20 },
		widget = wibox.container.margin,
	},
	align = "center",
	valign = "center",
	shape = widget_shape,
	bg = color.dark_inactive,
	shape_border_color = color.grey,
	shape_border_width = dpi(3),
	widget = wibox.container.background,
})

local sleep = wibox.widget({
	{
		{
			markup = '<span color="#c4c4b5" face="feather" size="50pt"></span>',
			widget = wibox.widget.textbox,
		},
		margins = { top = 20, bottom = 20, left = 20, right = 20 },
		widget = wibox.container.margin,
	},
	align = "center",
	valign = "center",
	shape = widget_shape,
	bg = color.dark_inactive,
	shape_border_color = color.grey,
	shape_border_width = dpi(3),
	widget = wibox.container.background,
})

local logout = wibox.widget({
	{
		{
			markup = '<span color="#c4c4b5" face="feather" size="50pt"></span>',
			widget = wibox.widget.textbox,
		},
		margins = { top = 20, bottom = 20, left = 20, right = 20 },
		widget = wibox.container.margin,
	},
	align = "center",
	valign = "center",
	shape = widget_shape,
	bg = color.dark_inactive,
	shape_border_color = color.grey,
	shape_border_width = dpi(3),
	widget = wibox.container.background,
})

local options = wibox.widget({
	homogeneous = false,
	spacing = 30,
	min_cols_size = 10,
	min_rows_size = 10,
	layout = wibox.layout.fixed.horizontal,
})

options:add(shutdown) -- establecer el primer widget en la izquierda
options:add(reset) -- añadir el segundo widget al centro
options:add(block) -- continuar añadiendo al centro
options:add(sleep) -- seguir añadiendo al centro
options:add(logout) -- establecer el último widget en la derecha

local old_cursor, old_wibox
shutdown:connect_signal("mouse::enter", function(c)
	c:set_bg(color.black)
	local wb = mouse.current_wibox
	old_cursor, old_wibox = wb.cursor, wb
	wb.cursor = "hand1"
end)
shutdown:connect_signal("mouse::leave", function(c)
	c:set_bg(color.dark_inactive)
	if old_wibox then
		old_wibox.cursor = old_cursor
		old_wibox = nil
	end
end)
shutdown:connect_signal("button::press", function(c, _, _, button)
	if button == 1 then
		os.execute("systemctl poweroff")
	elseif button == 2 then
		naughty.notify({ text = "Wheel click" })
	end
end) -- 			betterlockscreen -l

reset:connect_signal("mouse::enter", function(c)
	c:set_bg(color.black)
	local wb = mouse.current_wibox
	old_cursor, old_wibox = wb.cursor, wb
	wb.cursor = "hand1"
end)
reset:connect_signal("mouse::leave", function(c)
	c:set_bg(color.dark_inactive)
	if old_wibox then
		old_wibox.cursor = old_cursor
		old_wibox = nil
	end
end)
reset:connect_signal("button::press", function(c, _, _, button)
	if button == 1 then
		os.execute("systemctl reboot")
	elseif button == 2 then
		naughty.notify({ text = "Wheel click" })
	end
end)

block:connect_signal("mouse::enter", function(c)
	c:set_bg(color.black)
	local wb = mouse.current_wibox
	old_cursor, old_wibox = wb.cursor, wb
	wb.cursor = "hand1"
end)
block:connect_signal("mouse::leave", function(c)
	c:set_bg(color.dark_inactive)
	if old_wibox then
		old_wibox.cursor = old_cursor
		old_wibox = nil
	end
end)
block:connect_signal("button::press", function(c, _, _, button)
	if button == 1 then
		os.execute("betterlockscreen -l")
	elseif button == 2 then
		naughty.notify({ text = "Wheel click" })
	end
end)

sleep:connect_signal("mouse::enter", function(c)
	c:set_bg(color.black)
	local wb = mouse.current_wibox
	old_cursor, old_wibox = wb.cursor, wb
	wb.cursor = "hand1"
end)
sleep:connect_signal("mouse::leave", function(c)
	c:set_bg(color.dark_inactive)
	if old_wibox then
		old_wibox.cursor = old_cursor
		old_wibox = nil
	end
end)
sleep:connect_signal("button::press", function(c, _, _, button)
	if button == 1 then
		os.execute("mpc -q pause")
		os.execute("amixer set Master mute")
		os.execute("systemctl suspend")
	elseif button == 2 then
		naughty.notify({ text = "Wheel click" })
	end
end)

logout:connect_signal("mouse::enter", function(c)
	c:set_bg(color.black)
	local wb = mouse.current_wibox
	old_cursor, old_wibox = wb.cursor, wb
	wb.cursor = "hand1"
end)
logout:connect_signal("mouse::leave", function(c)
	c:set_bg(color.dark_inactive)
	if old_wibox then
		old_wibox.cursor = old_cursor
		old_wibox = nil
	end
end)
logout:connect_signal("button::press", function(c, _, _, button)
	if button == 1 then
		awful.spawn("pkill -u duckycoyote")
		-- os.execute("pkill -u " .. iam)
	elseif button == 2 then
		naughty.notify({ text = "Wheel click" })
	end
end)

local power_popup = awful.popup({
	widget = wibox.widget({
		widget = wibox.widget.separator,
	}),
	ontop = true,
	maximum_width = 1800,
	bg = color.dark,
	visible = false,
	placement = awful.placement.centered,
})

power_popup:setup({
	{
		options,
		margins = { top = 30, bottom = 30, left = 30, right = 30 },
		widget = wibox.container.margin,
	},
	layout = wibox.layout.fixed.horizontal,
	widget = wibox.widget.separator,
})

power:buttons(gears.table.join(awful.button({}, 1, function()
	if power_popup.visible then
		power_popup.visible = not power_popup.visible
	else
		power_popup:move_next_to(mouse.current_widget_geometry)
	end
end)))

return power
