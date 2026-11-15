if status is-interactive; and command -q tmux; and test -z "$TMUX";
    exec tmux new-session -A -s (whoami) >/dev/null 2>&1
end
