# FZF env variables and keybindings

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

### Function: Fuzzy Finder + MIME-Aware File Opener

fuzzy-xdg-open() {
  local output
  output=$(fzf --height 40% --reverse </dev/tty) 2>/dev/null

  [[ -z "$output" ]] && zle reset-prompt && return

  mime_type=$(xdg-mime query filetype "$output")

  if [[ "$mime_type" =~ ^text/ || "$mime_type" == "application/x-shellscript" ]]; then
    if [[ -x "$output" ]]; then
      "$output"
    else
      hx "$output"  # Or vim/nano
    fi
  else
    xdg-open "$output" > /dev/null 2>&1 & disown
  fi

  clear
  zle reset-prompt
}

zle -N fuzzy-xdg-open
bindkey '^o' fuzzy-xdg-open
