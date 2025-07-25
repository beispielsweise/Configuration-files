#!/bin/bash

yad --title="Logout" \
    --text="<span font='14'>Logout?\n</span>" \
    --button="  Yes":0 \
    --button="  No":1 \
    --center \
    --on-top \
    --no-wrap \
    --borders=20 

exit $?
