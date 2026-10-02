#!/usr/bin/env zsh

if [[ -n "$SSH_TTY" || -n "$SSH_CONNECTION" ]]; then
  export EDITOR='vim'
elif [[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

if ! command -v vim &>/dev/null && command -v nvim &>/dev/null; then
  alias vim='nvim'
  export EDITOR='nvim'
elif command -v vim &>/dev/null && ! command -v nvim &>/dev/null; then
  alias nvim='vim'
  export EDITOR='vim'
fi

# Set editor alias after setting EDITOR variable
alias e="$EDITOR"
alias n="$EDITOR"

export PATH="$PATH:/var/lib/flatpak/exports/bin:$HOME/.local/bin"
