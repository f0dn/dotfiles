#!/usr/bin/env bash

sketchybar --add item music right \
           --set music \
                 script="$CONFIG_DIR/plugins/music.sh" \
                 label.color=$TEXT \
                 update_freq=5
