if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
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
HISTFILE=$XDG_CACHE_HOME/zsh/.zhistory
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

# load alias
source $ZDOTDIR/.alias.zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

typeset -A ZINIT=(
    ZCOMPDUMP_PATH  $XDG_CACHE_HOME/zsh/.zcompdump
    COMPINIT_OPTS   -C
)

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-completions

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

zpcompinit; zpcdreplay

zinit light Aloxaf/fzf-tab

zinit light zdharma-continuum/fast-syntax-highlighting

zinit light zsh-users/zsh-autosuggestions

zinit light zsh-users/zsh-history-substring-search

# p10k config auto generated
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

