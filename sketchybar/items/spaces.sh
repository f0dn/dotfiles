#!/usr/bin/env bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
               --subscribe space.$sid aerospace_workspace_change \
               --set space.$sid \
                     label="$sid" \
                     script="$CONFIG_DIR/plugins/spaces.sh $sid" \
                     drawing=off \
                     background.drawing=off \
                     label.highlight_color=$RED \
                     padding_left=0 \
                     padding_right=0
done

sketchybar --add bracket spaces '/space\..*/' \
           --trigger aerospace_workspace_change
