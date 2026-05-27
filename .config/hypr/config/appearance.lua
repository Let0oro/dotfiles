local hl = require("hyprland")

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
    border_size = 2,
    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 0,
    shadow = {
      enabled = true,
      range = 2,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
    blur = {
      enabled = true,
      size = 2,
      passes = 2,
      special = true,
      brightness = 0.60,
      contrast = 0.75,
    },
  },

  dwindle = {
    preserve_split = true,
    force_split = 2,
  },

  master = {
    new_status = "master",
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    focus_on_activate = true,
    anr_missed_pings = 3,
    on_focus_under_fullscreen = 1,
  },

  cursor = {
    hide_on_key_press = true,
  },
})
