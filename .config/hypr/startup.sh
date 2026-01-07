#!/bin/sh

# --- PORTABILITY CHECK ---
# Ensure the state directory exists (in case this is a new PC)
mkdir -p "$HOME/.local/state/runit/service"

# --- START RUNIT ---
# Tell runit to watch the STATE folder
if ! pgrep -f "runsvdir $HOME/.local/state/runit/service"; then
  runsvdir "$HOME/.local/state/runit/service" &
fi

# --- ENABLE SERVICES ---
# Link your scripts from Config -> State
# Using -sf ensures it always points to your config, even if you moved files
ln -sf "$HOME/.config/runit/sv/pipewire" "$HOME/.local/state/runit/service/"
#ln -sf "$HOME/.config/runit/sv/wireplumber" "$HOME/.local/state/runit/service/"
ln -sf "$HOME/.config/runit/sv/pipewire-pulse" "$HOME/.local/state/runit/service/"

# --- WAIT FOR AUDIO ---
# Wait for Pipewire to actually start
while [ ! -e "${XDG_RUNTIME_DIR}/pipewire-0" ]; do sleep 0.1; done

# --- START HYPRLAND ---
exec start-hyprland
