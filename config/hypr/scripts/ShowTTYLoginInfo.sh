#!/usr/bin/bash
# Display info on first TTY login
tty_path="$(tty 2>/dev/null || true)"
[[ "$tty_path" =~ ^/dev/tty[0-9]+$ ]] || exit 0

# Date:
echo
date '+  %a %d.%m.%Y %H:%M:%S'
# Battery state
bat="$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -n1)"
if [[ -n "$bat" ]]; then
  echo "  Batterie: $(cat "$bat/capacity")% • $(cat "$bat/status")"
else
  echo "  Batterie: keine erkannt"
fi
echo
