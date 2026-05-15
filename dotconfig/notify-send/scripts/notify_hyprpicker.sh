#!/bin/sh

if ! command -v notify-send &> /dev/null; then
    echo "error: notify-send (libnotify) is not installed."
    exit 1
fi

if ! command -v hyprpicker &> /dev/null; then
    echo "error: hyprpicker is not installed."
    exit 1
fi

cache=~/.cache/notify-send
img="$cache/hyprpicker.jpg"

if [ ! -d ~/.cache/notify-send ]; then
    mkdir -p $cache
fi

value=$(hyprpicker -a -f hex)

if [[ $value =~ ^#.* ]]; then
    magick -define jpeg:size=80x80 xc:"$value" -resize 80x $img &&
    notify-send -t 3000 -a "hyprpicker" "HEX color copied" "<b>$value</b>" -u low -i "$img"
else
    exit
fi
