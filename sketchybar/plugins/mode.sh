#!/usr/bin/env bash

current_mode=$(aerospace list-modes --current)

if [ "$current_mode" != "main" ]; then
    sketchybar --set mode label="$current_mode" \
                          drawing=on
else
    sketchybar --set mode label="" \
                          drawing=off
fi
