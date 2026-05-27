local hl = require("hyprland")

hl.windowrule("opacity 0.7 0.7", nil)
hl.windowrule("tag +term", "class:^(kitty)$")

hl.windowrulev2("focus", "class:^(jetbrains-toolbox)$")
hl.windowrulev2(
  "noinitialfocus",
  'class:^(jetbrains-toolbox)$,title:^(.*(floating_dialog|popup|dialog|terms|license|update).*)$'
)
