#!/bin/bash

# Screenshot output directory
DIR="${HOME}/Pictures/Screenshots"
mkdir -p "$DIR"

# Notification icon
ICON="camera-photo"  # or use a path like "$HOME/.icons/screenshot.png"

# Timestamped filename
TIME=$(date "+%Y-%m-%d_%H-%M-%S")
FILE="${DIR}/screenshot_${TIME}.png"

SLEEP_THRESHOLD="0.5"

# Notify helpers
notify_success() {
  notify-send -t 1000 -u normal -i "$ICON" "Screenshot" "Saved to ~/Pictures/Screenshots"
}

notify_failure() {
  notify-send -t 1000 -u critical -i dialog-error "Screenshot Error" "$1"
}

~/.config/yad/prompts/ScreenshotPrompt.sh
case $? in
  1)  # Fullscreen
    sleep "$SLEEP_THRESHOLD"
    grim "$FILE" && wl-copy < "$FILE" && notify_success || notify_failure "Fullscreen capture failed"
    ;;
  2)  # Active window
    sleep "$SLEEP_THRESHOLD"
    GEOM=$(hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
    if [[ -n "$GEOM" ]]; then
      grim -g "$GEOM" "$FILE" && wl-copy < "$FILE" && notify_success || notify_failure "Active window capture failed"
    els
      notify_failure "Failed to get active window geometry"
    fi
    ;;
  3)  # Area select
    sleep "$SLEEP_THRESHOLD"
    grim -g "$(slurp)" "$FILE" && wl-copy < "$FILE" && notify_success || notify_failure "Area selection failed"
    ;;
  4|*)  # Close or cancel
    exit 0
    ;;
esac
