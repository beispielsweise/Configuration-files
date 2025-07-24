#!/bin/bash

# Get current brightness as an integer percentage
get_brightness() {
  brightnessctl | grep -oP '\(\K[0-9]+(?=%\))'
}

# Clamp value between 1 and 100
clamp() {
  local val=$1
  if [ "$val" -lt 1 ]; then echo 1
  elif [ "$val" -gt 100 ]; then echo 100
  else echo "$val"
  fi
}

case "$1" in
  --inc)
    curr=$(get_brightness)
    next=$(clamp $((curr + 5)))
    brightnessctl set "${next}%"
    ;;
  --dec)
    curr=$(get_brightness)
    next=$(clamp $((curr - 5)))
    brightnessctl set "${next}%"
    ;;
  *)
    echo "Usage: $0 --inc | --dec"
    exit 1
    ;;
esac
