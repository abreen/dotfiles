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

# prepare shell for 256 colors used by Base16
if test -f $HOME/.config/base16-shell/base16-tomorrow.dark.sh
    eval sh $HOME/.config/base16-shell/base16-tomorrow.dark.sh
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

set -x EDITOR vim

set fish_greeting
