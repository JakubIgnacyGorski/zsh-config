#!/usr/bin/env zsh

alias src='source ./.venv/bin/activate'
alias ssh='TERM=${TERM/xterm-kitty/xterm-256color} ssh'
alias ls='ls --color=auto'

# Git aliases - source: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gcmsg='git commit --message'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcl='git clone --recurse-submodules'
alias gclf='git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules'
alias gwipe='git reset --hard HEAD && git clean -fd'
alias gsu='git submodule update'
alias gsur='git submodule update --remote --recursive'
alias gsuir='git submodule update --init --remote --recursive'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gd='git diff'

alias lg='lazygit'
