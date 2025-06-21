#!/bin/bash

# confirm=$(yad --title="Shutdown" \
#               --text="Do you want to suspend?" \
#               --center \
#               --on-top \
#               --no-wrap \
#               --button=Yes:0 \
#               --button=No:1)

confirm=$(yad --title="Shutdown" \
    --window-icon=system-shutdown \
    --text="<span font='14'>\nNap time? (Suspend)\n</span>" \
    --button="  Yes":0 \
    --button="  No":1 \
    --center \
    --on-top \
    --no-wrap \
    --borders=20)

if [[ $? -eq 0 ]]; then
    systemctl suspend
fi
