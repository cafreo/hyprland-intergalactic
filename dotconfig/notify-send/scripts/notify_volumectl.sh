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
volume="$(pactl list sinks | grep -A 7 "$(pactl info | grep 'Default Sink' | cut -d' ' -f 3)" | grep Volume | awk '{print $5}' | sed 's/%//')"
mute="$(pactl list sinks | grep -A 7 "$(pactl info | grep 'Default Sink' | cut -d' ' -f 3)" | grep Mute | awk '{print $2}')"

if [[ $volume -eq 0 || "$mute" == "yes" ]]; then  
# Show the sound muted notification  
notify-send -t 1000 -a "volumectl" "Volume muted" -u low -i ~/.config/icons/mute.svg -r 2215

elif [[ $volume -le 25 && $volume -gt 0 ]]; then  
# Show the volume notification  
notify-send -t 1000 -a "volumectl" "Volume: $volume%" -u low -i ~/.config/icons/volume_low.svg -h int:value:"$volume" -r 2215

elif [[ $volume -lt 75 && $volume -gt 25 ]]; then  
# Show the volume notification  
notify-send -t 1000 -a "volumectl" "Volume: $volume%" -u low -i ~/.config/icons/volume_medium.svg -h int:value:"$volume" -r 2215

elif [[ $volume -ge 75% ]]; then  
# Show the volume notification  
notify-send -t 1000 -a "volumectl" "Volume: $volume%" -u low -i ~/.config/icons/volume_high.svg -h int:value:"$volume" -r 2215

else  
# Show the volume notification  
notify-send -t 1000 -a "volumectl" "Volume: $volume%" -u low -i ~/.config/icons/volume_high.svg -h int:value:"$volume" -r 2215

fi
 
