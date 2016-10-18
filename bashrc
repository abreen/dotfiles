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

alias edit="$EDITOR"

alias l=ls
alias ll='ls -lh'
alias v=vim
alias p=pwd
alias '~'=cd
alias q=exit
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

function _() {
  which python3 2>&1 1>/dev/null

  if [[ $? -ne 0 ]]; then
    echo "$0: ${FUNCNAME[0]}: could not find Python 3 interpreter"
    return 1
  fi

  python3 -B <<PYTHON
from functools import *
def listize(f):
    def g(*args):
        return list(f(*args))
    return g
map = listize(map)
filter = listize(filter)
print($*)
PYTHON

  return "$?"
}

function _note_listall() {
  find "$NOTES_DIR" -not -path '*/\.' -type f \( ! -iname ".*" \) -a \( ! -name "*~" \) | sort -r
}

function note() {
  NAME="${FUNCNAME[0]}"
  DAY="$(date +%Y-%m-%d)"
  TIME="$(date +%H:%M:%S)"

  if [[ -z "$NOTES_DIR" ]]; then
    echo "$NAME: error: \$NOTES_DIR is not set"
    return 2
  else
    mkdir -p "$NOTES_DIR"
    NOTES_DIR_LEN=$(echo "$NOTES_DIR" | wc -m)
    NOTES_DIR_LEN=$(($NOTES_DIR_LEN + 1))
  fi

  if [[ -z "$1" ]]; then
    action=help
  else
    action="$1"
  fi

  if [[ "$action" = new ]] || [[ "$action" = n ]]; then
    TODAY_DIR="$NOTES_DIR/$DAY"
    mkdir -p "$TODAY_DIR"
    vim "$TODAY_DIR/$TIME.md"

  elif [[ "$action" = list ]] || [[ "$action" = l ]]; then
    head -q -n 1 $(_note_listall) | cut -c -60 | paste -d ' ' <(_note_listall | cut -c $NOTES_DIR_LEN-) - | nl -s '. ' -w 3

  elif [[ "$action" = edit ]] || [[ "$action" = e ]]; then
    if [[ -z "$2" ]]; then
      echo "$NAME: error: specify a note number (from $NAME list)"
      return 4
    fi

    path="$(_note_listall | sed -n "${2}p")"

    if [[ -z "$path" ]]; then
      echo "$NAME: error: invalid note number (out of range?)"
      return 5
    fi

    "$EDITOR" "$path"

  elif [[ "$action" = match ]] || [[ "$action" = m ]]; then
    if [[ -z "$2" ]]; then
      echo "$NAME: error: specify a regex to use"
      return 3
    fi

    _note_listall | xargs grep --color=never -H "$2" | cut -c $NOTES_DIR_LEN-

  elif [[ "$action" = help ]] || [[ "$action" = '-h' ]] || [[ "$action" = '--help' ]]; then
    echo "usage: $NAME ACTION [ARGS]"
    echo "       $NAME new"
    echo "       $NAME list"
    echo "       $NAME match REGEX"
    echo "       $NAME help"

  else
    echo "$NAME: error: invalid action"
    return 1

  fi
}

alias n=note

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

for rc in $HOME/.bashrc-*; do
  if [[ "${rc##*.}" = swp ]] || [[ "${rc:(-1):1}" = '~' ]]; then
    # skip Vim swap files or backup files
    continue
  fi

  . "$rc"
done
