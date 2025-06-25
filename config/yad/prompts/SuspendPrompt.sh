#!/bin/bash

yad --title="Sleep" \
    --text="<span font='14'>Sleep?\n</span>" \
    --button="  Yes":0 \
    --button="  No":1 \
    --center \
    --on-top \
    --no-wrap \
    --borders=20 \
    --close-on-unfocus

exit $?
