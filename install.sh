#!/bin/sh

PWD=`pwd`

## install vim dotfiles
rm -rf ~/.vim
mkdir -p ~/.vim/undos
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps
ln -sf "$PWD/.vimrc" ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
vim +PluginInstall +qall

## install sh dotfiles
SHCONFDIR="$HOME/.sh"
rm -rf $SHCONFDIR
mkdir $SHCONFDIR
# TODO: Proablly add rc file for bash
ln -sf "$PWD/.mkshrc" ~/.mkshrc
ln -sf "$PWD/.sh/aliases.sh" $SHCONFDIR/aliases.sh
ln -sf "$PWD/.sh/exports.sh" $SHCONFDIR/exports.sh
ln -sf "$PWD/.sh/functions.sh" $SHCONFDIR/functions.sh
ln -sf "$PWD/.sh/git-prompt.mksh" $SHCONFDIR/git-prompt.mksh

## install tmux dotfiles
ln -sf "$PWD/.tmux.conf" ~/.tmux.conf
