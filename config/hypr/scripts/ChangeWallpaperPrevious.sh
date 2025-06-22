#!/bin/bash

WALL_DIR="$HOME/.config/swww/wallpapers/"
CURRENT="$HOME/.cache/swww/current_wallpaper"
TRANSITION="grow"
DURATION="0.8"
FPS="60"

# List wallpapers
mapfile -t WALLS < <(find "$WALL_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | sort)

# Get current index
INDEX=0
if [[ -f "$CURRENT" ]]; then
    CURRENT_FILE=$(cat "$CURRENT")
    for i in "${!WALLS[@]}"; do
        if [[ "${WALLS[$i]}" == "$CURRENT_FILE" ]]; then
            INDEX=$i
            break
        fi
    done
fi

# Next index
INDEX=$(( (INDEX - 1 + ${#WALLS[@]}) % ${#WALLS[@]} ))

# Set wallpaper
echo "${WALLS[$INDEX]}" > "$CURRENT"
swww img "${WALLS[$INDEX]}" --transition-type "$TRANSITION" --transition-duration "$DURATION" --transition-fps "$FPS"
