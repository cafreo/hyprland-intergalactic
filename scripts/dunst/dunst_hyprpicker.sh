#!/bin/bash

mkdir -p ~/.cache/dunst

hyprpicker -f hex -a &&

value=$(wl-paste)
img=~/.cache/dunst/hyprpicker.png

if [[ $value =~ ^#.* ]]; then
    convert -size 64x64 xc:"$value" $img
    dunstify -t 3000 -a "hyprpicker" -b "HEX color copied" "<b>$value</b>" -u low -i "$img"

    else
    exit
fi
