#!/bin/bash

~/.config/yad/prompts/ShutdownPrompt.sh
if [[ $? -eq 0 ]]; then
    shutdown -h now 
fi
