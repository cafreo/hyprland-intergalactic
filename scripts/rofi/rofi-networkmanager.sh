#! /bin/sh

chosen=$(nmcli -g NAME c show | rofi -dmenu -theme /home/$(whoami)/.config/rofi/config-list.rasi)

if [ -z "$chosen" ]; then

echo "No New Network selected"

else
    nmcli c up "$chosen" | dunstify -t 3000 -a "nmcli" -b "New Connection" "<b>$chosen</b>" -u low -i /home/$(whoami)/Scripts/img/wifi.svg
fi