#!/usr/bin/env bash

BAR_LENGTH=30

source "$CONFIG_DIR/settings.sh"

info=$(media-control get --now)
title=$(echo $info | jq -r .title | head -c 40)
album=$(echo $info | jq -r .album | head -c 40)
artist=$(echo $info | jq -r .artist | head -c 40)
playing=$(echo $info | jq -r .playing)
elapsed=$(echo $info | jq -r .elapsedTimeNow | cut -d '.' -f1)
total=$(echo $info | jq -r .duration | cut -d '.' -f1)
echo $info | jq -r .artworkData | base64 -d > $ARTWORK_FILE

drawing=on
if [ "$title" == "" ] || [ "$title" == "null" ] || [ "$playing" == "false" ]; then
    drawing=off
fi

function repeat() {
    local str=$1
    local num=$2
    printf "%0.s$str" $(seq 0 $num) | sed 's/.$//'
}

function format_time() {
    local time=$1
    local minutes=$((time / 60))
    local seconds=$((time % 60))
    printf "%d:%02d" $minutes $seconds
}

progress=$((elapsed * BAR_LENGTH / total))
equals=$(repeat "=" $progress)
spaces=$(repeat " " $((BAR_LENGTH - progress)))
bar="[$equals$spaces] $(format_time $elapsed) / $(format_time $total)"

sketchybar --set music label="$title" drawing="$drawing" \
           --set music popup.background.image=$ARTWORK_FILE \
           --set music.title label="$title" \
           --set music.artist label="$artist" \
           --set music.album label="$album" \
           --set music.status label="$bar" \
