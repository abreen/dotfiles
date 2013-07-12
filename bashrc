# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias motd="cat /etc/motd"
alias today="date +%F"

alias v="vim"
alias g="git"
alias l="ls"
