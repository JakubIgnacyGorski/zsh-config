#!/usr/bin/env bash

ZSHRC="$HOME/.zshrc"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STARSHIP_PRESET="pure-preset"

if command -v zsh >/dev/null 2>&1; then
	echo "$0: Found: $(zsh --version)"
else
	echo "$0: Install zsh first!"
	exit 1
fi

# Get default shell
DEFAULT_SHELL="$(getent passwd "$USER" | cut -d: -f7)"

# Set zsh as default shell
if [ "$DEFAULT_SHELL" != "$ZSH_PATH" ]; then
	echo "$0: Default shell is $DEFAULT_SHELL. Setting zsh as default shell"
	chsh -s "$(which zsh)"
fi

if [[ $SCRIPT_DIR == $HOME* ]]; then
	init_file="${SCRIPT_DIR/#\/home\/$USER/\$HOME}"
	init_file+="/init.zsh"
fi

if [[ ! -f "$ZSHRC" ]]; then
	echo "$0 There is no $ZSHRC creating it"
	touhc "$ZSHRC"
else
	echo "$0 Checking if $ZSHRC had source init.zsh"
	sed -i.bak '/# >>> jig-zsh-init >>>/,/# <<< jig-zsh-init <<</d' "$ZSHRC"
fi

last_hash_line=$(grep -n '^#' "$ZSHRC" | tail -1 | cut -d: -f1)
LINE="test -s \"$init_file\" && source \"$init_file\" || true"

if [[ -n "$last_hash_line" ]]; then
	awk -v n="$last_hash_line" -v line="$LINE" '
	{
		print
	}
	NR == n {
		print ""
		print "# >>> jig-zsh-init >>>"
		print line
		print "# <<< jig-zsh-init <<<"
	}
	' "$ZSHRC" >"$ZSHRC.tmp" &&
		mv "$ZSHRC.tmp" "$ZSHRC"
else
	{
		echo "# >>> jig-zsh-init >>>"
		echo "$LINE"
		echo "# <<< jig-zsh-init <<<"
	} >>"$ZSHRC"
fi

# Setup starship
if ! command -v starship >/dev/null 2>&1; then
	echo "$0: Installing starship"
	curl -sS https://starship.rs/install.sh | sh
fi
echo "$0: Set theme as $STARSHIP_PRESET"
starship preset "$STARSHIP_PRESET" --force -o ~/.config/starship.toml

if ! command -v zoxide >/dev/null 2>&1; then
	echo "$0: Installing zoxide"
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# Setup git
git config --global init.defaultBranch main
git config --global pull.rebase true
