#!/bin/bash
script_dir=$(dirname "$(realpath "$0")")
file="$script_dir/current_workspace"
# Parse command-line arguments
while getopts "i:" opt; do
  case $opt in
    i)
      workspace=$OPTARG  # Capture the value of the -i option
      echo "$OPTARG" > "$file"
      ;;
    *)
      echo "Usage: $0 -i <workspace>"
      exit 1
      ;;
  esac
done

# Check if the workspace variable is set
if [ -z "$workspace" ]; then
  echo "Error: No workspace specified. Use -i <workspace> to specify the workspace."
  exit 1
fi
