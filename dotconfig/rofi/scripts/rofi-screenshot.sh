#!/bin/bash

export GRIMBLAST_EDITOR="/usr/bin/satty --early-exit --copy-command wl-copy --output-filename /home/$USER/Pictures/Screenshots/Screenshot_$(date '+%d-%m-%Y_%H-%M-%S').png -f"

areaCopy='areaCopy\0icon\x1f~/.config/icons/ssAreaCopy.svg'
areaSave='areaSave\0icon\x1f~/.config/icons/ssAreaSave.svg'
screenSave='screenSave\0icon\x1f~/.config/icons/ssScreen.svg'
windowSave='windowSave\0icon\x1f~/.config/icons/ssWindow.svg'


chosen=$(printf "$areaCopy;$areaSave;$screenSave;$windowSave" | rofi -dmenu -p 'screenshot' -sep ';' -show-icons -theme ~/.config/rofi/modes/buttons.rasi )

case "$chosen" in
    "areaCopy")
        grimblast --notify copy area ;;
    "areaSave")
        grimblast --notify edit area ;; #copysave area ~/Pictures/Screenshots/Screenshot_$(date '+%d-%m-%Y_%H-%M-%S').png ;;
    "screenSave")
        grimblast --notify --wait 1 edit output ;; #copysave output ~/Pictures/Screenshots/Screenshot_$(date '+%d-%m-%Y_%H-%M-%S').png ;;
    "windowSave")
        grimblast --notify --wait 3 edit active ;; #copysave active ~/Pictures/Screenshots/Screenshot_$(date '+%d-%m-%Y_%H-%M-%S').png ;;
        
        *) exit 1 ;;
esac
