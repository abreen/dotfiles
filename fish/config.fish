if status --is-login; and test -f $HOME/bin
    set PATH $PATH $HOME/bin
end

# set up Plan 9, if present
set PLAN9 /usr/local/plan9
if test -d $PLAN9
    set -x PLAN9 $PLAN9
    set PATH $PATH $PLAN9/bin
end

# set up GNU coreutils, if present
set GNUBIN /usr/local/opt/coreutils/libexec/gnubin
if test -d $GNUBIN
    set PATH $PATH $GNUBIN
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

# set up LS_COLORS (Linux) and LSCOLORS (OS X)
set -x LS_COLORS 'di=34:ln=36:so=0:pi=0:ex=32:bd=35:cd=33:'
set -x LSCOLORS 'exgxxxxxcxfxdx'

# system-specific values at the end
set -x LS_COLORS "$LS_COLORS""fi=0:or=31:mi=4:ow=30;44"
set -x LSCOLORS "$LSCOLORS""abagaeae"

set -x EDITOR vim

set fish_greeting
