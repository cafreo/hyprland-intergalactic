#! /bin/bash

sleep 0.1

chosen=$(nmcli -g NAME c show | rofi -dmenu -p "network" -theme ~/.config/rofi/modes/list.rasi)

if [ -z "$chosen" ]; then

echo "No New Network selected"

else
    nmcli c up "$chosen" | dunstify -t 3000 -a "nmcli" -b "New Connection" "<b>$chosen</b>" -u low -i ~/Scripts/img/wifi.svg
fi
