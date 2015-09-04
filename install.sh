#!/bin/sh

PWD=`pwd`

## install sh dotfiles
SHCONFDIR="$HOME/.sh"
rm -rf $SHCONFDIR
mkdir $SHCONFDIR
ln -f "$PWD/.mkshrc" ~/.mkshrc
ln -f "$PWD/.sh/aliases.sh" $SHCONFDIR/aliases.sh
ln -f "$PWD/.sh/functions.sh" $SHCONFDIR/functions.sh
ln -f "$PWD/.sh/git-prompt.mksh" $SHCONFDIR/git-prompt.mksh
ln -f "$PWD/.profile" ~/.profile
