#!/bin/sh

# Load environment vars
[ -f "$HOME/.config/sway/env" ] && . "$HOME/.config/sway/env"

# Start pipewire services if not running
pgrep -x pipewire > /dev/null || pipewire &
pgrep -x pipewire-pulse > /dev/null || pipewire-pulse &
pgrep -x udiskie > /dev/null || udiskie --smart-tray &
sleep 0.1
pgrep -x wireplumber > /dev/null || wireplumber &

exec sway

