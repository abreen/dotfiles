autoload -U compinit
compinit

setopt correctall

autoload -U colors
colors

export PS1="%{$fg_no_bold[green]%}%m%{$reset_color%} %{$fg_no_bold[blue]%}%~%{$reset_color%} "
