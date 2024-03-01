#!/bin/bash
# changeVolume
 
# Arbitrary but unique message tag
msgTag="volumectl"
 
if [[ "$@" == "toggle" ]]; then
    pactl set-sink-mute 0 "$@" > /dev/null
else
    pactl set-sink-volume 0 "$@" > /dev/null
fi
 
 
# Query amixer for the current volume and whether or not the speaker is muted
volume="$(pactl list sinks | grep -A 7 "$(pactl info | grep 'Default Sink' | cut -d' ' -f 3)" | grep Volume | awk '{print $5}')"
mute="$(pactl list sinks | grep -A 7 "$(pactl info | grep 'Default Sink' | cut -d' ' -f 3)" | grep Mute | awk '{print $2}')"
if [[ $volume == 0 || "$mute" == "yes" ]]; then
    # Show the sound muted notification
    notify-send -t 1000 -a "volumectl" "Volume muted" -u low -i ~/.config/icons/mute.svg -h string:x-dunst-stack-tag:$msgTag "0" 

elif [[ $volume < 75 && $volume > 25 ]]; then
 Show the volume notification
    notify-send -t 1000 -a "volumectl" "Volume: $volume" -u low -i ~/.config/icons/volume_high.svg -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume"

elif [[ $volume < 25 && $volume > 0 ]]; then
 Show the volume notification
    notify-send -t 1000 -a "volumectl" "Volume: $volume" -u low -i ~/.config/icons/volume_high.svg -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume"

elif [[ $volume > 75 ]]; then
    # Show the volume notification
    notify-send -t 1000 -a "volumectl" "Volume: $volume" -u low -i ~/.config/icons/volume_high.svg -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume"

else
    # Show the volume notification
    notify-send -t 1000 -a "volumectl" "Volume: $volume" -u low -i ~/.config/icons/volume_high.svg -h string:x-dunst-stack-tag:$msgTag -h int:value:"$volume"
fi
 
 
