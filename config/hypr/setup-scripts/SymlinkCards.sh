#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Error: This script must be run as root (use sudo)." >&2
    exit 1
fi

# Retrieving ID's of card* for further symlinking
GPU_LIST=$(lspci -d ::03xx -nn 2>/dev/null)
INTEL_ID=$(echo "$GPU_LIST" | grep -Ei 'Intel' | awk '{print $1}')
NVIDIA_ID=$(echo "$GPU_LIST" | grep -Ei 'Nvidia' | awk '{print $1}')

if [[ -z "$GPU_LIST" ]]; then
    echo "No Intel or NVIDIA GPU found.
Check if \"lspci -d ::03xx -nn 2>/dev/null\" has Intel and Nvidia cards listed. 
Exiting."
    exit 2
fi

echo "Intel GPU ID: $INTEL_ID"
echo "NVIDIA GPU ID: $NVIDIA_ID"



INTEL_SYMLINK="intel"
NVIDIA_SYMLINK="nvidia"

UDEV_DIR="/etc/udev/rules.d"

# Create new rules to create general symlinks for card*
if [[ -n "$INTEL_ID" ]]; then
    RULE_PATH="$UDEV_DIR/${INTEL_SYMLINK}-dev-path.rules"
    UDEV_RULE=$(cat <<EOF
KERNEL=="card*", \\
KERNELS=="0000:$INTEL_ID", \\
SUBSYSTEM=="drm", \\
SUBSYSTEMS=="pci", \\
SYMLINK+="dri/$INTEL_SYMLINK"
EOF
)
    echo "$UDEV_RULE" | tee "$RULE_PATH" > /dev/null
fi

if [[ -n "$NVIDIA_ID" ]]; then
    RULE_PATH="$UDEV_DIR/${NVIDIA_SYMLINK}-dev-path.rules"
    UDEV_RULE=$(cat <<EOF
KERNEL=="card*", \\
KERNELS=="0000:$NVIDIA_ID", \\
SUBSYSTEM=="drm", \\
SUBSYSTEMS=="pci", \\
SYMLINK+="dri/$NVIDIA_SYMLINK"
EOF
)
    echo "$UDEV_RULE" | tee "$RULE_PATH" > /dev/null
fi

# Reload udev rules
udevadm control --reload
udevadm trigger

ls -l /dev/dri/
