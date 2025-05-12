#!/bin/sh

while true; do
    battery=$(upower -i "$(upower -e | grep BAT)" | grep -E "percentage" | awk '{print $2}' | tr -d '%')
    if [ "$battery" -le "20" ]; then
        notify-send -u critical "Low Battery" "Hey there you little fuck, you are running out of battery space it's only fucking ${battery}%, go fucking charge it, move that lazy ass." 
        sleep 240
    else
        sleep 120
    fi
done
