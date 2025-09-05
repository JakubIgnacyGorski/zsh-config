CONFIG_DIR="${0:A:h}"

if [[ -n $CONFIG_DIR/*.zsh(N) ]]; then
    source $CONFIG_DIR/*.zsh
fi
