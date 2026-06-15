#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

battery_info="$(pmset -g batt)"
percentage=$(echo "$battery_info" | grep -Eo "\d+%" | cut -d% -f1)
charging=$(echo "$battery_info" | grep 'AC Power')

if [ $percentage = "" ]; then
    exit 0
fi

color=$TEXT
case ${percentage} in
    100) icon=""
    ;;
    [8-9][0-9]) icon=""
    ;;
    [5-7][0-9]) icon=""
    ;;
    [3-4][0-9]) icon=""
    ;;
    [1-2][0-9]) icon=""; color=$YELLOW
    ;;
    *) icon=""; color=$RED
esac

if [[ $charging != "" ]]; then
    color=$GREEN
fi

sketchybar --set battery label="$icon" label.color=$color
