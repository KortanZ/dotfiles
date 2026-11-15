# Keep Bash and Zsh history separate because their formats differ.
function zsh
    mkdir -p "$XDG_STATE_HOME/zsh"
    env HISTFILE="$XDG_STATE_HOME/zsh/history" command zsh $argv
end
