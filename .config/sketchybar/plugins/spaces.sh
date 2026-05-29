#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

sid=$1
focused=$(aerospace list-workspaces --focused)

if [ "$SENDER" = "aerospace_workspace_change" ]; then
    if [ "$sid" = "$focused" ]; then
        sketchybar --set $NAME label.highlight=on
    else
        sketchybar --set $NAME label.highlight=off
    fi
    
    all_workspaces=$(aerospace list-workspaces --all)
    empty_workspaces=$(aerospace list-workspaces --monitor all --empty)
    empty=false
    for empty_sid in $empty_workspaces; do
        if [ "$sid" = "$empty_sid" ] && [ "$sid" != "$focused" ]; then
            empty=true
            break
        fi
    done
    
    if [ "$empty" = true ]; then
        sketchybar --set $NAME drawing=off
    else
        sketchybar --set $NAME drawing=on
    fi
fi
