#!/bin/sh

# Check if pipewire is running
if ! pgrep -x "pipewire" > /dev/null; then
  exec pipewire &
fi

# Check if pipewire-pulse is running
if ! pgrep -x "pipewire-pulse" > /dev/null; then
  exec pipewire-pulse &
fi

sleep 0.2

# Check if wire-plumber is running
if ! pgrep -x "wireplumber" > /dev/null; then
  exec wireplumber &
fi

# Automount USB
if ! pgrep -x "udiskie" > /dev/null; then
  exec udiskie --smart-tray &
fi

exec Hyprland

