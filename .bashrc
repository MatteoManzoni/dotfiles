#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

if [ -f "~/.scripts/bash.command-not-found"  ]; then
    source "~/.scripts/bash.command-not-found"
fi

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias cat='(( RANDOM % 4 == 0 )) && cat ~/.meow || cat'
export GREP_COLOR="1;32"
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
alias ls='ls --color=auto'
alias ll='ls -l --color=auto -v'

alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

alias kdesu='kdesu -n'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

export PYTHONPATH="$PYTHONPATH:~/.vim/bundle/ropevim/:~/.vim/bundle/ropemode/:~/.vim/bundle/rope/"
export PYTHONSTARTUP="~/.pythonrc"

export EDITOR=vim

HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
shopt -s cmdhist
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

#piknik related
pikparamcopy() {
    echo "$*" | piknik -copy
}
pikfilecopy() {
    piknik -copy < "$1"
}

alias pikcopy='piknik -copy'
alias pikpaste='piknik -paste'
alias pikmove='piknik -move'

alias pikclean='piknik -copy < /dev/null'

pikdircopy() {
    tar czpvf - "${1:-.}" | piknik -copy
}

alias pikdirpaste='piknik -paste | tar xzpvf -'

# TMUX POWER
if [[ $DISPLAY ]]; then
    # If not running interactively, do not do anything
    [[ $- != *i* ]] && return
    [[ -z "$TMUX" ]] && exec tmux
fi

mailwho() {
    curl cli.fyi/"$1"
}
