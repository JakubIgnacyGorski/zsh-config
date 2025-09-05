#!/usr/bin/env bash

ZSHRC="$HOME/.zshrc"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $SCRIPT_DIR == /home/$USER* ]]; then
    init_file="${SCRIPT_DIR/#\/home\/$USER/\$HOME}"
    init_file+="/init.zsh"
fi

echo "$0 Checking if $ZSHRC had source init.zsh"
if grep -Eq 'test -s .*/init\.zsh && source .*/init\.zsh \|\| true' "$ZSHRC" ; then
    echo "$0: There is init.zsh removing it"
    sed -i.bak -E '/test -s .*\/init\.zsh && source .*\/init\.zsh \|\| true/d' "$ZSHRC"
fi

last_hash_line=$(grep -n '^#' "$ZSHRC" | tail -n1 | cut -d: -f1)
LINE="test -s $init_file && source $init_file || true"

if [[ -n $last_hash_line ]]; then
    echo "$0: Adding source at line $((last_hash_line++))"
    sed -i.bak "${last_hash_line}a $LINE" "$ZSHRC"
else
    echo "$0: Adding source at the end of file"
    echo "$LINE" >> "$ZSHRC"
fi
