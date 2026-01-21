#!/bin/bash

  # --text="<span font='14'>Choose screenshot mode:\n</span>" \
# Show YAD horizontal button menu
yad --title="Screenshot" --center --on-top --no-wrap --borders=20 \
  --button="󱂬  Area Select":3 \
  --button="  Active Window":2 \
  --button="󰍹  Fullscreen":1 

exit $?
