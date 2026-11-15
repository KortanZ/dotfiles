function tclip --description 'Switch tmux clipboard mode'
    if test (count $argv) -gt 1
        printf 'Usage: tclip [osc|mac|wsl|status]\n' >&2
        return 2
    end

    set -l mode $argv[1]
    if test (count $argv) -eq 0
        set mode osc
        if test -z "$SSH_CONNECTION"; and test -z "$SSH_CLIENT"; and test -z "$SSH_TTY"
            switch (command uname -s)
                case Darwin
                    if command -q pbcopy
                        set mode mac
                    end
                case Linux
                    if string match -qi '*microsoft*' -- (command uname -r); and command -q clip.exe
                        set mode wsl
                    end
            end
        end
    end

    set -l copy_command ''
    switch "$mode"
        case osc
        case mac
            set copy_command pbcopy
        case wsl
            set copy_command clip.exe
        case status
        case '*'
            printf 'Usage: tclip [osc|mac|wsl|status]\n' >&2
            return 2
    end

    if not command -q tmux
        printf 'tclip: tmux not found\n' >&2
        return 1
    end

    if test "$mode" = status
        command tmux show-option -s copy-command
        return $status
    end

    if test -n "$copy_command"; and not command -q "$copy_command"
        printf 'tclip: %s not found\n' "$copy_command" >&2
        return 1
    end

    command tmux set-option -s copy-command "$copy_command"; or return $status
    printf 'tclip: %s\n' "$mode"
end
