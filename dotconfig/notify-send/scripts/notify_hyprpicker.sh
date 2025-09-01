#!/bin/bash

cache=$(echo ~/.cache/notify-send)

mkdir -p $cache

hyprpicker -f hex -a &&

value=$(wl-paste)
img="$cache/hyprpicker.jpg"

touch $img

if [[ $value =~ ^#.* ]]; then
    magick -define jpeg:size=80x80 xc:"$value" -resize 80x $img &&
    notify-send -t 3000 -a "hyprpicker" "HEX color copied" "<b>$value</b>" -u low -i "$img"
else
    exit
fi
