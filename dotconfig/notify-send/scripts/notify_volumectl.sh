#!/bin/sh

if ! command -v notify-send &> /dev/null; then
    echo "error: notify-send (libnotify) is not installed."
    exit 1
fi

if ! command -v pactl &> /dev/null; then
    echo "error: pactl (pulseaudio) is not installed."
    exit 1
fi

if [ $# -ne 2 ]; then
    echo "usage: {speakers|mic} {toggle|volume}"
    exit 1
fi

SINK=$(pactl get-default-sink)
SOURCE=$(pactl get-default-source)

case "$1" in
    "speakers")
        case "$2" in
            "toggle")
                pactl set-sink-mute "$SINK" toggle
                ;;
            *)
                pactl set-sink-volume "$SINK" $2
                ;;
        esac

        SINK_VOLUME="$(pactl get-sink-volume "$SINK" | grep -oP '[0-9]+%' | head -1 | sed 's/%//g')"
        SINK_MUTED="$(pactl get-sink-mute "$SINK" | grep -q "yes" && echo "true" || echo "false")"

        if [[ $SINK_VOLUME -eq 0 || "$SINK_MUTED" == "true" ]]; then    
            notify-send -t 1000 -a "volumectl" "Volume muted" -u low -i ~/.config/icons/voSpeakerMute.svg -r 2215
        elif [[ $SINK_VOLUME -le 25 && $SINK_VOLUME -gt 0 ]]; then  
            notify-send -t 1000 -a "volumectl" "Volume: $SINK_VOLUME%" -u low -i ~/.config/icons/voSpeakerLow.svg -h int:value:"$SINK_VOLUME" -r 2215
        elif [[ $SINK_VOLUME -lt 75 && $SINK_VOLUME -gt 25 ]]; then  
            notify-send -t 1000 -a "volumectl" "Volume: $SINK_VOLUME%" -u low -i ~/.config/icons/voSpeakerMedium.svg -h int:value:"$SINK_VOLUME" -r 2215
        elif [[ $SINK_VOLUME -ge 75 ]]; then  
            notify-send -t 1000 -a "volumectl" "Volume: $SINK_VOLUME%" -u low -i ~/.config/icons/voSpeakerHigh.svg -h int:value:"$SINK_VOLUME" -r 2215
        else
            notify-send -t 1000 -a "volumectl" "Volume: $SINK_VOLUME%" -u low -i ~/.config/icons/voSpeakerHigh.svg -h int:value:"$SINK_VOLUME" -r 2215
        fi

        ;;

    "mic")
        case "$2" in
            "toggle")
                # Toggle mute status of the microphone
                pactl set-source-mute "$SOURCE" toggle
                ;;
            *)
                pactl set-source-volume "$SOURCE" $2
                ;;
        esac

        SOURCE_VOLUME="$(pactl get-source-volume "$SOURCE" | grep -oP '[0-9]+%' | head -1 | sed 's/%//g')"
        SOURCE_MUTED="$(pactl get-source-mute "$SOURCE" | grep -q "yes" && echo "true" || echo "false")"

        if [[ $SOURCE_VOLUME -eq 0 || "$SOURCE_MUTED" == "true" ]]; then    
            notify-send -t 1000 -a "volumectl" "Volume muted" -u low -i ~/.config/icons/voMicMute.svg -r 2215
        else
            notify-send -t 1000 -a "volumectl" "Volume: $SOURCE_VOLUME%" -u low -i ~/.config/icons/voMic.svg -h int:value:"$SOURCE_VOLUME" -r 2215
        fi

        ;;

    *)
        echo "usage: {speakers|mic} {toggle|volume}"
        exit 1
        ;;
esac
