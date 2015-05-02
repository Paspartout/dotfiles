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

## install mksh dotfiles
rm -rf ~/.mksh
mkdir ~/.mksh
ln -sf "$PWD/.mkshrc" ~/.mkshrc
ln -sf "$PWD/.mksh/aliases.sh" ~/.mksh/aliases.sh
ln -sf "$PWD/.mksh/exports.sh" ~/.mksh/exports.sh
ln -sf "$PWD/.mksh/functions.sh" ~/.mksh/functions.sh
ln -sf "$PWD/.mksh/git-prompt.mksh" ~/.mksh/git-prompt.mksh

## install tmux dotfiles
ln -sf "$PWD/.tmux.conf" ~/.tmux.conf
