#!/usr/bin/env zsh

CONFIG_DIR="$HOME/.config/zsh"

# My configuration
FILES_TO_SOURCE=("aliases.zsh" "exports.zsh" "functions.zsh" "settings.zsh" "zinit.zsh")

for file in $FILES_TO_SOURCE; do
  source "$CONFIG_DIR/$file"
done

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
