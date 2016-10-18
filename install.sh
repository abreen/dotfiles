#!/bin/bash
# vim: et:ts=2:sw=2

FILES='profile bash_profile bashrc vimrc'

DIRNAME=$(dirname $(realpath "$0"))

for file in $FILES; do
  ln -s "$DIRNAME/$file" "$HOME/.$file"
done
