-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the config
local config = {}

-- New API
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Display the workspace name in the right status area
wezterm.on('update-right-status', function(window, pane)
  local cwd_uri = pane:get_current_working_dir():gsub('file://', '')

  -- Make it italic and underlined
  window:set_right_status(wezterm.format {
    { Text = cwd_uri .. '  ' .. window:active_workspace() .. '  '},
  })
end)

wezterm.on('window-config-reloaded', function(window, pane)
  window:toast_notification('wezterm', 'Configuration reloaded!', nil, 4000)
end)

-- Keyboard Shortcuts
-- Most of my bindings will require a leader, so it works like TMUX
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  -- MOVE ACROSS WORD BOUNDARIES
  -- Backward Word
  {
    key="LeftArrow",
    mods="OPT",
    action=wezterm.action{ SendString="\x1bb" }
  },
  -- Forward word
  {
    key="RightArrow",
    mods="OPT",
    action=wezterm.action{SendString="\x1bf"}
  },
  -- V-Split
  {
    key = '"',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- H-Split
  {
    key = '%',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- CTRL+B Z tmux-like zoom
  {
    key = 'z',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState,
  },
  -- Fuzzy move between workspaces
  {
    key = 'f',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },
  -- Create/move to workspace by name
  {
    key = 's',
    mods = 'LEADER',
    action = wezterm.action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name workspace to switch to/create' },
      },
      action = wezterm.action_callback(function (window, pane, line)
        if line then
          window:perform_action(
            wezterm.action.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  }
}

-- Fonts
config.font = wezterm.font {
  family = 'Fira Code',
  -- harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
}
config.font_size = 11.0

-- Cursor
config.default_cursor_style = 'BlinkingBar'
config.colors = {}
config.colors.cursor_bg = '#AAAA00'

-- Color scheme
config.color_scheme = 'Andromeda'
-- config.color_scheme = 'Tokyo Night Storm (Gogh)'
-- config.color_scheme = 'Tomorrow (dark) (terminal.sexy)'
-- config.color_scheme = 'Twilight (dark) (terminal.sexy)'

config.bold_brightens_ansi_colors = true
config.automatically_reload_config = true
config.window_background_opacity = 0.8

-- See https://wezfurlong.org/wezterm/config/lua/config/use_ime.html
config.use_ime = false

-- Finally, return the configuration to wezterm
return config
