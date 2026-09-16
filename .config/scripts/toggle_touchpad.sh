#!/bin/bash
DEVICE="cust0001:00-06cb:cdaa-touchpad"
STATUS=$(hyprctl getoption "device[$DEVICE]:enabled")

if [ "$STATUS" = "true" ]; then
  hyprctl keyword "device[$DEVICE]:enabled" false
  notify-send "Touchpad deshabilitado"
else
  hyprctl keyword "device[$DEVICE]:enabled" true
  notify-send "Touchpad habilitado"
fi

