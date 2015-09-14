autoload -U compinit
compinit

setopt correctall

autoload -U colors
colors

export PS1="%{$fg_no_bold[green]%}%m%{$reset_color%} %{$fg_no_bold[blue]%}%~%{$reset_color%} "

export PATH="$PATH:$HOME/bin"

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

export EDITOR="vim"

alias ls='ls --color=auto --indicator-style=none --group-directories-first'
alias ll='ls -lh'
