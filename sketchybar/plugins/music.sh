#!/usr/bin/env bash

info=$(media-control get)
title=$(echo $info | jq -r .title)
album=$(echo $info | jq -r .album)
artist=$(echo $info | jq -r .artist)
label=$(echo "$title - $album - $artist" | head -c 30)

sketchybar --set music label="$label"
