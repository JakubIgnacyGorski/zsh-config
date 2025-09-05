if [[ -n "$SSH_TTY" || -n "$SSH_CONNECTION" ]]; then
	export EDITOR='vim'
elif [[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" ]]; then
	export EDITOR='vim'
else
  export EDITOR='nvim'
fi
