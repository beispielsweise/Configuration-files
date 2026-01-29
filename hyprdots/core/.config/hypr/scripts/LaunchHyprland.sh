#!/usr/bin/bash
tty_path="$(tty 2>/dev/null || true)"
[[ "$tty_path" =~ ^/dev/tty[0-9]+$ ]] || exit 0

start-hyprland
