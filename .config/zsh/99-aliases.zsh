# Custom Aliases
alias start="$HOME/.config/desktopenvs/startup.sh"
alias eduvpn="eduvpn-cli connect -n 1"
alias backuppictures="sudo rsync -aAXv --progress --checksum --no-owner --no-group ~/Pictures/Camera ~/Pictures/DigiKam /mnt/externalssd"
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias rm='trash-put'  # Use XDG trash for safety
alias mv="mv -iv"
alias cp="cp -aiv"
alias ts="tailscale"
alias df="duf"
alias cccp="~/.config/zsh/scripts/tmux_arago.sh"

# >>> Added by Spyder >>>
alias spyder=/home/akash/.local/spyder-6/envs/spyder-runtime/bin/spyder
alias uninstall-spyder=/home/akash/.local/spyder-6/uninstall-spyder.sh
# <<< Added by Spyder <<<




eval "$(zoxide init --cmd cd zsh)"
