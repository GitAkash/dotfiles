#!/bin/bash

# Clear the screen
clear

# Display menu
echo "Welcome to Desktop Environment Selector"
echo "----------------------------------------"
echo "Please choose your desktop environment:"
echo "1. Hyprland"
echo "2. Sway"
echo "3. Exit"

# Read user input
read -p "Enter your choice (1-4): " choice

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
        echo "Invalid choice! Please run the script again and select 1-4."
        exit 1
        ;;
esac
