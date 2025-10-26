#!/bin/sh

while true; do
    # Get battery device
    battery_path=$(upower -e | grep BAT)
    
    # Get battery percentage (remove %)
    battery=$(upower -i "$battery_path" | awk '/percentage:/ {gsub(/%/,""); print $2}')
    
    # Get charging state (e.g., "charging", "discharging", "fully-charged")
    state=$(upower -i "$battery_path" | awk '/state:/ {print $2}')
    
    # Only warn if discharging and battery ≤ 20%
    if [ "$state" = "discharging" ] && [ "$battery" -le 20 ]; then
        notify-send -u critical "Low Battery" \
        "Hey there you little fuck, you're running out of battery, it's only ${battery}%, go charge that shit up." 
        sleep 240
    else
        sleep 120
    fi
done
