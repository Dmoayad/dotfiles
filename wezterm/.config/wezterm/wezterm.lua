local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
  font = wezterm.font 'FiraCode Nerd Font',
  font_size = 11,
  color_scheme = 'tokyonight',
  cursor_blink_rate = 500,
  automatically_reload_config = true,
  hide_tab_bar_if_only_one_tab = true,
  initial_cols = 120,
  initial_rows = 40,
  -- enable_tab_bar = false,
  -- window_decorations = "RESIZE",
}

return config
