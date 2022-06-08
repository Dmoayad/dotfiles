local awful = require("awful")
local gears = require("gears")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")
local lain = require("lain")
local watch = require('awful.widget.watch')
local helpers = require("config.helpers")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

local separator = wibox.widget.textbox("  ")

-- Tags 
-- awfultags =  { "1", "2" , "3", "4", "5", "6", "7", "8", "9" }
-- awfultags =  { "", " ", "", "", "", "", "", "", "" }
-- awfultags =  { "dev",  "www ", " sys ", "doc", "vbox", "chat", "mus", "vid", "gfx" }
-- awfultags =  { "", "", " ", "","", "", "", "", "", "", "" }
-- awfultags =  { "I", "II", "III", "IV", "V", "VI" }
-- awfultags =  { "", "", "", "", "", "", "", "", "" }
awfultags =  { "", "", "", "", "", "", "", "", "" }
-- awfultags =  { "", "", "", "", "", "", "", "", "" }
-- awfultags =  { "一", "二", "三", "四", "五", "六", "七", "八", "九" }
-- awfultags =  { "", "", "", "", "", "", "", "", "" }
-- awfultags =  { "", "", "", "", "", "", "", "", "" }
-- awfultags =  { "", "", "", "", "", "", "", "", "" }
-- awfultags =  { "", "", "", "", "", "", "", "", ""}
-- awfultags =  { "", "", "", "", "", "", "", "", "" }
-- awfultags =  { "", "", "", "", "", "", "", "", ""}

-- Pacman Taglist :
-- awfultags = {"●", "●", "●", "●", "●", "●", "●", "●", "●", "●"}
-- awfultags = {"", "", "", "", "", "", "", "", "", ""}
-- awfultags = {"•", "•", "•", "•", "•", "•", "•", "•", "•", "•"}
-- awfultags = { "","", "", "", "", "", "", "", "", "" }
-- awfultags = { "󰮯", "󰮯", "󰮯", "󰮯", "󰮯", "󰮯", "󰮯", "󰮯", "󰮯", "󰮯" }
-- awfultags =  { "", "", "", "", "", "", "", "", "",  "" }
-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()



-- Widgets :
-- function to add paddings and background to widgets.
local function barcontainer(widget)
    local container = wibox.widget
      {
        widget,
        top = dpi(1),
        bottom = dpi(1),
        left = dpi(4),
        right = dpi(4),
        widget = wibox.container.margin
    }
    local box = wibox.widget{
        {
            container,
            top = dpi(0),
            bottom = dpi(0),
            left = dpi(4),
            right = dpi(4),
            widget = wibox.container.margin
        },
        bg = colors.black,
        shape = helpers.rrect(dpi(6)),
        widget = wibox.container.background
    }
return wibox.widget{
        box,
        top = dpi(4),
        bottom = dpi(4),
        right = dpi(2),
        left = dpi(2),
        widget = wibox.container.margin
    }
end

-- widgets update interval (in seconds)
local interval = 60

watch('sh -c', interval, function()
    sb_battery() -- update battery status
-- volume/brightness updates everytime you incerease decrease volume through widget/keyboard shortcuts. so no need to update at intervals.
--    sb_volume()
--    sb_brightness()
end)


-- Net :
local net = lain.widget.net{
    settings = function()
        widget:set_markup("  " .. net_now.received .. " ↓↑ " .. net_now.sent .. " ")
    end
}
net.widget.font = theme.font
mynet = wibox.widget {
	{
        {
          widget = net.widget
        },
        fg = colors.yellow, -- text color
        --  bg = "blue",
        widget = wibox.container.background
	},
	--bottom = 2,
	color = colors.yellow,
	widget = wibox.container.margin
}

-- Coretemp :
local temp = lain.widget.temp{
    settings = function()
        widget:set_markup(" " .. coretemp_now .. "°C ")
    end
}
temp.widget.font = theme.font
mytemp = wibox.widget {
	{
        {
          widget = temp.widget
        },
        fg = colors.brightred, -- text color
        --  bg = "blue",
        widget = wibox.container.background
	},
	--bottom = 2,
	color = colors.brightred,
	widget = wibox.container.margin
}

-- CPU :
local cpu = lain.widget.cpu{
	settings = function()
		widget:set_markup(" ".. cpu_now.usage.. "% ")
	end
}
cpu.widget.font = theme.font
mycpu = wibox.widget {
	{
        {
          widget = cpu.widget
        },
        fg = colors.blue, -- text color
        --  bg = "blue",
        widget = wibox.container.background
	},
	--bottom = 2,
	color = colors.blue,
	widget = wibox.container.margin
}

-- RAM :
local mem = lain.widget.mem{
    settings = function()
        widget:set_markup(" " .. mem_now.perc .. "% ")
    end
}
mem.widget.font = theme.font
mymem = wibox.widget {
	{
        {
          widget = mem.widget
        },
        fg = colors.green, -- text color
        --  bg = "blue",
        widget = wibox.container.background
	},
	--bottom = 2,
	color = colors.green,
	widget = wibox.container.margin
}

-- Battery :
local bat = lain.widget.bat{
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                --widget:set_markup(bat_now.perc, "  AC ")
                widget:set_markup(" " .. bat_now.perc .. "%")
                return
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                widget:set_markup(" ")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 20 then
                widget:set_markup(" ")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 30 then
                widget:set_markup(" ")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 40 then
                widget:set_markup(" ")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 50 then
                widget:set_markup(" ")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 60 then
                widget:set_markup(" ")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 70 then
                widget:set_markup(" ")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 80 then
                widget:set_markup(" ")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 90 then
                widget:set_markup(" ")
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 100 then
                widget:set_markup(" ")               
            else
                widget:set_markup(" ")
            end
            widget:set_markup("  " .. bat_now.perc .. "% ")
        else
            widget:set_markup()
        end
    end
}
bat.widget.font = theme.iconfont
mybat = wibox.widget {
	{
        {
          widget = bat.widget,
        },
        fg = colors.blue, -- text color
        --  bg = "blue",
        widget = wibox.container.background
	},
	--bottom = 2,
	color = colors.blue,
	widget = wibox.container.margin
}

-- Keyboard :
keyboardlayout = awful.widget.keyboardlayout()
keyboardlayout.widget.font = theme.font
mykeyboardlayout = wibox.widget {
	{
		{
			widget = keyboardlayout,
		},
        fg = colors.brightblue, -- text color
        widget = wibox.container.background
	},
	--bottom = 2,
	color = colors.brightblue,
	widget = wibox.container.margin
    
}

-- Textclock :
local clock = awful.widget.watch(
    "date +'%a %d %b | %H:%M ' ", 60,
    function(widget, stdout)
        widget:set_markup("⧗ " .. stdout)
    end
)
clock.font = theme.font
myclock = wibox.widget {
	{
		{
			widget = clock
        },
        fg = colors.brightmagenta, -- text color
        widget = wibox.container.background
	},
	--bottom = 2,
	color = colors.brightmagenta,
	widget = wibox.container.margin  
}

-- Calendar :
theme.cal = lain.widget.cal{
    attach_to = { clock },
    notification_preset = {
        font = theme.font,
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
}

-- Systemtry :
theme.systray_icon_spacing = dpi(6)
mytray = wibox.widget {
	{
        {
          widget = wibox.widget.systray()
        },
        fg = colors.brightgreen, -- text color
        --  bg = "blue",
        widget = wibox.container.background
	},
	--bottom = 2,
	color = colors.green,
	widget = wibox.container.margin
}

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock(" %a %b %d, %I:%M %P ")

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
-- screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    -- set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag(awfultags, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height=28 })

    systray = wibox.widget.systray()
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            barcontainer(mylauncher),
            barcontainer(s.mytaglist),
            s.mypromptbox,
        },
        barcontainer(s.mytasklist), -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            barcontainer(mynet),
            barcontainer(mytemp),
            barcontainer(mycpu),
            barcontainer(mykeyboardlayout),
            barcontainer(mytray),
            -- systray,
            barcontainer(myclock),
            barcontainer(s.mylayoutbox),
        },
    }
end)
-- }}}


-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal("mouse::enter", function(c)
--    c:emit_signal("request::activate", "mouse_enter", {raise = false})
--end)

client.connect_signal("focus", function(c) c.border_color = theme.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = theme.border_normal end)
-- }}}

-- Gaps 
-- beautiful.useless_gap = 10

