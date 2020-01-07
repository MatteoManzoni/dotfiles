#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# TMUX POWER
if [[ -z "$TMUX" ]] ;then
    ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
    if [[ -z "$ID" ]] ;then # if not available create a new one
        exec tmux new-session
    else
        exec tmux attach-session -t "$ID" # if available attach to it
    fi
fi

function set_win_title(){
    echo -ne "\033]0; Matteo's Terminal Emulator \007"
}

# Some source to keep all clean
#[[ -f ~/.promptrc ]] && . ~/.promptrc

starship_precmd_user_func="set_win_title"
eval "$(starship init bash)"

rustup completions bash > $(brew --prefix)/etc/bash_completion.d/rustup.bash-completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# BASH OPT
stty -ixon
shopt -s autocd
shopt -s histappend
shopt -s cmdhist


# Variables
HISTSIZE= 
HISTFILESIZE=
HISTCONTROL=ignoredups:erasedups
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Source everything else
[[ -f ~/.macosrc ]] && . ~/.macosrc
[[ -f ~/.aliasrc ]] && . ~/.aliasrc
[[ -f ~/.functionsrc ]] && . ~/.functionsrc
