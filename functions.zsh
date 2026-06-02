function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Auto create new tmux session when can't attach to existing one
function tmuxa() {
    sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null)

    if [ -z "$sessions" ]; then
        tmux new-session
        return
    fi

    target=$(echo "$sessions" | grep -E '^[0-9]+$' | sort -n | head -n 1)

    if [ -z "$target" ]; then
        tmux attach-session -t "$(echo "$sessions" | head -n 1)"
    else
        tmux attach-session -t "$target"
    fi
}

function 7z-smallfiles() {
  name="$(basename "${1%/}")"
  tar -cf - "$name" | 7z a -si"$name".tar -t7z -mx=9 -m0=lzma2 -md=1536m -mfb=273 -ms=on -mmt=off "$name".7z
}
