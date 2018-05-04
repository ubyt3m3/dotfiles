ID=`id -u`
if [[ "${ID}" == 0 ]]; then
   PS1='\]\e[01;35m\]root\]\e[00;31m\]@\h\[\e[00;37m\][\[\e[01;34m\]\w\[\e[00;37m\]]\n\[\e[47m\]\[\e[1;30m\]#\[\033[00m\] '
else
   PS1='\[\e[38;5;106m\]\A \[\e[38;5;210m\]\u\[\e[38;5;229m\]@\[\e[38;5;220m\]\h\[\e[38;5;252m\][\[\e[38;5;69m\]\w\[\e[38;5;252m\]]\n\[\e[47m\]\[\e[38;5;232m\]$\[\e[00m\] '
   #PS1='\[\e[00;32m\]\A \[\e[00;91m\]\u\[\e[01;93m\]@\h\[\e[00;37m\][\[\e[01;34m\]\w\[\e[00;37m\]]\n\[\e[47m\]\[\e[1;30m\]$\[\e[00m\] '
fi

# Slackware default for $LANG is en_US
# To support displaying Japanese while still getting 
# messages in English, set below two env variables
export LANG=ja_JP.UTF-8
export LC_MESSAGES=en_US
export EDITOR=nvim
#export MPD_HOST=/home/ubyt3m3/.config/mpd/socket

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Turn off system bell
if [ -n "$DISPLAY" ]; then
    xset b off
fi
set -o vi
