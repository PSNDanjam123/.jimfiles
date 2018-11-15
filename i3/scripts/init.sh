#!/bin/sh

# Setup VMWare ----------------------------------
if command -v vmware-user > /dev/null 2>&1; then
    vmware-user &
fi

# Setup Gnome Keyring ---------------------------
if [ -x "$(command -v gnome-keyring-daemon)" ]; then
    gnome-keyring-daemon --start --components=ssh
    export SSH_AUTH_SOCK
fi
