#! /bin/sh

sex="aap\0icon\x1f/home/cafreo/Pictures/Icons/Material Icons/round_circle_white_48dp.png"
xes="xes"

chosen=$(echo -en "$sex\n$xes\nssScreenSave\nssWindowSave" | rofi -dmenu -theme /home/cafreo/.config/rofi/config-buttons.rasi)

case "$chosen" in
	"$sex") echo "1" ;;
	"$xes") echo "2" ;;
	"ssScreenSave") echo "3" ;;
	"ssWindowSave") echo "4" ;;
	*) exit 1 ;;
esac