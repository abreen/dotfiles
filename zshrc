# User specific aliases and functions

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

HISTFILE=~/.histfile            # where to store history
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz compinit colors
compinit                        # turn on command completion
colors                          # turn on colors

PROMPT="%{$fg_no_bold[blue]%}%m %{$fg_no_bold[green]%}%~ %{$reset_color%}"
RPROMPT="%(?..%{$fg[red]%}%?%{$reset_color%})"

alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias motd="cat /etc/motd"
alias today="date +%F"

alias v="vim"
alias g="git"
alias l="ls"
alias la="ls -a"
alias ll="ls -al"

function dict() {
    DICTFILE="$HOME/.de-en.tsv"

    if [ ! -e "$DICTFILE" ]; then
        echo "$0: no dictionary file found" >&2
        return 1
    fi

    if [ -z "$1" ]; then
        echo "$0: missing search term" >&2
        return 2
    fi

    grep -i --color=always $1 "$DICTFILE" | less -R -X -F
}
