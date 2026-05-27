local hl = require("hyprland")

hl.bind("SUPER, W", "killactive")
hl.bind("CTRL ALT, DELETE", "exec, omarchy-hyprland-window-close-all")

hl.bind("SUPER, J", "layoutmsg, togglesplit")
hl.bind("SUPER, P", "layoutmsg, pseudo")
hl.bind("SUPER, T", "togglefloating")
hl.bind("SUPER, F", "fullscreen, 0")
hl.bind("SUPER CTRL, F", "fullscreenstate, 0 2")
hl.bind("SUPER ALT, F", "fullscreen, 1")
hl.bind("SUPER, O", "exec, omarchy-hyprland-window-pop")

hl.bind("SUPER, LEFT", "movefocus, l")
hl.bind("SUPER, RIGHT", "movefocus, r")
hl.bind("SUPER, UP", "movefocus, u")
hl.bind("SUPER, DOWN", "movefocus, d")
