local mainMod = "SUPER"

local terminal = "foot" -- "uwsm-app -- xdg-terminal-exec"
local browser = "vivaldi" -- "omarchy-launch-browser"

-------------------
------- MENU ------
-------------------

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("omarchy-launch-walker"))
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd("omarchy-launch-walker -m symbols"))
hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd("omarchy-menu"))
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("omarchy-menu system"))
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("omarchy-menu system"), { locked = true })
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("omarchy-menu-keybindings"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator"), { locked = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-------------------
---- APPS ---------
-------------------

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("uwsm-app -- nautilus --new-window"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + SHIFT + ALT + B", hl.dsp.exec_cmd(browser .. " --private"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("/home/juanma/.config/waybar/scripts/spotify-toggle.sh"))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("uwsm-app -- foot -e sh -c 'zellij --layout code'"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("uwsm-app -- foot -e sh -c papr"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("uwsm-app -- foot -e sh -c btop"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd('omarchy-launch-webapp "https://docker-handbook.farhan.dev/"'))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("uwsm-app -- foot -e sh -c lazydocker"))
hl.bind(mainMod .. " + SHIFT + ALT + D", hl.dsp.exec_cmd('omarchy-launch-webapp "https://app.datacamp.com/"'))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("uwsm-app -- obsidian"))
hl.bind(mainMod .. " + J", hl.dsp.window.pseudo())

-------------------
---- AICLIENTS -----
-------------------

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd('omarchy-launch-webapp "https://www.perplexity.ai/"'))
hl.bind(mainMod .. " + ALT + A", hl.dsp.exec_cmd('omarchy-launch-webapp "https://notebooklm.google.com/"'))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd('omarchy-launch-webapp "https://chatgpt.com"'))
hl.bind(mainMod .. " + SHIFT + ALT + A", hl.dsp.exec_cmd('omarchy-launch-webapp "https://gemini.google.com/app"'))
hl.bind(mainMod .. " + CTRL + A", hl.dsp.exec_cmd('omarchy-launch-webapp "https://claude.ai/new"'))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.exec_cmd('omarchy-launch-webapp "https://jules.google.com/session"'))
hl.bind(mainMod .. " + SHIFT + CTRL + A", hl.dsp.exec_cmd("antigravity"))

-------------------
---- GOOGLE APPS ---
-------------------

hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd('omarchy-launch-webapp "https://mail.google.com/mail/"'))
hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.exec_cmd('omarchy-launch-webapp "https://youtube.com/"'))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd('omarchy-launch-webapp "https://web.whatsapp.com/"'))
hl.bind(mainMod .. " + SHIFT + ALT + T", hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + SHIFT + ALT + N", hl.dsp.exec_cmd('omarchy-launch-webapp "https://www.notion.so/FP-DAM-Retamar-257ca4d7607b8051a715c1fb594cd0eb"'))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd('omarchy-launch-webapp "https://classroom.google.com/h"'))
hl.bind(mainMod .. " + SHIFT + ALT + C", hl.dsp.exec_cmd('omarchy-launch-webapp "https://www.netacad.com/dashboard"'))
hl.bind(mainMod .. " + SHIFT + ALT + 3", hl.dsp.exec_cmd('omarchy-launch-webapp "https://threejs-journey.com/lessons/introduction"'))
hl.bind(mainMod .. " + SHIFT + ALT + G", hl.dsp.exec_cmd('omarchy-launch-webapp "https://github.com/"'))
hl.bind(mainMod .. " + SHIFT + CTRL + G", hl.dsp.exec_cmd('omarchy-launch-webapp "https://colab.research.google.com/"'))
hl.bind(mainMod .. " + SHIFT + ALT + P", hl.dsp.exec_cmd("packettracer"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('omarchy-launch-webapp "https://substack.com"'))

-------------------
---- NAVIGATION ----
-------------------

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Mover (intercambiar) ventana activa con la ventana en dirección dada
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.swap({ direction = "down" }))

for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-------------------
---- OVERRIDES -----
-------------------

hl.unbind(mainMod .. " + SPACE")
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun"))

hl.unbind("ALT + PRINT")
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("/home/juanma/.local/bin/omarchy-cmd-screenrecord"))

hl.bind(mainMod .. " + F4", hl.dsp.exec_cmd(
    'hyprctl keyword "device[cust0001:00-06cb:cdaa-touchpad]:enabled" false'
  ),
  { description = "Mouse Disable" }
)
hl.bind(mainMod .. " + ALT + F4", hl.dsp.exec_cmd(
    'hyprctl keyword "device[cust0001:00-06cb:cdaa-touchpad]:enabled" true'
  ),
  { description = "Mouse Able" }
)

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd([[
sh -lc '
if pgrep waybar >/dev/null; then
  pkill waybar
  eww daemon
  eww open bar
else
  pkill eww
  uwsm app -- waybar
fi
'
]]))


-------------------
---- AESTHETICS ---
-------------------

hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.exec_cmd("omarchy-toggle-waybar"))
hl.bind(mainMod .. " + CTRL + SPACE", hl.dsp.exec_cmd("omarchy-theme-bg-next"))
hl.bind(mainMod .. " + SHIFT + CTRL + SPACE", hl.dsp.exec_cmd("omarchy-menu theme"))
hl.bind(mainMod .. " + BACKSPACE", hl.dsp.exec_cmd([[sh -lc 'hyprctl dispatch setprop "address:$(hyprctl activewindow -j | jq -r ".address")" opaque toggle']]))
hl.bind(mainMod .. " + SHIFT + BACKSPACE", hl.dsp.exec_cmd("omarchy-hyprland-workspace-toggle-gaps"))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen_state({
  internal = 1,
  client = 2,
  action = "toggle",
}))

-------------------
-- NOTIFICATIONS --
-------------------

hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("makoctl dismiss"))
hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.exec_cmd("makoctl dismiss --all"))
hl.bind(mainMod .. " + CTRL + COMMA", hl.dsp.exec_cmd([[sh -lc 'makoctl mode -t do-not-disturb && makoctl mode | grep -q "do-not-disturb" && notify-send "Silenced notifications" || notify-send "Enabled notifications"']]))
hl.bind(mainMod .. " + ALT + COMMA", hl.dsp.exec_cmd("makoctl invoke"))
hl.bind(mainMod .. " + SHIFT + ALT + COMMA", hl.dsp.exec_cmd("makoctl restore"))

-------------------
---- IDLING --------
-------------------

hl.bind(mainMod .. " + CTRL + I", hl.dsp.exec_cmd("omarchy-toggle-idle"))

-------------------
--- NIGHTLIGHT -----
-------------------

hl.bind(mainMod .. " + CTRL + N", hl.dsp.exec_cmd("omarchy-toggle-nightlight"))

-------------------
-- APPLE DISPLAY ---
-------------------

hl.bind("CTRL + F1", hl.dsp.exec_cmd("omarchy-cmd-apple-display-brightness -5000"))
hl.bind("CTRL + F2", hl.dsp.exec_cmd("omarchy-cmd-apple-display-brightness +5000"))
hl.bind("CTRL + SHIFT + F2", hl.dsp.exec_cmd("omarchy-cmd-apple-display-brightness +60000"))

-------------------
---- CAPTURES ------
-------------------

hl.bind("PRINT", hl.dsp.exec_cmd("omarchy-cmd-screenshot"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("omarchy-cmd-screenshot smart clipboard"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("sh -lc 'pkill hyprpicker || hyprpicker -a'"))

-------------------
-- FILE SHARING ----
-------------------

hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("omarchy-menu share"))

-------------------
-- WAYBAR-LESS INFO -
-------------------

hl.bind(mainMod .. " + CTRL + ALT + T", hl.dsp.exec_cmd([[sh -lc 'notify-send "    $(date +"%A %H:%M  —  %d %B W%V %Y")"']]))
hl.bind(mainMod .. " + CTRL + ALT + B", hl.dsp.exec_cmd([[sh -lc 'notify-send "󰁹    Battery is at $(omarchy-battery-remaining)%"']]))

-------------------
-- CONTROL PANELS ---
-------------------

hl.bind(mainMod .. " + CTRL + A", hl.dsp.exec_cmd("omarchy-launch-audio"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("omarchy-launch-bluetooth"))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("omarchy-launch-wifi"))
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd("uwsm-app -- foot -e sh -c btop"))

-------------------
---- DICTATION -----
-------------------

-- hl.bind(mainMod .. " + CTRL + X", hl.dsp.exec_cmd("voxtype record start"))
-- hl.bind(mainMod .. " + CTRL + X", hl.dsp.exec_cmd("voxtype record stop"), { repeat = false })

-------------------
---- LOCK SYSTEM ---
-------------------

hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("omarchy-lock-screen"))

-------------------
--- MEDIA KEYS ----
-------------------

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"),    { locked = true, repeat_key = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"),    { locked = true, repeat_key = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),  { locked = true })
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl next"),                           { locked = true })
hl.bind("XF86AudioPause",       hl.dsp.exec_cmd("playerctl play-pause"),                     { locked = true })
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"),                     { locked = true })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl previous"),                       { locked = true })
