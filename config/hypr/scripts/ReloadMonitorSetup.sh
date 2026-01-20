#!/bin/bash

# Check if HDMI-A-1 is connected
if hyprctl monitors | grep HDMI; then
  hyprctl keyword monitor "eDP-1,preferred,0x0,1"
  hyprctl keyword monitor "HDMI-A-1,preferred,1920x0,auto,mirror,eDP-1"
else
  hyprctl keyword monitor ",preferred,0x0,1"
fi
