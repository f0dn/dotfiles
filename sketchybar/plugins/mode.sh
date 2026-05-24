#!/usr/bin/env bash

if [ "$CURRENT_MODE" != "main" ]; then
    sketchybar --set mode label="$CURRENT_MODE" \
                          drawing=on
else
    sketchybar --set mode label="" \
                          drawing=off
fi
