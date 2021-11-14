# use tmux session 0 when open new non-embedded interactive shell over ssh
if [[ "$TMUX" == "" && $- == *i* ]]; then
    if [[ "$(</proc/$PPID/cmdline)" =~ "^sshd:.*" ]]; then
        tmux has-session -t 0 2> /dev/null
        if [[ $? == 1 ]]; then
            exec tmux new -s 0
        else
            exec tmux a -t 0
        fi
    fi
fi

# p10k config auto generated
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# prepare dirctoris
if [[ ! -d $XDG_CACHE_HOME/zsh ]]; then
    mkdir $XDG_CACHE_HOME/zsh
fi

if [[ ! -d $XDG_DATA_HOME/zsh ]]; then
    mkdir $XDG_DATA_HOME/zsh
fi

# change history file location
HISTFILE=$XDG_CACHE_HOME/zsh/zhistory
HISTSIZE=20000
SAVEHIST=10000
# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
# Don't display duplicates when searching the history.
setopt HIST_FIND_NO_DUPS
# Don't enter immediate duplicates into the history.
setopt HIST_IGNORE_DUPS
# Remove commands from the history that begin with a space.
setopt HIST_IGNORE_SPACE
# Don't execute the command directly upon history expansion.
setopt HIST_VERIFY
# Cause all terminals to share the same history 'session'.
setopt SHARE_HISTORY

zstyle ':zim:completion' dumpfile "$XDG_CACHE_HOME/zsh/zcompdump"
# load alias
source $ZDOTDIR/.alias.zsh
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# p10k config auto generated
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

