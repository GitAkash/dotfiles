#!/bin/sh

# --- Helper function: wait for PipeWire socket ---
wait_for_pipewire() {
    SOCKET="${XDG_RUNTIME_DIR}/pipewire-0"
    TRIES=0
    MAX_TRIES=50   # ~5 seconds max
    while [ ! -e "$SOCKET" ]; do
        sleep 0.1
        TRIES=$((TRIES + 1))
        if [ $TRIES -ge $MAX_TRIES ]; then
            echo "Warning: PipeWire socket not found after timeout"
            break
        fi
    done
}

# --- Start PipeWire if not running ---
if ! pgrep -x "pipewire" > /dev/null; then
    pipewire &
fi

# --- Start PipeWire Pulse if not running ---
if ! pgrep -x "pipewire-pulse" > /dev/null; then
    pipewire-pulse &
fi

# --- Wait until PipeWire is ready ---
wait_for_pipewire

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
