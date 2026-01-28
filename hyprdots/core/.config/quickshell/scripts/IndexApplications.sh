#!/bin/bash
# Parser, retrieves all currently available applications
# model: {name; comment; icon; exec}

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

jesc() {
  printf '%s' "${1//\"/\\\"}"
}

# fml
createIconPath() {
  local icon="$1"



  local -a bases=(
    "/usr/share/icons/hicolor"
    "/usr/local/share/icons/hicolor"
    "$HOME/.local/share/icons/hicolor"
    "/usr/share/pixmaps"
  )

  local -a dirs=(
    "scalable/apps"
    "1024x1024/apps"
    "512x512/apps"
    "384x384/apps"
    "256x256/apps"
    "192x192/apps"
    "128x128/apps"
    "96x96/apps"
    "72x72/apps"
    "64x64/apps"
    "48x48/apps"
    "36x36/apps"
    "32x32/apps"
    "24x24/apps"
    "22x22/apps"
    "16x16/apps"
    ""
  )

  local base d p

  for base in "${bases[@]}"; do
    for d in "${dirs[@]}"; do
      p="$base/$d/$icon.svg"
      if [[ -f "$p" ]]; then
        printf '%s' "$p"
        return 0
      fi
    done

    for d in "${dirs[@]}"; do
      p="$base/$d/$icon.png"
      if [[ -f "$p" ]]; then
        printf '%s' "$p"
        return 0
      fi
    done
  done

  printf ''
  return 0
}

{
  echo "["

  first=true

  for dir in "${APP_DIRS[@]}"; do
    [[ -d "$dir" ]] || continue

    for file in "$dir"/*.desktop; do
      [[ -f "$file" ]] || continue

      name=""
      comment=""
      icon=""
      exec=""
      nodisplay=""
      hidden=""

      # fml2
      while IFS= read -r line; do
        [[ -z "$line" || "$line" == \#* ]] && continue
        [[ "$line" == "[Desktop Action"* ]] && break
        [[ "$line" == *"="* ]] || continue

        key="${line%%=*}"
        value="${line#*=}"

          case "$key" in
            Name)      [[ -z "$name" ]]    && name="$value" ;;
            Comment)   [[ -z "$comment" ]] && comment="$value" ;;
            Icon)      [[ -z "$icon" ]]    && icon="$value" ;;
            Exec)      [[ -z "$exec" ]]    && exec="${value%% *%*}" ;;
            NoDisplay)
              if [[ "$value" == "true" ]]; then
                nodisplay="true"
                skip=true
                break
              fi
              ;;
            Hidden)
              if [[ "$value" == "true" ]]; then
                hidden="true"
                skip=true
                break
              fi
              ;;
          esac

          if [[ -n "$name" && -n "$comment" && -n "$icon" && -n "$exec" ]]; then
            break
          fi
        done < "$file"

      if [[ "$nodisplay" == "true" || "$hidden" == "true" ]]; then
        continue
      fi

      [[ -n "$name" ]] || continue

      iconPath="$(createIconPath "$icon")"

      if [[ "$first" = false ]]; then
        echo ","
      fi
      first=false

      printf '  {"name":"%s","comment":"%s","icon":"%s","exec":"%s","desktopId":"%s"}' \
        "$(jesc "$name")" \
        "$(jesc "$comment")" \
        "$(jesc "$iconPath")" \
        "$(jesc "$exec")" \
        "$(jesc "$(basename "$file")")"
    done
  done

  echo
  echo "]"
} > "$TMP_FILE"

mv "$TMP_FILE" "$CACHE_FILE"

