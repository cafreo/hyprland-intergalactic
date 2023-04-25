#!/bin/bash

hyprpicker -f hex -a

wait

value=$(wl-paste)
img=/home/cafreo/.cache/u-hyprpicker/img.png

convert -size 80x80 xc:"$value" $img

dunstify -t 6000 -a "hyprpicker" -b "HEX color copied" "$value" -u low -i "$img"