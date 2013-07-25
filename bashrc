# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

hostname=`hostname`

if [ `expr "$hostname" : "ice*"` -ne 0 ]; then
  PS1='\[\e[44m\e[37m\e[1m\]nice\[\e[2m\] · \W → \[\e[0m\] '
elif [ `hostname` = "csa2.bu.edu" ]; then
  PS1='\[\e[42m\e[37m\e[1m\]\h · \W → \[\e[0m\] '
elif [ `hostname` = "janeway" ]; then
  PS1='\[\e[45m\e[37m\e[1m\]\h · \W → \[\e[0m\] '
else
  PS1='\[\e[40m\e[1m\]tuvok\[\e[2m\] · \W → \[\e[0m\] '
fi

unset hostname

alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias motd="cat /etc/motd"
alias today="date +%F"

alias v="vim"
alias g="git"
alias l="ls"
