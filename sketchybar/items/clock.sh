#!/usr/bin/env bash

sketchybar --add item clock right \
           --subscribe clock system_woke \
           --set clock \
                 script="$CONFIG_DIR/plugins/clock.sh" \
                 label.color=$TEXT \
                 update_freq=1
