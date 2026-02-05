# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set Zsh theme (can be replaced with another theme if desired)
ZSH_THEME="fino"

# Set plugins (you can still load them as you normally would in Oh My Zsh)
plugins=(
  git
  #z  REPLACED BY ZOXIDE
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
)

# Enable case-insensitive completion (optional)
CASE_SENSITIVE="false"

# Enable hyphen-insensitive completion (optional)
# HYPHEN_INSENSITIVE="true"

# Load Oh My Zsh core
source "$ZSH/oh-my-zsh.sh"

# Explicitly source modular config files in correct order
source "$HOME/.config/zsh/00-env.zsh"         # Environment variables and global settings
#source "$HOME/.config/zsh/01-trash.zsh"       # Trash management functions
source "$HOME/.config/zsh/02-functions_fzf.zsh" # FZF-related functions and keybindings
source "$HOME/.config/zsh/03-startup.zsh"     # Startup-related configurations
source "$HOME/.config/zsh/99-aliases.zsh"     # Aliases (always last)
source "$HOME/.config/zsh/99-motd.zsh"        # MOTD in terminal


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/akash/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/akash/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/akash/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/akash/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

