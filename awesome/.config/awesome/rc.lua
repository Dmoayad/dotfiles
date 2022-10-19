-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

-- choose your theme here
local accents = {
	"tomorrow-dark", -- 1
	"otis-forest", -- 2
	"winter", -- 3
  "onedark", -- 4
  "tokyonight", -- 5
}
-- choose your theme here
local chosen_accents = accents[5]
local theme_path = string.format("%s/.config/awesome/themes/accents/%s.lua", os.getenv("HOME"), chosen_accents)
beautiful.init(theme_path)

-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
-- require("config")

-- Configs :

-- Notifications :
require("config.errors")

-- keybinds :
require("config.keybinds")

-- Menu :
require("config.menu")

-- Rules :
require("config.rules")

-- Layouts :
require("config.layouts")

-- Titlebars :
require("config.titlebar")

-- Bar :
require("config.bar")

-- Autorun
require("config.autorun")

-- Collecting Garbage :
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
