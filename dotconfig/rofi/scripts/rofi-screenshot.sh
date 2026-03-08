#!/bin/bash

edit="satty -f - --resize smart --copy-command wl-copy --early-exit --output-filename ~/Pictures/Screenshots/Screenshot_$(date '+%d-%m-%Y_%H-%M-%S').png"

areaCopy='areaCopy\0icon\x1f~/.config/icons/ssAreaCopy.svg'
areaSave='areaSave\0icon\x1f~/.config/icons/ssAreaSave.svg'
windowSave='windowSave\0icon\x1f~/.config/icons/ssWindow.svg'
screenSave='screenSave\0icon\x1f~/.config/icons/ssScreen.svg'

chosen=$(printf "$areaCopy;$areaSave;$windowSave;$screenSave" | rofi -dmenu -p 'screenshot' -sep ';' -show-icons -theme ~/.config/rofi/modes/buttons.rasi )

sleep 0.2 && 

case "$chosen" in
    "areaCopy")
        hyprshot -z -m region --clipboard-only ;;
    "areaSave")
        hyprshot -z -m region -raw | $edit ;;
    "windowSave")
        hyprshot -z -m window -raw | $edit ;;
    "screenSave")
        hyprshot -z -m output -raw | $edit ;;
        
        *) exit 1 ;;
esac
