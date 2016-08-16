export EDITOR=vim

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

if [[ -d "/usr/local/lib/haxe/std" ]]; then
    export HAXE_STD_PATH="/usr/local/lib/haxe/std"
fi

if which man 1>/dev/null; then
    export MANPATH="$(man --path)"
fi

# if Homebrew (OS X) is used, and GNU Coreutils are installed, use them first
HOMEBREW_PREFIX="/usr/local/opt"

if [[ -d "$HOMEBREW_PREFIX/coreutils/libexec/gnubin" ]]; then
    export GNUBIN="$HOMEBREW_PREFIX/coreutils/libexec/gnubin"
    export PATH="$GNUBIN:$PATH"
fi

if [[ -d "$HOMEBREW_PREFIX/coreutils/libexec/gnuman" ]]; then
    export GNUMAN="$HOMEBREW_PREFIX/coreutils/libexec/gnuman"

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
