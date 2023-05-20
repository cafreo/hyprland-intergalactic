#!/bin/bash

msgTag="playerctl"
csTitle=$(playerctl metadata title)
csArtist=$(playerctl metadata artist)
csCoverUrl=$(playerctl metadata mpris:artUrl)
csCover=/home/$(whoami)/.cache/u-playerctl/csCover
csCoverImg=$(convert "$csCoverUrl" -flatten -thumbnail 80x80 $csCover)

convert "$csCoverUrl" -flatten -thumbnail 80x80 $csCover

if [ $(playerctl status) == "Playing" ]
then
    dunstify -t 3000 -a "playerctl" -b "  Now Playing" "<b>$csTitle</b>\n$csArtist" -u low -i "$csCover" -h string:x-dunst-stack-tag:$msgTag
else
    dunstify -t 3000 -a "playerctl" -b "  Paused" "<b>$csTitle</b>\n$csArtist" -u low -i "$csCover" -h string:x-dunst-stack-tag:$msgTag
fi