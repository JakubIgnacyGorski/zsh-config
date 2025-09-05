if [[ -n "$SSH_TTY" || -n "$SSH_CONNECTION" ]]; then
	export EDITOR='vim'
elif [[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" ]]; then
	export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

