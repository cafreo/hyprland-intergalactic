#!/bin/bash

areaCopy='areaCopy\0icon\x1f~/Scripts/img/ssAreaCopy.svg'
areaSave='areaSave\0icon\x1f~/Scripts/img/ssAreaSave.svg'
screenSave='screenSave\0icon\x1f~/Scripts/img/ssScreen.svg'
windowSave='windowSave\0icon\x1f~/Scripts/img/ssWindow.svg'


chosen=$(printf "$areaCopy;$areaSave;$screenSave;$windowSave" | rofi -dmenu -p 'Screenshot' -sep ';' -show-icons -theme ~/.config/rofi/config-buttons.rasi )

case "$chosen" in
    "areaCopy")
        grimblast --notify copy area ;;
    "areaSave")
        grimblast --notify copysave area ~/Pictures/Screenshots/Screenshot_$(date '+%d-%m-%Y_%H-%M-%S').png ;;
    "screenSave")
        sleep 0.5 && grimblast --notify copysave output ~/Pictures/Screenshots/Screenshot_$(date '+%d-%m-%Y_%H-%M-%S').png ;;
    "windowSave")
        sleep 2.5 && grimblast --notify copysave active ~/Pictures/Screenshots/Screenshot_$(date '+%d-%m-%Y_%H-%M-%S').png ;;
        
        *) exit 1 ;;
esac