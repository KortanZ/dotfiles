# Keep Bash and Zsh history separate because their formats differ.
function bash
    mkdir -p "$XDG_STATE_HOME/bash"
    env HISTFILE="$XDG_STATE_HOME/bash/history" command bash $argv
end
