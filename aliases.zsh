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
alias bentopdf='echo " > Open http://localhost:3000 to access BentoPDF"
  podman network create --internal no-internet-bentopdf
  (sleep 1 && xdg-open http://localhost:3000 >/dev/null 2>&1) &
  podman run --rm \
    --network no-internet-bentopdf \
    -p 127.0.0.1:3000:8080 \
    --security-opt=no-new-privileges \
    ghcr.io/alam00000/bentopdf:latest
  podman network remove no-internet-bentopdf'
