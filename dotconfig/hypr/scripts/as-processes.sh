#!/bin/bash

# wait for the script to start
sleep 2

# mute microphone
pactl set-source-mute @DEFAULT_SOURCE@ 1
# set default output to speakers
pactl set-sink-port 0 analog-output-lineout

sleep 2

# start mullvad
mullvad disconnect
mullvad dns set default --block-ads --block-trackers --block-malware
mullvad relay set location ch-zrh-wg-00$(echo $(( $RANDOM % 4 + 1 )))
#mullvad relay set location no-osl-wg-00$(echo $(( $RANDOM % 6 + 1 )))
#mullvad relay set location de-dus-wg-00$(echo $(( $RANDOM % 2 + 1 )))mullvad connect
mullvad connect
sleep 2
notify-send -t 3000 -a "mlvd" "Mullvad" "<b>$(mullvad status)</b>" -u low -i ~/.config/icons/wifi.svg
