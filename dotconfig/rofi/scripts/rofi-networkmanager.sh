#! /bin/bash

sleep 0.1

chosen=$(nmcli -g NAME c show | rofi -dmenu -p "network" -theme ~/.config/rofi/modes/list.rasi)

if [ -z "$chosen" ]; then

echo "No New Network selected"

else
    nmcli c up "$chosen" | notify-send -t 3000 -a "nmcli" "New Connection" "<b>$chosen</b>" -u low -i ~/.config/icons/wifi.svg
fi
