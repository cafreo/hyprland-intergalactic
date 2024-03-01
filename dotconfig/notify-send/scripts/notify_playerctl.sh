#!/bin/bash

cache=$(echo ~/.cache/notify-send)

mkdir -p $cache

msgTag="playerctl"
csTitle=$(playerctl metadata title)
csArtist=$(playerctl metadata artist)
csCoverUrl=$(playerctl metadata mpris:artUrl)
csCover=$cache/csCover
csCoverImg=$(convert "$csCoverUrl" -flatten -thumbnail 160x160 $csCover)

convert "$csCoverUrl" -flatten -thumbnail 160x160 $csCover

wait

notify-send -C 4533

if [ $(playerctl status) == "Playing" ]
then
    notify-send -t 3000 -a "playerctl" "  Now Playing" "<b>$csTitle</b>\n$csArtist" -u low -i "$csCover" -r 4533
else
    notify-send -t 3000 -a "playerctl" "  Paused" "<b>$csTitle</b>\n$csArtist" -u low -i "$csCover" -r 4533
fi

#-h string:x-dunst-stack-tag:$msgTag
