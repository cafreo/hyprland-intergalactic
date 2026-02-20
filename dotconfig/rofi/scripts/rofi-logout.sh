#!/bin/bash

lock='lock\0icon\x1f~/.config/icons/loLock.svg'
logout='logout\0icon\x1f~/.config/icons/loLogout.svg'
shutdown='shutdown\0icon\x1f~/.config/icons/loShutdown.svg'
suspend='suspend\0icon\x1f~/.config/icons/loSuspend.svg'
reboot='reboot\0icon\x1f~/.config/icons/loReboot.svg'
hibernate='hibernate\0icon\x1f~/.config/icons/loHibernate.svg'

chosen=$(printf "$lock;$logout;$shutdown;$suspend;$reboot;$hibernate;" | rofi -dmenu -p 'logout' -sep ';' -show-icons -theme ~/.config/rofi/modes/buttons.rasi -theme-str 'listview {columns: 3; lines: 2;}' -theme-str 'window {width: 600px;}' -theme-str 'element-icon {size: 128px;}' )

case "$chosen" in
    "lock")
        hyprlock;;
	"logout")
        hyprctl dispatch exit 0;;
    "shutdown")
        systemctl poweroff;;
    "suspend")
        systemctl suspend;;
    "reboot")
        systemctl reboot;;
    "hibernate")
        systemctl hibernate;;
esac
