-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the config
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Fonts
config.font = wezterm.font {
  family = 'Fira Code',
  harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
}

-- Cursor
config.default_cursor_style = 'BlinkingBar'
config.colors = {}
config.colors.cursor_bg = '#AAAA00'

-- Color scheme:
config.color_scheme = 'Andromeda'
-- config.color_scheme = 'Tokyo Night Storm (Gogh)'
-- config.color_scheme = 'Tomorrow (dark) (terminal.sexy)'
-- config.color_scheme = 'Twilight (dark) (terminal.sexy)'

config.font_size = 10.0

-- Finally, return the configuration to wezterm
return config
