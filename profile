# vim: et:ts=2:sw=2

# (by now, /etc/profile has already been executed)

# user-specific environment and startup programs
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/lib" ]]; then
  export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
fi

if [[ -d "$HOME/lib/pkgconfig" ]]; then
  export PKG_CONFIG_PATH="$HOME/lib/pkgconfig:$PKG_CONFIG_PATH"
fi

if [[ -d /usr/local/lib/haxe/std ]]; then
  export HAXE_STD_PATH=/usr/local/lib/haxe/std
fi

if which man 1>/dev/null 2>&1; then
  export MANPATH="$(man --path)"
fi

# if Homebrew (OS X) is used, and GNU Coreutils are installed, use them first
HOMEBREW_PREFIX=/usr/local/opt

if [[ -d "$HOMEBREW_PREFIX/coreutils/libexec/gnubin" ]]; then
  export GNUBIN="$HOMEBREW_PREFIX/coreutils/libexec/gnubin"
  export PATH="$GNUBIN:$PATH"
fi

if [[ -d "$HOMEBREW_PREFIX/coreutils/libexec/gnuman" ]]; then
  export GNUMAN="$HOMEBREW_PREFIX/coreutils/libexec/gnuman"

  if [[ -z "$MANPATH" ]]; then
    export MANPATH="$GNUMAN"
  else
    export MANPATH="$GNUMAN:$MANPATH"
  fi
fi
