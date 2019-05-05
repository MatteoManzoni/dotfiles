#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -f ~/.exportsrc ]] && . ~/.exportsrc


if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx -- -keeptty > ~/.xorg.log 2>&1
fi

#when Wayland will work well
#export XDG_SESSION_TYPE=wayland && export $(dbus-launch) && startplasmacompositor > ~/.wayland.log 2>&1
