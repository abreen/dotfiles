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
s edit e
s pwd p
s cd '~'
s exit q
s python3 3

s git g
alias gp='g pull'
alias gP='g push'
alias gd='g diff'
alias gc='g commit -m'
alias gC='g checkout'
alias ga='g add'
alias gs='g status'

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

    if [[ $e -ne 0 ]]; then
        rm -f *.class
        return $e
    fi

    echo "running $class class..."

    java $class
    e=$?

    rm -f *.class

    if [[ $e -ne 0 ]]; then
        return $e
    fi
}

function _() {
    which python3 2>&1 1>/dev/null

    if [[ $? -ne 0 ]]; then
        echo $0: ${FUNCNAME[0]}: could not find Python 3 interpreter
        return 1
    fi

    python3 -B <<PYTHON
from functools import *

def listize(f):
    def g(*args):
        return list(f(*args))
    return g

map = listize(map)
filter = listize(filter)

print($*)
PYTHON

    return $?
}

function _note_listall() {
    find "$NOTES_DIR" -not -path '*/\.' -type f \( ! -iname ".*" \) -a \( ! -name "*~" \) | sort -r
}

function note() {
    NAME=${FUNCNAME[0]}
    DAY=`date +%Y-%m-%d`
    TIME=`date +%H:%M:%S`

    if [[ -z "$NOTES_DIR" ]]; then
        echo "$NAME: error: \$NOTES_DIR is not set"
        return 2
    fi

    if [[ -z "$1" ]]; then
        action="help"
    else
        action="$1"
    fi

    if [[ "$action" = "new" ]] || [[ "$action" = "n" ]]; then
        TODAY_DIR="$NOTES_DIR/$DAY"
        mkdir -p $TODAY_DIR
        vim "$TODAY_DIR/$TIME.md"

    elif [[ "$action" = "list" ]] || [[ "$action" = "l" ]]; then
        _note_listall | nl -s '. ' -w 3

    elif [[ "$action" = "edit" ]] || [[ "$action" = "e" ]]; then
        if [[ -z "$2" ]]; then
            echo "$NAME: error: specify a note number (from $NAME list)"
            return 4
        fi

        path=`_note_listall | sed -n "${2}p"`

        if [[ -z "$path" ]]; then
            echo "$NAME: error: invalid note number (out of range?)"
            return 5
        fi

        "$EDITOR" "$path"

    elif [[ "$action" = "match" ]] || [[ "$action" = "m" ]]; then
        if [[ -z "$2" ]]; then
            echo "$NAME: error: specify a regex to use"
            return 3
        fi

        grep -r "$2" "$NOTES_DIR"

    elif [[ "$action" = "help" ]] || [[ "$action" = "-h" ]] || [[ "$action" = "--help" ]]; then
        echo "usage: $NAME ACTION [ARGS]"
        echo "       $NAME new"
        echo "       $NAME list"
        echo "       $NAME match REGEX"
        echo "       $NAME help"
    else
        echo "$NAME: error: invalid action"
        return 1

    fi
}

s note n

unalias s
