#!/usr/bin/env zsh

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# Auto create new tmux session when can't attach to existing one
function tmuxa() {
  local session=$(tmux list-sessions -F "#{session_id}" 2>/dev/null | head -n1)

  if [ -z "$session" ]; then
    tmux new-session
    return
  fi

  tmux attach-session -t "$session"
}

function 7z-smallfiles() {
  local name="$(basename "${1%/}")"
  tar -cf - "$name" | 7z a -si"$name".tar -t7z -mx=9 -m0=lzma2 -md=1536m -mfb=273 -ms=on -mmt=off "$name".7z
}

function tcode() {
  tmux new-session \; \
    split-window -h -p 35 \; \
    select-pane -t 1 \; \
    split-window -v -p 40 \; \
    select-pane -t 0 \; \
    send-keys -t 0 "nvim ./" C-m
}

function tpy() {
  tmux new-session \; \
    split-window -h -p 35 \; \
    send-keys -t 1 "source ./.venv/bin/activate && clear" C-m \; \
    select-pane -t 1 \; \
    split-window -v -p 40 \; \
    send-keys -t 2 "source ./.venv/bin/activate && clear" C-m \; \
    select-pane -t 0 \; \
    send-keys -t 0 "source ./.venv/bin/activate" C-m \; \
    send-keys -t 0 "nvim ./" C-m
}

function bentopdf() {
  echo " > Open http://localhost:3000 to access BentoPDF"

  podman network create --internal no-internet-bentopdf

  (sleep 1 && xdg-open http://localhost:3000 >/dev/null 2>&1) &
  disown

  podman run --rm \
    --network no-internet-bentopdf \
    -p 127.0.0.1:3000:8080 \
    --security-opt=no-new-privileges \
    ghcr.io/alam00000/bentopdf-simple:latest

  podman network remove no-internet-bentopdf
}

function excalidraw() {
  echo " > Open http://localhost:5000 to access Excalidraw"

  podman network create --internal no-internet-excalidraw

  (sleep 1 && xdg-open http://localhost:5000 >/dev/null 2>&1) &
  disown

  podman run --rm \
    --network no-internet-excalidraw \
    --security-opt=no-new-privileges \
    -p 127.0.0.1:5000:80 \
    --name excalidraw \
    excalidraw/excalidraw:latest

  podman network remove no-internet-excalidraw
}
