#!/bin/bash

yad --title="Shutdown" \
    --text="<span font='14'>Shutdown?\n</span>" \
    --button="  Yes":0 \
    --button="  No":1 \
    --center \
    --on-top \
    --no-wrap \
    --borders=20 \
    --close-on-unfocus

exit $?
