#!/usr/bin/env bash

sketchybar --add item battery right \
           --subscribe battery power_source_change system_woke \
           --set battery \
                 script="$CONFIG_DIR/plugins/battery.sh" \
                 label.font.size=25 \
                 padding_left=0 \
                 padding_right=0 \
                 background.drawing=off \
                 background.border_color=0x00000000 \
                 background.border_width=0 \
                 update_freq=120

source "$CONFIG_DIR/plugins/battery.sh"
