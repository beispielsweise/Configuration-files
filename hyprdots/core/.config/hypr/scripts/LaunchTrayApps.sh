#!/bin/bash
# Launches background apps, that are supposed to be displayed in tray, in a defined order

sleep 2
nm-applet &    
sleep 1
mcontrolcenter &
sleep 1
copyq & 
sleep 2
steam &  
sleep 5
discord & 
sleep 5
Telegram &
sleep 5
