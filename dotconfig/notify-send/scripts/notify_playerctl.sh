#!/bin/bash

cache=$(echo ~/.cache/notify-send)

if [ ! -d ~/.cache/notify-send ]; then
    mkdir -p $cache
fi

sleep 0.2
msgTag="playerctl"
csTitle=$(playerctl metadata title)
csArtist=$(playerctl metadata artist)
csCoverUrl=$(playerctl metadata mpris:artUrl)
csCover=$cache/csCover.jpg

magick "$csCoverUrl" -define jpeg:size=80x80 -thumbnail 80x80 "$csCover" &&

if [ $(playerctl status) == "Playing" ]; then
    notify-send -t 3000 -a "playerctl" "  Now Playing" "<b>$csTitle</b>\n$csArtist" -u low -i "$csCover" -r 4533
elif [ $(playerctl status) == "Paused" ]; then
    notify-send -t 3000 -a "playerctl" "  Paused" "<b>$csTitle</b>\n$csArtist" -u low -i "$csCover" -r 4533
else
    notify-send -t 3000 -a "playerctl" "  Nothing Playing" "<b>No player has been found</b>" -u low -i "" -r 4533
fi
