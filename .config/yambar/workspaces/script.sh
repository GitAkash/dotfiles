#!/bin/bash
script_dir=$(dirname "$(realpath "$0")")
file="$script_dir/current_workspace"

# Ensure the file exists
if [ ! -f "$file" ]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi

# Monitor the file for modifications and react when it changes
while inotifywait -e modify "$file"; do
    workspace=$(cat "$file")
    echo "workspace|int|$workspace"
    echo ""
done

