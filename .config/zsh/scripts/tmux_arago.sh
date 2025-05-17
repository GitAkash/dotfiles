#!/bin/bash

SESSION="Arago"

# List of hosts to SSH into — customize these!
HOSTS=(
  "Feynman"
  "Bardeen"
  "Curie"
  "Euler"
  "Lagrange"
)

# Check if tmux session exists
tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
  # Create new session, window 0 SSH into first host
  tmux new-session -d -s $SESSION -n "${HOSTS[0]}" "ssh ${HOSTS[0]}"

  # Create new windows for remaining hosts
  for i in $(seq 1 $((${#HOSTS[@]} - 1))); do
    tmux new-window -t $SESSION -n "${HOSTS[i]}" "ssh ${HOSTS[i]}"
  done
fi

# Attach to session
tmux attach -t $SESSION

