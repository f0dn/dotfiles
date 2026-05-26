#!/usr/bin/env bash

sketchybar --add event aerospace_mode_change \
           --add item mode left \
           --subscribe mode aerospace_mode_change \
           --set mode \
                 script="$CONFIG_DIR/plugins/mode.sh" \
                 label.color=$BLUE \
           --trigger aerospace_mode_change
