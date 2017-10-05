#!/bin/sh
set -e

shdir="$HOME/.sh"
mkdir -p "$shdir"

ln -f "$PWD/.sh/aliases.sh" "$shdir"/
ln -f "$PWD/.sh/functions.sh" "$shdir"/
ln -f "$PWD/.kshrc" ~/.kshrc
ln -f "$PWD/.profile" ~/.profile
ln -f "$PWD/.tmux.conf" ~/.tmux.conf
ln -f "$PWD/.vimrc" ~/.vimrc

# install minpac
minpacdir="$HOME/.vim/pack/minpac"
if [ -d $minpacdir ]
then
	echo "$minpacdir already exists, skipping minpac installation"
else
	echo "installing minpac"
	mkdir -p ~/.vim/pack/minpac/opt
	git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
fi

# make neovim compatible with my vimrc
mkdir -p ~/.config/nvim
ln -f "$PWD/init.vim" ~/.config/nvim/init.vim

