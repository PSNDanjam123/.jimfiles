#!/bin/sh

# Setup VMWare ----------------------------------
if command -v vmware-user > /dev/null 2>&1; then
    vmware-user &
fi
