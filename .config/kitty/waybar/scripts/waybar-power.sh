#!/bin/sh
swaynag -t custom -m 'Are you sure you want to shutdown your device?' -b 'Poweroff' 'poweroff' -b 'Reboot' 'reboot' -b 'Logout' 'wayland-logout'
