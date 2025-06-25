#!/bin/bash

# Check if HDMI-A-1 is connected
if hyprctl monitors | grep HDMI; then
  hyprctl keyword monitor "eDP-1,disable"
  hyprctl keyword monitor "HDMI-A-1,preferred,0x0,1"
else
  hyprctl keyword monitor "eDP-1,preferred,0x0,1"
fi
