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

# set up ATS compiler, if present
set PATSDIR /cs/coursedata/cs520/ATS2-017
if test -d $PATSDIR
    set -x PATSHOME $PATSDIR
    set -x PATSHOMERELOC $PATSHOME
    set -x PATSCC "$PATSHOME/bin/patscc"
    set -x PATSOPT "$PATSHOME/bin/patsopt"
    set PATH $PATH $PATSHOME/bin
end

# set up fish's colors to match Base16 theme
set fish_color_normal c5c8c6
set fish_color_command 81a2be
set fish_color_quote de935f
set fish_color_redirection b294bb
set fish_color_end b294bb
set fish_color_error cc6666
set fish_color_param 81a2be
set fish_color_comment 969896
set fish_color_match 8abeb7
set fish_color_search_match b294bb
set fish_color_operator 8abeb7
set fish_color_escape 8abeb7
set fish_color_cwd b5bd68

# set up LS_COLORS (Linux/OS X with Coreutils) and LSCOLORS (OS X/BSD)
set -x LS_COLORS 'di=34:ln=3;36:so=0:pi=0:ex=32:bd=35:cd=33:'
set -x LSCOLORS 'exgxxxxxcxfxdx'

# system-specific values at the end
set -x LS_COLORS "$LS_COLORS""fi=0:or=31:mi=4:ow=30;44"
set -x LSCOLORS "$LSCOLORS""abagaeae"

set -x EDITOR vim

set fish_greeting
