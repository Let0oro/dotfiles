#!/bin/bash
status=$(playerctl --player=mpd status 2>/dev/null)
if [[ -z "$status" ]]; then
  echo '{"text": "  ", "class": "stopped", "alt": ""}'
  exit 0
fi
if [[ "$status" == "Playing" ]]; then
  echo '{"text":"","class":"playing","alt":"Playing"}'
elif [[ "$status" == "Paused" ]]; then
  echo '{"text":"","class":"paused","alt":"Paused"}'
fi
