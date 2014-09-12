# .xinitrc

#if [ -e "$(which feh 2>/dev/null)" ]; then
#    feh --bg-fill "$(find -L ~/.wallpaper -type f | shuf -n 1)"
#elif [ -e "$(which xsetroot 2>/dev/null)" ]; then
#    xsetroot -solid '#222'
#fi

#exec xmonad
exec gnome-session
