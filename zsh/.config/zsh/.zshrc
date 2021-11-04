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
HISTFILE=$XDG_DATA_HOME/zsh/history
HISTSIZE=1000
SAVEHIST=500

# load alias
source $ZDOTDIR/.alias.zsh

# load zinit
typeset -A ZINIT=(
    BIN_DIR         $XDG_DATA_HOME/zsh/zinit/bin
    HOME_DIR        $XDG_DATA_HOME/zsh/zinit
    COMPINIT_OPTS   -C
)
source $XDG_DATA_HOME/zsh/zinit/bin/zinit.zsh

# load fzf-tab
zinit light Aloxaf/fzf-tab

# completion suggestion
zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# change zcompdump location
autoload -U compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# syntax highlight
zinit light-mode for \
        zdharma/fast-syntax-highlighting \
        zsh-users/zsh-autosuggestions

# p10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# p10k config auto generated
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

