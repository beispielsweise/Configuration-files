#!/bin/bash
# Screenshot capturing logic

DIR="${HOME}/Pictures/Screenshots"
mkdir -p "$DIR"

ICON="camera-photo"  # or use a path like "$HOME/.icons/screenshot.png"

TIME=$(date "+%Y-%m-%d_%H-%M-%S")
FILE="${DIR}/screenshot_${TIME}.jpg"

SLEEP_THRESHOLD="0.3"

notify_success() {
  notify-send -t 2000 -u normal -i "$ICON" "Screenshot" "Saved to ~/Pictures/Screenshots"
}

notify_failure() {
  notify-send -t 2000 -u critical -i dialog-error "Screenshot Error" "$1"
}

case $1 in
  --fullscreen)  # Fullscreen
    sleep "$SLEEP_THRESHOLD"
    grim "$FILE" && wl-copy < "$FILE" && notify_success || notify_failure "Fullscreen capture failed"
    ;;
  --window)  # Active window
    sleep "$SLEEP_THRESHOLD"
    GEOM=$(hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
    grim -g "$GEOM" "$FILE" && wl-copy < "$FILE" && notify_success || notify_failure "Active window capture failed"
    ;;
  --area)  # Area select
    sleep "$SLEEP_THRESHOLD"
    grim -g "$(slurp)" "$FILE" && wl-copy < "$FILE" && notify_success || notify_failure "Area selection failed"
    ;;
  *)  # Close or cancel
    exit 0
    ;;
esac
