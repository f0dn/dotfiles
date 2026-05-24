#!/usr/bin/env bash

sketchybar --add event aerospace_mode_change \
           --add item mode left \
           --subscribe mode aerospace_mode_change \
           --set mode \
                 script="$CONFIG_DIR/plugins/mode.sh" \
                 label.color=$RED \
           --trigger aerospace_mode_change CURRENT_MODE=$(aerospace list-modes --current)
