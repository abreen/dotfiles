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
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
CLEAR="\[\e[0m\]"

if [[ `hostname` =~ csa([0-9]+)\.bu\.edu ]]; then
    NUM="${BASH_REMATCH[1]}"
    SYMBOL=$NUM'▶︎'
else
    SYMBOL='▶︎'
fi

function prompt() {
    if [[ $? = 0 ]]; then
        PS1="$GREEN$SYMBOL$CLEAR $MAGENTA\w$CLEAR "
    else
        PS1="$RED$SYMBOL$CLEAR $MAGENTA\w$CLEAR "
    fi
}

export PROMPT_COMMAND=prompt
