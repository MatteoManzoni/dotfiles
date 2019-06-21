#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -f ~/.exportsrc ]] && . ~/.exportsrc


if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx -- -keeptty > ~/.xorg.log 2>&1
    
    #when Wayland will work well
    #XDG_SESSION_TYPE=wayland dbus-run-session startplasmacompositor 
fi



