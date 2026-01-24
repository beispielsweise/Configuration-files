#!/bin/bash

#TODO:a parser function for monitor res and hz...

case $1 in
  --internal) 
    hyprctl keyword monitor "HDMI-A-1,disable"
    hyprctl keyword monitor "eDP-1,preferred,0x0,1"
    ;;
  --external)
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "HDMI-A-1,preferred,0x0,1"
    ;;
  --mirror) 
    hyprctl keyword monitor "eDP-1,preferred,0x0,1"
    hyprctl keyword monitor "HDMI-A-1,preferred,0x0,auto,mirror,eDP-1"
    ;;
  --extend) 
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
