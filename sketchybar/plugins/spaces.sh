#!/usr/bin/env bash

sid=$1

if [ "$SENDER" = "aerospace_workspace_change" ]; then
    if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
        sketchybar --set $NAME background.drawing=on \
                               background.color=$RED
    else
        sketchybar --set $NAME background.drawing=off
    fi
    
    all_workspaces=$(aerospace list-workspaces --all)
    empty_workspaces=$(aerospace list-workspaces --monitor all --empty)
    empty=false
    for empty_sid in $empty_workspaces; do
        if [ "$sid" = "$empty_sid" ] && [ "$sid" != "$FOCUSED_WORKSPACE" ]; then
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
