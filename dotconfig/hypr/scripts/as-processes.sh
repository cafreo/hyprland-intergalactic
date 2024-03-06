#!/bin/bash

# wait for the script to start
sleep 2

# mute microphone
pactl set-source-mute @DEFAULT_SOURCE@ 1

# set default output to speakers
pactl set-sink-port 0 analog-output-lineout

# start mullvad
mullvad disconnect
mullvad dns set default --block-ads --block-trackers --block-malware
mullvad relay set hostname ch-zrh-wg-00$(echo $(( $RANDOM % 4 + 1 )))
#mullvad relay set hostname no-osl-wg-00$(echo $(( $RANDOM % 6 + 1 )))
mullvad connect
sleep 2
dunstify -t 3000 -a "mlvd" -b "Mullvad" "<b>$(mullvad status)</b>" -u low -i ~/.config/icons/wifi.svg
