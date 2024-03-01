#!/bin/bash

cache=$(echo ~/.cache/notify-send)

mkdir -p $cache

hyprpicker -f hex -a &&

value=$(wl-paste)
img="$cache/hyprpicker.png"

touch $img

if [[ $value =~ ^#.* ]]; then
    convert -size 64x64 xc:"$value" $img
    notify-send -t 3000 -a "hyprpicker" "HEX color copied" "<b>$value</b>" -u low -i "$img"

    else
    exit
fi
