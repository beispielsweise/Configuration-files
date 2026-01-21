#!/bin/bash

STEP=1
MAX=10

get_current_passes() {
    hyprctl getoption decoration:blur:passes 2>/dev/null | grep 'int: ' | awk '{print $2}'
}

case "$1" in
  --inc)
    current=$(get_current_passes)
    new=$((current + STEP))
    [ "$new" -gt "$MAX" ] && new=$MAX
    hyprctl keyword decoration:blur:passes "$new"
    ;;

  --dec)
    current=$(get_current_passes)
    new=$((current - STEP))
    [ "$new" -lt 0 ] && new=0
    hyprctl keyword decoration:blur:passes "$new"
    ;;

  --reset)
    hyprctl keyword decoration:blur:passes 0
    ;;

  *)
    echo "Usage:"
    echo "  $0 --inc"
    echo "  $0 --dec"
    echo "  $0 --reset"
    exit 1
    ;;
esac
