#!/bin/bash
clear

current_tty=$(tty)

if [[ "$current_tty" =~ ^/dev/tty[0-9]+$ ]]; then
  echo "Killing existing Wayland sessions on $current_tty..."

  # Try graceful termination
  pkill -t "$(basename $current_tty)" -15 -f 'sway|hyprland|waybar|rofi|nm-applet|blueman-applet|pipewire|pulseaudio'

  sleep 3

  # Force kill if still running
  pkill -t "$(basename $current_tty)" -9 -f 'sway|hyprland|waybar|rofi|nm-applet|blueman-applet|pipewire|pulseaudio'
else
  echo "Running inside a terminal emulator, skipping kill."
fi

clear
echo "Welcome to Desktop Environment Selector"
echo "---------------------------------------"
echo "1. Hyprland"
echo "2. Sway"
echo "3. Exit"

read -rp "Enter your choice (1-3): " choice

case $choice in
  1)
    echo "Starting Hyprland..."
    exec dbus-run-session ~/.config/hypr/startup.sh
    ;;
  2)
    echo "Starting Sway..."
    exec dbus-run-session ~/.config/sway/startup.sh
    ;;
  3)
    echo "Exiting..."
    exit 0
    ;;
  *)
    echo "Invalid choice."
    exit 1
    ;;
esac

