#!/bin/bash

# Cycle to the next asusctl profile
asusctl profile next
PROFILE=$(asusctl profile get | grep 'Active profile' | sed 's/Active profile: //')

# Send the notification to swaync
notify-send "ASUS Profile" "Switched to: $PROFILE" -h string:x-canonical-private-synchronous:asus-profile
