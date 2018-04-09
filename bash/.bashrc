ID=`id -u`
if [[ "${ID}" -eq 0 ]]; then
   PS1='\]\e[01;35m\]root\]\e[00;31m\]@\h\[\e[00;37m\][\[\e[01;34m\]\w\[\e[00;37m\]]\n\[\e[47m\]\[\e[1;30m\]#\[\033[00m\] '
else
   PS1='\[\e[00;32m\]\A \[\e[00;91m\]\u\[\e[01;93m\]@\h\[\e[00;37m\][\[\e[01;34m\]\w\[\e[00;37m\]]\n\[\e[47m\]\[\e[1;30m\]$\[\e[00m\] '
fi

export EDITOR=nvim
export MPD_HOST=/home/ubyt3m3/.config/mpd/socket

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Turn off system bell
if [ -n "$DISPLAY" ]; then
    xset b off
fi
set -o vi
