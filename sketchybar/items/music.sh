#!/usr/bin/env bash

ALBUM_HEIGHT=150

sketchybar --add item music right \
           --set music \
                 script="$CONFIG_DIR/plugins/music.sh" \
                 update_freq=1 \
                 popup.align=right \
                 popup.y_offset=$((PADDING * 2)) \
                 popup.height=$((ALBUM_HEIGHT / 4 + PADDING / 4)) \
                 popup.background.drawing=on \

sketchybar --add item music.title popup.music \
           --set music.title \
                 background.drawing=off \
                 label.padding_left=$((ALBUM_HEIGHT + PADDING)) \
           --add item music.album popup.music \
           --set music.album \
                 background.drawing=off \
                 label.padding_left=$((ALBUM_HEIGHT + PADDING)) \
           --add item music.artist popup.music \
           --set music.artist \
                 background.drawing=off \
                 label.padding_left=$((ALBUM_HEIGHT + PADDING)) \
           --add item music.status popup.music \
           --set music.status \
                 background.drawing=off \
                 label.padding_left=$((ALBUM_HEIGHT + PADDING)) \
                 label.font.size=12

source "$CONFIG_DIR/plugins/music.sh"
