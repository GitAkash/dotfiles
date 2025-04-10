#!/bin/bash

# Clear the screen
clear

# Get the current TTY (this will be something like /dev/tty1, /dev/tty2, or /dev/pts/0)
current_tty=$(tty)

# Check if we are in a physical TTY (e.g., /dev/tty1, /dev/tty2, etc.)
if [[ "$current_tty" =~ ^/dev/tty[0-9]+$ ]]; then
    # If it's a physical TTY, kill processes related to the current TTY
    echo "Killing conflicting processes in the current TTY ($current_tty)..."

    # Kill running Sway or Hyprland sessions for the current TTY
    ps -t $current_tty -e | grep -E 'sway|hyprland' | awk '{print $1}' | xargs kill -9

    # Kill system tray apps and session services in the current TTY
    ps -t $current_tty -e | grep -E 'rofi|waybar|nm-applet|blueman-applet|pipewire|pulseaudio' | awk '{print $1}' | xargs kill -9
else
    # If it's a terminal emulator (e.g., /dev/pts/0), skip killing processes
    echo "Running inside a terminal emulator, not killing processes."
fi
clear
# Display menu
echo "Welcome to Desktop Environment Selector"
echo "----------------------------------------"
echo "Please choose your desktop environment:"
echo "1. Hyprland"
echo "2. Sway"
echo "3. Exit"

# Read user input
read -p "Enter your choice (1-3): " choice

# Process the choice
case $choice in
    1)
        echo "Starting Hyprland..."
        ~/.config/hypr/startup.sh
        ;;
    2)
        echo "Starting Sway..."
        ~/.config/sway/startup.sh
        ;;
    3)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid choice! Please run the script again and select 1-3."
        exit 1
        ;;
esac
