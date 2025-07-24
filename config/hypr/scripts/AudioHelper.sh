#!/bin/bash

get_volume() {
  wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f", $2 * 100}'
}

case "$1" in
  --toggle)
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    ;;
  --max)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%
    ;;
  --inc)
    vol=$(get_volume)
    if [ "$vol" -lt 100 ]; then
      wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    fi
    ;;
  --dec)
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    ;;
  *)
    vol=$(get_volume)
    mute=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED && echo "󰖁" || echo "󰕾")
    echo "$mute $vol%"
    ;;
esac

