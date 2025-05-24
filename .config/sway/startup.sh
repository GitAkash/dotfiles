#!/bin/sh

# Load sway environment variables
#if [ -f "$HOME/.config/sway/env" ]; then
#  . "$HOME/.config/sway/env"
#fi

# Check if pipewire is running
#if ! pgrep -x "pipewire" > /dev/null; then
#  exec pipewire &
#fi

# Check if pipewire-pulse is running
#if ! pgrep -x "pipewire-pulse" > /dev/null; then
#  exec pipewire-pulse &
#fi

#sleep 0.2

# Check if wire-plumber is running
#if ! pgrep -x "wireplumber" > /dev/null; then
#  exec wireplumber &
#fi

#if ! pgrep -x "udiskie" > /dev/null; then
#  exec udiskie --smart-tray &
#fi

#exec dbus-run-session sway

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

