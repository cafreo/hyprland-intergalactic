#!/bin/bash

cache=~/.cache/notify-send
img="$cache/hyprpicker.jpg"

mkdir -p $cache

value=$(hyprpicker -a -f hex)

if [[ $value =~ ^#.* ]]; then
    magick -define jpeg:size=80x80 xc:"$value" -resize 80x $img &&
    notify-send -t 3000 -a "hyprpicker" "HEX color copied" "<b>$value</b>" -u low -i "$img"
else
    exit
fi
