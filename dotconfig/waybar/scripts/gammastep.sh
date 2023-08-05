#!/bin/bash

if [[ $1 = "toggle" ]]; then
	if pgrep -x "gammastep" > /dev/null; then
		kill $(pgrep -x gammastep)
		echo "Nightlight is off"
 
	else
		gammastep &

	fi
fi

if pgrep -x "gammastep" > /dev/null; then
	echo ""
	echo "Nightlight timer is on"

else
	echo ""
	echo "Nightlight is off"
fi
