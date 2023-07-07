#!/bin/bash

# mute microphone
pactl set-source-mute @DEFAULT_SOURCE@ 1

# start mullvad
mullvad disconnect
mullvad relay set hostname ch-zrh-wg-00$(echo $(( $RANDOM % 5 + 1 )))
mullvad connect
sleep 6
dunstify -t 3000 -a "mlvd" -b "Mullvad" "<b>$(mullvad status)</b>" -u low -i ~/Scripts/img/wifi.svg