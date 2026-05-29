#!/usr/bin/env bash

sketchybar --add item clock right \
           --subscribe clock system_woke \
           --set clock \
                 script="$CONFIG_DIR/plugins/clock.sh" \
                 update_freq=1

source "$CONFIG_DIR/plugins/clock.sh"
