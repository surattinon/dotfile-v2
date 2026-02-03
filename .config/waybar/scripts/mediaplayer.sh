#!/bin/sh
while true; do
    # Run playerctl and wait for updates
    playerctl metadata --follow --format \
    '{"text": "{{artist}} - {{title}}", "class": "{{status}}", "alt": "{{status}}"}' 2>/dev/null
    
    # Wait 1s before restarting if the player closes
    sleep 1
done
