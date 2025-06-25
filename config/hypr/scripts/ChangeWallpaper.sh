#!/bin/bash

WALL_DIR="$HOME/.config/swww/wallpapers/"
CURRENT="$HOME/.cache/swww/current_wallpaper"
TRANSITION="grow"
DURATION="0.8"
FPS="60"

mapfile -t WALLS < <(find "$WALL_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | sort)

if [[ ${#WALLS[@]} -eq 0 ]]; then
    echo "No wallpapers found in $WALL_DIR"
    exit 1
fi

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

case "$1" in
  --next)
    INDEX=$(( (INDEX + 1) % ${#WALLS[@]} ))
    ;;
  --prev)
    INDEX=$(( (INDEX - 1 + ${#WALLS[@]}) % ${#WALLS[@]} ))
    ;;
  *)
    echo "Usage: $0 --next | --prev"
    exit 1
    ;;
esac

echo "${WALLS[$INDEX]}" > "$CURRENT"
swww img "${WALLS[$INDEX]}" --transition-type "$TRANSITION" --transition-duration "$DURATION" --transition-fps "$FPS"
