#!/bin/sh

PWD=`pwd`

## install sh dotfiles
SHCONFDIR="$HOME/.sh"
rm -rf $SHCONFDIR
mkdir $SHCONFDIR
ln -f "$PWD/.sh/aliases.sh" $SHCONFDIR/
ln -f "$PWD/.sh/functions.sh" $SHCONFDIR/
ln -f "$PWD/.mkshrc" ~/.mkshrc
ln -f "$PWD/.profile" ~/.profile

