# User specific aliases and functions

if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

autoload -Uz compinit colors
compinit                        # turn on command completion
colors                          # turn on colors

PROMPT="%{$fg_no_bold[blue]%}%m %{$fg_no_bold[green]%}%~ %{$reset_color%}"
RPROMPT="%(?..%{$fg[red]%}%?%{$reset_color%})"

if [ "$TERM" = "vt220" ]; then
    unsetopt prompt_sp
    stty rows 24
    stty cols 79
fi
