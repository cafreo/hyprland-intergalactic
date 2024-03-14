#!/bin/bash

CURRENT_PROFILE=$(pactl list sinks | grep "Active Port:" | cut -d ' ' -f 3-)

if [ "$CURRENT_PROFILE" = "analog-output-lineout" ]; then
        pactl set-sink-port 0 "analog-output-headphones"
        notify-send -a "audio-output-switch" "audio output" "<b>switched to headphone output</b>" -u low -i ~/.config/icons/headphones.svg -r 1215
else 
        pactl set-sink-port 0 "analog-output-lineout"
        notify-send -a "audio-output-switch" "audio output" "<b>switched to speaker output</b>" -u low -i ~/.config/icons/speaker.svg -r 1215
fi

