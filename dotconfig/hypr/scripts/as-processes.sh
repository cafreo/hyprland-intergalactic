#!/bin/bash

# wait for the script to start
sleep 12

# mute microphone
pactl set-source-mute @DEFAULT_SOURCE@ 1

# set default output to speakers
pactl set-sink-port 0 analog-output-lineout

# start mullvad
mullvad disconnect
mullvad relay set hostname ch-zrh-wg-00$(echo $(( $RANDOM % 4 + 1 )))
mullvad connect
sleep 6
dunstify -t 3000 -a "mlvd" -b "Mullvad" "<b>$(mullvad status)</b>" -u low -i ~/Scripts/img/wifi.svg
