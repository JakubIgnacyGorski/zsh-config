if [[ -n "$SSH_TTY" || -n "$SSH_CONNECTION" ]]; then
	export EDITOR='vim'
elif [[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" ]]; then
	export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set editor alias after setting EDITOR variable
alias e="$EDITOR"

export PATH="$PATH:/var/lib/flatpak/exports/bin:$HOME/.local/bin"
