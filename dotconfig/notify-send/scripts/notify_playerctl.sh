#!/bin/sh

if ! command -v notify-send &> /dev/null; then
    echo "error: notify-send (libnotify) is not installed."
    exit 1
fi

if ! command -v playerctl &> /dev/null; then
    echo "error: playerctl is not installed."
    exit 1
fi

cache=~/.cache/notify-send

if [ ! -d $cache ]; then
    mkdir -p $cache
fi

csTitle=$(playerctl metadata title)
csArtist=$(playerctl metadata artist)
csCoverUrl=$(playerctl metadata mpris:artUrl)
csCover=$cache/csCover.jpg
csStatus=$(playerctl status)

magick "$csCoverUrl" -define jpeg:size=80x80 -thumbnail 80x80 "$csCover" &&

if [ $csStatus == "Playing" ]; then
    notify-send -t 3000 -a "playerctl" "  Now Playing" "<b>$csTitle</b>\n$csArtist" -u low -i "$csCover" -r 4533
elif [ $csStatus == "Paused" ]; then
    notify-send -t 3000 -a "playerctl" "  Paused" "<b>$csTitle</b>\n$csArtist" -u low -i "$csCover" -r 4533
else
    notify-send -t 3000 -a "playerctl" "  Nothing Playing" "<b>No player has been found</b>" -u low -i "" -r 4533
fi
