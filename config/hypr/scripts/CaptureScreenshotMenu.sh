#!/bin/bash

# Screenshot output directory
DIR="${HOME}/Pictures/Screenshots"
mkdir -p "$DIR"

# Notification icon
ICON="camera-photo"  # or use a path like "$HOME/.icons/screenshot.png"

# Timestamped filename
TIME=$(date "+%Y-%m-%d_%H-%M-%S")
FILE="${DIR}/screenshot_${TIME}.png"

# Show YAD horizontal button menu
yad --title="Screenshot Mode" --center --on-top --no-wrap --borders=20 \
  --text="<span font='14'>Choose screenshot mode:\n</span>" \
  --button="󰍹  Fullscreen":1 \
  --button="  Active Window":2 \
  --button="󱂬  Area Select":3 
choice=$?

# Notify helpers
notify_success() {
  notify-send -t 3000 -u normal -i "$ICON" "Screenshot" "Saved to ~/Pictures/Screenshots"
}

notify_failure() {
  notify-send -t 3000 -u critical -i dialog-error "Screenshot Error" "$1"
}

# Logic based on button pressed
case "$choice" in
  1)  # Fullscreen
    sleep 0.1
    grim "$FILE" && wl-copy < "$FILE" && notify_success || notify_failure "Fullscreen capture failed"
    ;;
  2)  # Active window
    sleep 0.1
    GEOM=$(hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
    if [[ -n "$GEOM" ]]; then
      grim -g "$GEOM" "$FILE" && wl-copy < "$FILE" && notify_success || notify_failure "Active window capture failed"
    els
      notify_failure "Failed to get active window geometry"
    fi
    ;;
  3)  # Area select
    sleep 0.1
    grim -g "$(slurp)" "$FILE" && wl-copy < "$FILE" && notify_success || notify_failure "Area selection failed"
    ;;
  4|*)  # Close or cancel
    exit 0
    ;;
esac
