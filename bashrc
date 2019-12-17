# vim: et:ts=2:sw=2

# system-wide aliases and functions
if [[ -f /etc/bashrc ]]; then
  # bash does not automatically execute /etc/bashrc as it does /etc/profile
  # for login shells; this is why we do it here
  . /etc/bashrc
fi

# set up LS_COLORS (Linux/OS X with Coreutils) and LSCOLORS (OS X/BSD)
export LS_COLORS='di=34:ln=3;36:so=0:pi=0:ex=32:bd=35:cd=33:'
export LSCOLORS='exgxxxxxcxfxdx'

# system-specific values at the end
export LS_COLORS="$LS_COLORS""fi=0:or=31:mi=4:ow=30;44"
export LSCOLORS="$LSCOLORS""abagaeae"

export EDITOR=vim

alias ls='ls --color=auto'
alias l=ls
alias ll='ls -lh'
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

# set up prompt

# _ designates "bold" variant of color
BLACK="\[\e[30m\]"
BLACK_="\[\e[30;1m\]"
RED="\[\e[31m\]"
RED_="\[\e[31;1m\]"
GREEN="\[\e[32m\]"
GREEN_="\[\e[32;1m\]"
YELLOW="\[\e[33m\]"
YELLOW_="\[\e[33;1m\]"
BLUE="\[\e[34m\]"
BLUE_="\[\e[34;1m\]"
MAGENTA="\[\e[35m\]"
MAGENTA_="\[\e[35;1m\]"
CYAN="\[\e[36m\]"
CYAN_="\[\e[36;1m\]"
WHITE="\[\e[37m\]"
WHITE_="\[\e[37;1m\]"

RESET="\[\e[0m\]"

BOLD="\[\e[1m\]"
ITALIC="\[\e[3m\]"

BLINK_ON="\[\e[5m\]"
BLINK_OFF="\[\e[25m\]"

INVERTED="\[\e[7m\]"

function branch() {
  output=$(git branch 2>/dev/null | grep '^\*' | tail -c +3)
  if [[ ! -z "$output" ]]; then
    echo -n "$RESET@$MAGENTA$output"
  fi
}

function prompt() {
  if [[ $? != 0 ]]; then
    PS1="$GREEN\h$RESET:$BLUE\W$(branch)$RESET "
  else
    PS1="$GREEN\h$RESET:$BLUE\W$(branch)$RESET "
  fi
}

export PROMPT_COMMAND=prompt

shopt -s nullglob

# run environment-specific configs
#. .bashrc-work
