#
# ~/.bash_profile
#

export GOPATH=$HOME/Programs/go
export VAGRANT_HOME=$HOME/Documents/Virtual\ Machines/KVM/Vagrant/
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1
export PATH="$PATH:$HOME/Programs/bin"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx -- -keeptty > ~/.xorg.log 2>&1
fi

#when Wayland will work well
#export XDG_SESSION_TYPE=wayland && export $(dbus-launch) && startplasmacompositor > ~/.wayland.log 2>&1
