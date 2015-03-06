if status --is-login; and test -f $HOME/bin
    set PATH $PATH $HOME/bin
end

set -x EDITOR vim

set fish_greeting
