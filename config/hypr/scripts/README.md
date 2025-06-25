## Shutdown
To use the shutdown script, the command ```sudo shutdown -h now```must be removed from sudo, to prevent entering a password. To do this:
1. Open sudoers file ```sudo visudo```
2. YOUR_USERNAME ALL=(ALL) NOPASSWD: /usr/bin/shutdown
