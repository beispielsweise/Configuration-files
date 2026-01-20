#!/bin/bash

~/.config/yad/prompts/ChangeMonitorPrompt.sh
case $? in
  1) # internal only
    hyprctl keyword monitor "HDMI-A-1,disable"
    hyprctl keyword monitor "eDP-1,preferred,0x0,1"
    ;;
  2) # external only
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "HDMI-A-1,preferred,0x0,1"
    ;;
  3) # mirror
    hyprctl keyword monitor "eDP-1,preferred,0x0,1"
    hyprctl keyword monitor "HDMI-A-1,preferred,0x0,auto,mirror,eDP-1"
    ;;
  4) # extend
    hyprctl keyword monitor "eDP-1,preferred,2560x0,1"
    hyprctl keyword monitor "HDMI-A-1,preferred,0x0,1"
    ;;
  *)
    exit 0
    ;;
esac

pkill waybar
sleep 0.5
waybar &
