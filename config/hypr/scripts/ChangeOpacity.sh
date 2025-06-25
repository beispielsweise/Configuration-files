#!/bin/bash

STEP="0.05"
MIN="0.0"
MAX="1.0"

get_value() {
    hyprctl getoption "decoration:$1" 2>/dev/null | grep 'float: ' | awk '{print $2}'
}

case "$1" in
  --active-inc)
    val=$(get_value "active_opacity")
    new=$(echo "$val + $STEP" | bc)
    awk -v n="$new" -v max="$MAX" 'BEGIN { if (n <= max) exit 0; exit 1 }' && \
      hyprctl keyword decoration:active_opacity "$new"
    ;;

  --active-dec)
    val=$(get_value "active_opacity")
    new=$(echo "$val - $STEP" | bc)
    awk -v n="$new" -v min="$MIN" 'BEGIN { if (n >= min) exit 0; exit 1 }' && \
      hyprctl keyword decoration:active_opacity "$new"
    ;;

  --active-reset)
    hyprctl keyword decoration:active_opacity "$MAX"
    ;;
    
  --passive-inc)
    val=$(get_value "inactive_opacity")
    new=$(echo "$val + $STEP" | bc)
    awk -v n="$new" -v max="$MAX" 'BEGIN { if (n <= max) exit 0; exit 1 }' && \
      hyprctl keyword decoration:inactive_opacity "$new"
    ;;

  --passive-dec)
    val=$(get_value "inactive_opacity")
    new=$(echo "$val - $STEP" | bc)
    awk -v n="$new" -v min="$MIN" 'BEGIN { if (n >= min) exit 0; exit 1 }' && \
      hyprctl keyword decoration:inactive_opacity "$new"
    ;;

  --passive-reset)
    hyprctl keyword decoration:inactive_opacity "$MAX"
    ;;
  
  *)
    echo "Usage:"
    echo "  $0 --active-inc"
    echo "  $0 --active-dec"
    echo "  $0 --active-reset"

    echo "  $0 --passive-inc"
    echo "  $0 --passive-dec"
    echo "  $0 --passive-reset"
    exit 1
    ;;
esac
