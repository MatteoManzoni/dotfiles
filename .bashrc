#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Some source to keep all clean
[[ -f ~/.promptrc ]] && . ~/.promptrc
[[ -f ~/.macosrc ]] && . ~/.macosrc
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# BASH OPT
stty -ixon
shopt -s autocd
shopt -s histappend
shopt -s cmdhist


# Variables and exports
HISTSIZE= 
HISTFILESIZE=
HISTCONTROL=ignoredups:erasedups
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
export GREP_COLOR="1;32"
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export PYTHONPATH="$PYTHONPATH:~/.vim/bundle/ropevim/:~/.vim/bundle/ropemode/:~/.vim/bundle/rope/"
export PYTHONSTARTUP="$HOME/.pythonrc"
export EDITOR=vim

# Alias Land
alias ls='ls -G'
alias ll='ls -l -G -v'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias hcat='highlight --out-format=ansi'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias cat='(( RANDOM % 4 == 0 )) && cat ~/.meow || cat'

alias updatedb='sudo /usr/libexec/locate.updatedb'

alias git-setup-personal="git config --local user.email \"manzoni.matteo@mailfence.com\" && git config --local user.signingkey 1759D5E5C62E8101"
alias git-setup-work="git config --local user.email \"matteo.manzoni@elmec.it\" && git config --local user.signingkey 8891A3B2F7F0E3AE"

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
