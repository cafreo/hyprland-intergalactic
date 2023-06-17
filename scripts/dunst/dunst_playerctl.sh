#!/bin/bash

mkdir -p ~/.cache/dunst

msgTag="playerctl"
csTitle=$(playerctl metadata title)
csArtist=$(playerctl metadata artist)
csCoverUrl=$(playerctl metadata mpris:artUrl)
csCover=~/.cache/dunst/csCover
csCoverImg=$(convert "$csCoverUrl" -flatten -thumbnail 160x160 $csCover)

convert "$csCoverUrl" -flatten -thumbnail 160x160 $csCover

wait

dunstify -C 4533

if [ $(playerctl status) == "Playing" ]
then
    dunstify -t 3000 -a "playerctl" -b "  Now Playing" "<b>$csTitle</b>\n$csArtist" -u low -i "$csCover" -r 4533
else
    dunstify -t 3000 -a "playerctl" -b "  Paused" "<b>$csTitle</b>\n$csArtist" -u low -i "$csCover" -r 4533
fi

#-h string:x-dunst-stack-tag:$msgTag