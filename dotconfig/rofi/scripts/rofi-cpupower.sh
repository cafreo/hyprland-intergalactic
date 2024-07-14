#!/bin/bash

powersave='powersave\0icon\x1f~/.config/icons/cpPowersave.svg'
conservative='conservative\0icon\x1f~/.config/icons/cpConservative.svg'
performance='performance\0icon\x1f~/.config/icons/cpPerformance.svg'

chosen=$(printf "$powersave;$conservative;$performance" | rofi -dmenu -p 'cpupower' -sep ';' -show-icons -theme ~/.config/rofi/modes/buttons.rasi -theme-str 'listview {columns: 3;}' -theme-str 'window {width: 500px;}' )

case "$chosen" in
    "powersave")
        kitty -e --title "cpupower" sudo sh -c 'cpupower frequency-set -g powersave -d 2100MHz -u 3100MHz; cpupower set -b 15;'
		notify-send -t 3000 -a "cpupower" "cpupower" "set power mode to $(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | head -n 1)" -u low -i ~/.config/icons/cpu.svg;;
	"conservative")
        kitty -e --title "cpupower" sudo sh -c 'cpupower frequency-set -g conservative -d 2100MHz -u 4100MHz; cpupower set -b 6'
		notify-send -t 3000 -a "cpupower" "cpupower" "set power mode to $(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | head -n 1)" -u low -i ~/.config/icons/cpu.svg;;
    "performance")
        kitty -e --title "cpupower" sudo sh -c 'cpupower frequency-set -g performance -d 2100MHz -u 5100MHz; cpupower set -b 6'
		notify-send -t 3000 -a "cpupower" "cpupower" "set power mode to $(cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | head -n 1)" -u low -i ~/.config/icons/cpu.svg;;
        *) exit 1 ;;
esac
