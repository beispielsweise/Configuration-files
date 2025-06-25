#!/bin/bash

~/.config/yad/prompts/ShutdownPrompt.sh
if [[ $? -eq 0 ]]; then
    sudo shutdown -h now 
fi
