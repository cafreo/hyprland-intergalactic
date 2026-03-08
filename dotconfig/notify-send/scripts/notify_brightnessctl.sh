#!/bin/bash
# changeBrightness

# Arbitrary but unique message tag
msgTag="brightnessctl"
 
brightnessctl set $1
brightness="$(brightnessctl -m 361u | cut -d, -f4 | tr -d %)"

notify-send -t 1000 -a "brightnessctl" "Brightness: $brightness%" -u low -i ~/.config/icons/volume_high.svg -h int:value:"$brightness" -r 2189
