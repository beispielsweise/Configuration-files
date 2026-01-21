#!/bin/bash

current=$(powerprofilesctl get)

case "$current" in
  performance) powerprofilesctl set balanced ;;
  balanced) powerprofilesctl set power-saver ;;
  power-saver) powerprofilesctl set performance ;;
esac
