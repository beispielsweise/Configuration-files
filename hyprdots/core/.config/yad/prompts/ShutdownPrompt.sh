#!/bin/bash

# Unused example - to set a color for a yad window. 
# GTK_THEME=Graphite-black yad ...
yad --title="Shutdown" \
    --text="<span font='14'>Shutdown?\n</span>" \
    --button="  Yes":0 \
    --button="  No":1 \
    --center \
    --on-top \
    --no-wrap \
    --borders=20 

exit $?
