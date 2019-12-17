# vim: et:ts=2:sw=2

# (by now, /etc/profile has already been executed)

# user-specific environment and startup programs
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi
