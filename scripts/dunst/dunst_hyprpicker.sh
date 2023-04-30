#!/bin/bash

hyprpicker -f hex -a

wait

value=$(wl-paste)
img=/home/cafreo/.cache/u-hyprpicker/img.png

convert -size 64x64 xc:"$value" $img

dunstify -t 6000 -a "hyprpicker" -b "HEX color copied" "<b>$value</b>" -u low -i "$img"