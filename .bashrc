#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

stty -ixon
shopt -s autocd
shopt -s histappend
shopt -s cmdhist


PS1='[\u@\h \W]\$ '
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh


[[ -f ~/.scripts/bash.command-not-found ]] && . ~/.scripts/bash.command-not-found


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
export PYTHONSTARTUP="~/.pythonrc"
export EDITOR=vim


# Alias Land
alias ls='ls --color=auto'
alias ll='ls -l --color=auto -v'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias kdesu='kdesu -n'
alias hcat='highlight --out-format=ansi'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias cat='(( RANDOM % 4 == 0 )) && cat ~/.meow || cat'
alias pikcopy='piknik -copy'
alias pikpaste='piknik -paste'
alias pikmove='piknik -move'
alias pikclean='piknik -copy < /dev/null'
alias pikdirpaste='piknik -paste | tar xzpvf -'
alias yt='youtube-viewer --player=vlc'
alias ytdl='youtube-dl --add-metadata -ic'
alias ytdla='youtube-d --add-metadata -xic'
alias vdif='vim -d'
alias rld='source ~/.bashrc'
alias suspnow='sudo echo \"Going sleepy....\" && /usr/bin/qdbus org.freedesktop.ScreenSaver /ScreenSaver Lock && sudo systemctl start systemd-suspend-only'

# Funktions
web_test() {
    if [[ $1 == "stop" ]]; then 
        lxc-stop web_test 
        if [[ $2 == "destroy" ]]; then
            lxc-destroy web_test
        fi
    else 
        lxc-ls -f | grep -iq web_test
        if [ $? -eq 1 ];then
            lxc-create -n web_test -t download -- --dist centos --release 7 --arch amd64
            echo "lxc.net.0.ipv4.address = 192.168.100.101/24" >> ~/.local/share/lxc/web_test/config 
            echo "lxc.net.0.ipv4.gateway = 192.168.100.1" >> ~/.local/share/lxc/web_test/config
            lxc-start web_test
            temp_pwd=$(head /dev/urandom | tr -dc a-za-z0-9 | head -c 15 ; echo '')
            echo "temp root user password: $temp_pwd"
            notify-send "LXC: web_test" "the new root temp password is: $temp_pwd" --icon=dialog-information
            
            lxc-attach -n web_test --clear-env -- chpasswd <<< "root:$temp_pwd"
            lxc-attach -n web_test --clear-env -- mkdir /etc/personal_pki
            echo "Waiting LXC to come alive..."
            sleep 15
            lxc-attach -n web_test --clear-env -- yum install -y httpd vim openssh-server
            lxc-attach -n web_test --clear-env -- systemctl enable --now sshd 
            lxc-attach -n web_test --clear-env -- systemctl enable --now httpd 
            lxc-attach -n web_test --clear-env -- yum install -y epel-release
            lxc-attach -n web_test --clear-env -- rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
            lxc-attach -n web_test --clear-env -- yum install -y php72w php72w-dom php72w-mbstring php72w-gd php72w-pdo php72w-json php72w-xml php72w-zip php72w-curl php72w-pear php72w-intl setroubleshoot-server bzip2
            lxc-attach -n web_test --clear-env -- sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
            echo "lxc.mount.entry = /home/matteo/Documents/Security/Certs/web_test etc/personal_pki none bind 0 0" >> ~/.local/share/lxc/web_test/config
            
            lxc-attach -n web_test --clear-env -- systemctl restart httpd
            lxc-attach -n web_test --clear-env -- systemctl restart sshd

            sshpass -p "$temp_pwd" scp -r -oUserKnownHostsFile=/dev/null -oGlobalKnownHostsFile=/dev/null -oStrictHostKeyChecking=no /home/matteo/Documents/Progetti/lxc-web/ root@web-test.local:/var/www/html

            lxc-stop web_test

        fi
        lxc-ls -f | grep -i web_test | grep -iq RUNNING
        if [ $? -ne 0 ]; then 
            
            lxc-start web_test
        fi 
        lxc-console -n web_test -t 0
    fi 
}

breakshit() {
    if [[ $1 == "stop" ]]; then
        lxc-stop breakshit
        lxc-destroy breakshit
    else 
        lxc-ls -f | grep -iq breakshit 
        if [ $? -eq 1 ];then
            lxc-create -n breakshit -t download -- --dist archlinux --release current --arch amd64 
            echo "lxc.net.0.ipv4.address = 192.168.100.10/24" >> ~/.local/share/lxc/web_test/config 
            echo "lxc.net.0.ipv4.gateway = 192.168.100.1" >> ~/.local/share/lxc/web_test/config
            temp_pwd=$(head /dev/urandom | tr -dc a-za-z0-9 | head -c 15 ; echo '')
            echo "temp root user password: $temp_pwd"
            notify-send "breakshit lxc" "the new root temp password is: $temp_pwd" --icon=dialog-information
            
            lxc-start breakshit
            lxc-attach -n breakshit --clear-env -- chpasswd <<< "root:$temp_pwd"
        fi
        lxc-ls -f | grep -i breakshit | grep -iq RUNNING
        if [ $? -ne 0 ]; then 
            lxc-start breakshit
        fi 
        
        lxc-console -n breakshit -t 0        
    fi 
}

pikparamcopy() {
    echo "$*" | piknik -copy
}
pikfilecopy() {
    piknik -copy < "$1"
}
pikdircopy() {
    tar czpvf - "${1:-.}" | piknik -copy
}
mailwho() {
    curl cli.fyi/"$1"
}
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}


# TMUX POWER
if [[ $DISPLAY ]]; then
    # If not running interactively, do not do anything
    [[ $- != *i* ]] && return
    [[ -z "$TMUX" ]] && exec tmux
fi
