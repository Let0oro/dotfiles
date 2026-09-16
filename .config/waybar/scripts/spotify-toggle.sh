#!/bin/bash
if ! hyprctl clients -j | jq -e 'any(.class == "rmpc")' >/dev/null 2>&1; then
    nohup env TERM=xterm-256color kitty --class rmpc -o initial_window_width=700 -o initial_window_height=450 -e rmpc >/dev/null 2>&1 &
    exit 0
fi

# Check if rmpc is visible (not on special workspace)
if hyprctl clients -j | jq -e 'any(.class == "rmpc" and .workspace.name != "special:rmpc")' >/dev/null 2>&1; then
    # Hide → move to special workspace (music keeps playing)
    hyprctl dispatch 'hl.dsp.window.move({ workspace = "special:rmpc", window = "class:rmpc" })'
else
    # Show → move to current workspace
    CURRENT=$(hyprctl activeworkspace -j | jq -r '.name')
    hyprctl dispatch "hl.dsp.window.move({ workspace = \"$CURRENT\", window = \"class:rmpc\" })"
fi
