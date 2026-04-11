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
