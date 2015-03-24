if status --is-login; and test -f $HOME/bin
    set PATH $PATH $HOME/bin
end

set PLAN9 /usr/local/plan9
if test -d $PLAN9
    set -x PLAN9 $PLAN9
    set PATH $PATH $PLAN9/bin
end

set GNUBIN /usr/local/opt/coreutils/libexec/gnubin
if test -d $GNUBIN
    set PATH $PATH $GNUBIN
end

if test -f $HOME/.config/base16-shell/base16-tomorrow.dark.sh;
    eval sh $HOME/.config/base16-shell/base16-tomorrow.dark.sh
end

set -x EDITOR vim

set fish_greeting
