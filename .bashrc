#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Some source to keep all clean
[[ -f ~/.promptrc ]] && . ~/.promptrc
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
