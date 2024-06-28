local wibox = require("wibox")
local media = require("widgets/media_player/.main")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local color = require("theme/.palette")

local spotify_widget = wibox.widget({
	{
		markup = "<span color='" .. color.green .. "'> </span>",
		widget = wibox.widget.textbox,
	},
	layout = wibox.container.place,
})

-- spotify_widget:connect_signal("button::press", function()
-- 	media.visible = not media.visible
-- end)

-- spotify_widget:buttons(gears.table.join(awful.button({}, 1, function()
-- 	if media.visible then
-- 		media.visible = not media.visible
-- 	else
-- 		media:move_next_to(mouse.current_widget_geometry)
-- 	end
-- end)))

spotify_widget:buttons(gears.table.join(awful.button({}, 1, function()
	if media.visible then
		media.visible = not media.visible
	else
		media:move_next_to(mouse.current_widget_geometry)
	end
end)))

return spotify_widget
