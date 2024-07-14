#!/bin/bash

element1="󰔚 $(uptime -p | cut -d' ' -f2-)"
element2="󰠠 $(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | head -n 1 | sed 's/.*/\u&/')"
element3="󰛳 $(mullvad status | head -n 1)"
element4="  $(playerctl metadata title) - $(playerctl metadata artist)"

notify-send -t 6000 -a "systemcheck" "systemcheck $(date +%H:%M)" "$element1\n$element2\n$element3" -u normal -i ~/.config/icons/ssScreen.svg

