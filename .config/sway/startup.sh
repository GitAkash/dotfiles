#!/bin/sh

# Load environment vars
[ -f "$HOME/.config/sway/env" ] && . "$HOME/.config/sway/env"

# Start pipewire services if not running
pgrep -x pipewire > /dev/null || pipewire &
pgrep -x pipewire-pulse > /dev/null || pipewire-pulse &
sleep 0.2
pgrep -x wireplumber > /dev/null || wireplumber &
pgrep -x udiskie > /dev/null || udiskie --smart-tray &

exec sway

