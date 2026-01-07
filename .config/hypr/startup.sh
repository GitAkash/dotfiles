#!/bin/sh

# --- Start PipeWire if not running ---
if ! pgrep -x "pipewire" > /dev/null; then
    pipewire &
fi

# --- Start PipeWire Pulse if not running ---
if ! pgrep -x "pipewire-pulse" > /dev/null; then
    pipewire-pulse &
fi

# Short wait to let PipeWire initialize
sleep 0.2

# --- Start WirePlumber if not running ---
if ! pgrep -x "wireplumber" > /dev/null; then
    wireplumber &
fi

# --- Automount USB with udiskie if not running ---
if ! pgrep -x "udiskie" > /dev/null; then
    udiskie --smart-tray &
fi

# --- Start Hyprland ---
exec start-hyprland
