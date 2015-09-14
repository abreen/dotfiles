if status --is-login; and test -f $HOME/bin
    set -x PATH $PATH $HOME/bin
end

if which man 1>/dev/null
    set -x MANPATH (man --path)
end

set HOMEBREW_PREFIX /usr/local
if test -d "$HOMEBREW_PREFIX/Cellar"
    # Homebrew is present; try to add GNU Coreutils to path
    set GNUBIN "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin"
    set GNUMAN "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman"
    if test -d $GNUBIN
        set -x PATH $GNUBIN $PATH
        set -x MANPATH $GNUMAN $MANPATH
    end
end

# set up LS_COLORS (Linux/OS X with Coreutils) and LSCOLORS (OS X/BSD)
set -x LS_COLORS 'di=34:ln=3;36:so=0:pi=0:ex=32:bd=35:cd=33:'
set -x LSCOLORS 'exgxxxxxcxfxdx'

# system-specific values at the end
set -x LS_COLORS "$LS_COLORS""fi=0:or=31:mi=4:ow=30;44"
set -x LSCOLORS "$LSCOLORS""abagaeae"

set -x EDITOR vim

set fish_greeting
