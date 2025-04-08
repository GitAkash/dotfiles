# Start your desktop environment script if no GUI is running and on TTY
[[ -z $DISPLAY && $XDG_VTNR -le 6 ]] && "$HOME/.config/desktopenvs/startup.sh"
