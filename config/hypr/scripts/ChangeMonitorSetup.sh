#!/bin/bash

~/.config/yad/prompts/ChangeMonitorPrompt.sh
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

pkill waybar
sleep 0.3
waybar &
