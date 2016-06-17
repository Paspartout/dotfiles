#!/bin/sh

shdir="$HOME/.sh"
mkdir -p $shdir

ln -f "$PWD/.sh/aliases.sh" $shdir/
ln -f "$PWD/.sh/functions.sh" $shdir/
ln -f "$PWD/.kshrc" ~/.kshrc
ln -f "$PWD/.profile" ~/.profile
ln -f "$PWD/.tmux.conf" ~/.tmux.conf
