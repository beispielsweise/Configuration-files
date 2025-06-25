#!/bin/bash

~/.config/yad/prompts/LogoutPrompt.sh
if [[ $? -eq 0 ]]; then
    hyprctl dispatch exit
fi
