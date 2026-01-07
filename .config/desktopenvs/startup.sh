#!/bin/bash

# --- Configuration ---
# List of processes to cleanup. Easier to manage here than in the pkill command.
TO_KILL="sway|hyprland|waybar|rofi|nm-applet|blueman-applet|pipewire|wireplumber|udiskie"

cleanup_session() {
    local tty_name
    tty_name=$(basename "$(tty)")

    if [[ "$tty_name" =~ tty[0-9]+ ]]; then
        echo " Cleaning up session on $tty_name..."
        
        # 1. Ask nicely (SIGTERM)
        pkill -t "$tty_name" -15 -f "$TO_KILL" 2>/dev/null
        
        # 2. Wait up to 3 seconds for them to close
        for i in {1..30}; do
            if ! pgrep -t "$tty_name" -f "$TO_KILL" > /dev/null; then
                break # Everyone is dead, proceed immediately
            fi
            sleep 0.1
        done

        # 3. Force kill (SIGKILL) anything remaining
        pkill -t "$tty_name" -9 -f "$TO_KILL" 2>/dev/null
    else
        echo " Not running on a real TTY. Skipping cleanup."
    fi
}

launch_wsl() {
    local script="$1"
    if [ -x "$script" ]; then
        # Check for startup script executability
        exec dbus-run-session "$script"
    else
        echo "Error: $script not found or not executable!"
        read -r -p "Press Enter to return..."
        return 1
    fi
}

# --- Main Logic ---

clear
cleanup_session

while true; do
    clear
    echo "======================================="
    echo "   Desktop Environment Selector"
    echo "======================================="
    echo " 1. Hyprland"
    echo " 2. Sway"
    echo " 3. Exit (Logout)"
    echo "======================================="
    read -rp " Select (1-3): " choice

    case $choice in
        1)
            echo "Starting Hyprland..."
            launch_wsl "$HOME/.config/hypr/startup.sh"
            ;;
        2)
            echo "Starting Sway..."
            launch_wsl "$HOME/.config/sway/startup.sh"
            ;;
        3)
            clear
            exit 0
            ;;
        *)
            echo " Invalid option."
            sleep 1
            ;;
    esac
done
