#!/bin/bash

~/.config/yad/prompts/RebootPrompt.sh
if [[ $? -eq 0 ]]; then
    reboot    
fi
