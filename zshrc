# vim: et:ts=2:sw=2

export LS_COLORS='di=34:ln=3;36:so=0:pi=0:ex=32:bd=35:cd=33:'

export CLICOLOR=1
export EDITOR=vim

if which exa >/dev/null; then
    alias ls='exa'
    alias ll='exa -la'
    alias L='exa -l -T -L 2'
else
    alias ll='ls -lhac'
fi

alias l=ls
alias v=vim
alias 3=python3

alias g=git
alias gp='git pull'
alias gP='git push'
alias gd='git diff'
alias gC='git commit -m'
alias gc='git checkout'
alias ga='git add'
alias gs='git status'
alias gl='git log'

PROMPT='%F{green}%m%f:%F{blue}%1d%f '

# run environment-specific configs
#. .bashrc-work
