#!/usr/bin/env bash

set -euo pipefail

CACHE_DIR="$HOME/.cache/quickshell"
CACHE_FILE="$CACHE_DIR/apps.json"
TMP_FILE="$CACHE_FILE.tmp"

mkdir -p "$CACHE_DIR"
APP_DIRS=(
  "/usr/share/applications"
  "/usr/local/share/applications"
  "$HOME/.local/share/applications"
)

{
echo "["

first=true

for dir in "${APP_DIRS[@]}"; do
  [ -d "$dir" ] || continue

  for file in "$dir"/*.desktop; do
    [ -f "$file" ] || continue

    name=""
    comment=""
    icon=""
    exec=""
    nodisplay=""
    hidden=""

    while IFS='=' read -r key value; do
      case "$key" in
        Name) name="$value" ;;
        Comment) comment="$value" ;;
        Icon) icon="$value" ;;
        Exec) exec="${value%% *%*}" ;;
        NoDisplay) nodisplay="$value" ;;
        Hidden) hidden="$value" ;;
      esac
    done < "$file"

    if [[ "$nodisplay" == "true" || "$hidden" == "true" ]]; then
      continue
    fi

    [ -n "$name" ] || continue

    if [ "$first" = false ]; then
      echo ","
    fi
    first=false

    printf '  {"name": "%s", "comment": "%s", "icon": "%s", "exec": "%s", "desktopId": "%s"}' \
      "${name//\"/\\\"}" \
      "${comment//\"/\\\"}" \
      "${icon//\"/\\\"}" \
      "${exec//\"/\\\"}" \
      "$(basename "$file")"

  done
done

echo
echo "]"
} > "$TMP_FILE"

mv "$TMP_FILE" "$CACHE_FILE"
