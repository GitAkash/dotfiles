# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Add Miniconda to the beginning of the PATH
export PATH="$HOME/miniconda3/bin:$PATH"

# Set Zsh theme (can be replaced with another theme if desired)
ZSH_THEME="fino"

# Set plugins (you can still load them as you normally would in Oh My Zsh)
plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
)

# Enable case-insensitive completion (optional)
# CASE_SENSITIVE="false"

# Enable hyphen-insensitive completion (optional)
# HYPHEN_INSENSITIVE="true"

# Load Oh My Zsh core
source "$ZSH/oh-my-zsh.sh"

# Explicitly source modular config files in correct order
source "$HOME/.config/zsh/00-env.zsh"         # Environment variables and global settings
source "$HOME/.config/zsh/01-trash.zsh"       # Trash management functions
source "$HOME/.config/zsh/02-functions_fzf.zsh" # FZF-related functions and keybindings
source "$HOME/.config/zsh/03-startup.zsh"     # Startup-related configurations
source "$HOME/.config/zsh/99-aliases.zsh"     # Aliases (always last)

