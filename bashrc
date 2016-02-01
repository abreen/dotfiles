if [[ -d "$HOME/bin" ]]; then
    export PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/lib" ]]; then
    export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
fi

if [[ -d "$HOME/lib/pkgconfig" ]]; then
    export PKG_CONFIG_PATH="$HOME/lib/pkgconfig:$PKG_CONFIG_PATH"
fi


if [[ `hostname` =~ \.bu\.edu$ ]]; then
    SYMBOL='∵'
else
    SYMBOL='∴'
fi

PS1="\[\e[1;31m\]$SYMBOL\[\e[0m\] "
