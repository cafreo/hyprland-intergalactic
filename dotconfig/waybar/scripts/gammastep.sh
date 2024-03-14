#!/bin/bash

if [[ $1 = "toggle" ]]; then
	if pgrep -x "gammastep" > /dev/null; then
		kill $(pgrep -x gammastep)
		echo "Nightlight is off"
		notify-send -t 3000 -a "gammastep" "Gammastep" "<b>Nightlight is off</b>" -u low -i ~/.config/icons/sun.svg -r 7113
	else
		gammastep &
		notify-send -t 3000 -a "gammastep" "Gammastep" "<b>Nightlight timer is on</b>" -u low -i ~/.config/icons/moon.svg -r 7113
	fi
fi

if pgrep -x "gammastep" > /dev/null; then
	echo ""
	echo "Nightlight timer is on"
else
	echo ""
	echo "Nightlight is off"
fi
