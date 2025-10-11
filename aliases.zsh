alias src='source ./.venv/bin/activate'
alias tcode='tmux new-session \; \
  split-window -h -p 35 \; \
  select-pane -t 1 \; \
  split-window -v -p 40 \; \
  select-pane -t 0 \; \
  send-keys -t 0 "nvim ./" C-m'
alias tpy='tmux new-session \; \
  split-window -h -p 35 \; \
  send-keys -t 1 "source ./.venv/bin/activate" C-m \; \
  select-pane -t 1 \; \
  split-window -v -p 40 \; \
  send-keys -t 2 "source ./.venv/bin/activate" C-m \; \
  select-pane -t 0 \; \
  send-keys -t 0 "source ./.venv/bin/activate" C-m \; \
  send-keys -t 0 "nvim ./" C-m'
alias lg="lazygit"
