#
# ~/.bash_profile
#

export EDITOR=nvim
export TERMINAL=termite

# x
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

[[ -f ~/.bashrc ]] && . ~/.bashrc

