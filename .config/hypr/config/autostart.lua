 -- See https://wiki.hypr.land/Configuring/Basics/Autostart/

 -- Extra autostart processes
 hl.on("hyprland.start", function()
   hl.exec_cmd([[sh -lc 'pgrep swayosd-server || uwsm-app -- swayosd-server']])
   hl.exec_cmd([[
 sh -lc 'sleep 1
 if [ "$(cat ~/.config/omarchy/current/theme/name 2>/dev/null)" = "zenities" ]; then
   pkill waybar
   eww daemon
   eww open bar
 fi'
]])
 end)
