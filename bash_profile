source $HOME/.bashrc

alias edit="$EDITOR"

alias ls='ls --color=auto --indicator-style=none --group-directories-first'
alias ll='ls -lh'

function shorten() {
    long=$1
    short=$2

    alias $short=$long
}

shorten shorten s

s ls l
s top t
s vim v
s emacs e
s pwd p
s cd '~'
s exit q
s python3 3

s git g
alias gp='g pull'
alias gP='g push'
alias gd='g diff'
alias gc='g commit -m'
alias ga='g add'
alias gs='g status'

unalias s

function j() {
    JAVA_REGEX='(.*)\.(java)?'

    if [[ $1 =~ $JAVA_REGEX ]]; then
        class=${BASH_REMATCH[1]}
    else
        class=$1
    fi

    echo "compiling $class class..."

    javac $class.java
    e=$?

    if [[ $e != 0 ]]; then
        rm -f *.class
        return $e
    fi

    echo "running $class class..."

    java $class
    e=$?

    rm -f *.class

    if [[ $e != 0 ]]; then
        return $e
    fi
}
