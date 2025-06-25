#!/bin/bash

# --text="<span font='14'>Choose monitor setup:\n</span>" \
yad --title="Monitor Mode" --center --on-top --no-wrap --borders=20 --close-on-unfocus \
  --button="󰍹 󰶐   Internal Only":1 \
  --button="󰶐 󰍹   External Only":2 \
  --button="󰍺 󰍺   Mirror":3 \
  --button="󰷜 󱄄   Extend":4

exit $?
