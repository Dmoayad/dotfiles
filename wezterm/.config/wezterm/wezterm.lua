local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	font = wezterm.font_with_fallback({
		{
			family = "FiraCode Nerd Font",
		},
		{
			family = "FiraCode Nerd Font",
			assume_emoji_presentation = true,
		},
	}),

	font_size = 13,
	color_scheme = "Catppuccin Mocha",
	cursor_blink_rate = 500,
	automatically_reload_config = true,
	hide_tab_bar_if_only_one_tab = true,
	initial_cols = 120,
	initial_rows = 40,
	-- enable_tab_bar = false,
	window_decorations = "RESIZE",
	-- enable_scroll_bar = true,
	window_padding = {
		left = 0,
		right = 0,
		top = 10,
		bottom = 0,
	},
}

return config
