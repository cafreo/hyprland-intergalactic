#!/bin/sh

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export DISPLAY=:0

wait_minutes=45
wait_seconds=$((wait_minutes * 60))

while true; do
    sleep "$wait_seconds"
    notify-send -a "break" "break reminder" "reminder to take a break, stand up and get hydrated" -u critical -i ~/.config/icons/break.svg
done
