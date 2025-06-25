#!/bin/bash

~/.config/yad/prompts/SuspendPrompt.sh
if [[ $? -eq 0 ]]; then
    systemctl suspend
fi
