export EDITOR='vim'

# set up local directories, if necessary
if [[ -d "$HOME/bin" ]]; then
    export PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/lib" ]]; then
    export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
fi

if [[ -d "$HOME/lib/pkgconfig" ]]; then
    export PKG_CONFIG_PATH="$HOME/lib/pkgconfig:$PKG_CONFIG_PATH"
fi

if which man 1>/dev/null; then
    export MANPATH="$(man --path)"
fi

# if Homebrew (OS X) is used, and GNU Coreutils are installed, use them first
HOMEBREW_PREFIX="/usr/local"

if [[ -e "$HOMEBREW_PREFIX/Cellar" ]]; then
    export GNUBIN="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin"
    export GNUMAN="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman"

    if [[ -d "$GNUBIN" ]]; then
        export PATH="$GNUBIN:$PATH"
    fi

    if [[ -z "$MANPATH" ]]; then
        export MANPATH="$GNUMAN"
    else
        export MANPATH="$GNUMAN:$MANPATH"
    fi
fi

# set up LS_COLORS (Linux/OS X with Coreutils) and LSCOLORS (OS X/BSD)
export LS_COLORS='di=34:ln=3;36:so=0:pi=0:ex=32:bd=35:cd=33:'
export LSCOLORS='exgxxxxxcxfxdx'

# system-specific values at the end
export LS_COLORS="$LS_COLORS""fi=0:or=31:mi=4:ow=30;44"
export LSCOLORS="$LSCOLORS""abagaeae"

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

function abbrev() {
    str=`echo $1 | tr [:upper:] [:lower:] | tr -d [:punct:]`

    len=${#str}

    low=1
    mid=$(($len/2))
    high=$len

    echo $str | cut -c $low,$mid,$high
}

function color() {
    c=`echo $1 | md5sum | cut -c 1`

    case $c in
    0) echo $YELLOW ;;
    1) echo $RED ;;
    2) echo $GREEN ;;
    3) echo $YELLOW ;;
    4) echo $BLUE ;;
    5) echo $MAGENTA ;;
    6) echo $CYAN ;;
    7) echo $RED_ ;;
    8) echo $RED ;;
    9) echo $GREEN ;;
    a) echo $YELLOW ;;
    b) echo $BLUE ;;
    c) echo $MAGENTA ;;
    d) echo $CYAN ;;
    e) echo $RED_ ;;
    f) echo $MAGENTA ;;
    esac
}

if [[ $HOSTNAME =~ csa([0-9]+)\.bu\.edu ]]; then
    num="${BASH_REMATCH[1]}"
    SYMBOL=`color $HOSTNAME`"bu$num$RESET"
else
    SYMBOL=`color $HOSTNAME``abbrev $HOSTNAME`$RESET
fi

function prompt() {
    if [[ $? != 0 ]]; then
        PS1="$RED_"`echo -n ‼︎`"$RESET $BLACK_"
    else
        PS1="$SYMBOL $BLACK_"
    fi

    path=`echo $PWD | sed "s%$HOME%~%" | sed 's/\.\.\./⋮/'`

    PS1+="$path$RESET "
}

export PROMPT_COMMAND=prompt
