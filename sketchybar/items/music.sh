#!/usr/bin/env bash

sketchybar --add item music right \
           --set music \
                 script="$CONFIG_DIR/plugins/music.sh" \
                 update_freq=5
