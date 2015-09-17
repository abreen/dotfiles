autoload -U compinit
compinit

autoload -U colors
colors

hname() {
    if hostname | grep 'wireless' 1>/dev/null; then
        echo -n 'W'
    else
        echo -n "$(hostname)"
    fi
}

setopt PROMPT_SUBST
PROMPT="%{$fg_no_bold[green]%}$(hname)%{$reset_color%} %{$fg_no_bold[blue]%}%~%{$reset_color%} "

export PATH="$PATH:$HOME/bin"

if which man 1>/dev/null; then
    export MANPATH="$(man --path)"
fi

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
