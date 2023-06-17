#!/bin/bash

mkdir -p ~/.cache/dunst

hyprpicker -f hex -a

wait

value=$(wl-paste)
img=~/.cache/dunst/hyprpicker.png

convert -size 64x64 xc:"$value" $img

dunstify -t 6000 -a "hyprpicker" -b "HEX color copied" "<b>$value</b>" -u low -i "$img"