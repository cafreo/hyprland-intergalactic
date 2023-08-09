#!/bin/bash

if [[ $1 = "toggle" ]]; then
	if pgrep -x "gammastep" > /dev/null; then
		kill $(pgrep -x gammastep)
		echo "Nightlight is off"
		dunstify -t 3000 -a "gammastep" -b "Gammastep" "<b>Nightlight is off</b>" -u low -i ~/Scripts/img/sun.svg -r 7113
	else
		gammastep &
		dunstify -t 3000 -a "gammastep" -b "Gammastep" "<b>Nightlight timer is on</b>" -u low -i ~/Scripts/img/moon.svg -r 7113
	fi
fi

if pgrep -x "gammastep" > /dev/null; then
	echo ""
	echo "Nightlight timer is on"
else
	echo ""
	echo "Nightlight is off"
fi
