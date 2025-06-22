#!/bin/bash

yad --title="Monitor Mode" --center --on-top --no-wrap --borders=20 \
  --text="<span font='14'>Choose monitor setup:\n</span>" \
  --button="󰍹  󰶐  Internal Only":1 \
  --button="󰶐  󰍹  External Only":2 \
  --button="󰍺  󰍺  Mirror":3 \
  --button="󰷜  󱄄  Extend":4

case $? in
  1)
    hyprctl keyword monitor "HDMI-A-1,disable"
    hyprctl keyword monitor "eDP-1,preferred,0x0,auto"
    ;;
  2)
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "HDMI-A-1,preferred,0x0,auto"
    ;;
  3)
    hyprctl keyword monitor "eDP-1,preferred,0x0,auto"
    hyprctl keyword monitor "HDMI-A-1,preferred,1920x0,auto,mirror,eDP-1"
    ;;
  4)
    hyprctl keyword monitor "eDP-1,preferred,0x0,1"
    hyprctl keyword monitor "HDMI-A-1,preferred,1920x0,1"
    ;;
  *)
    exit 0
    ;;
esac

sleep 1.2

# Restart waybar
pkill waybar
sleep 0.3
waybar &
