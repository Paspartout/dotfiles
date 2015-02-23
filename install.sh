#!/bin/sh

PWD=`pwd`

## install vim dotfiles
rm -rf ~/.vim
ln -sf "$PWD/.vimrc" ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
vim +PluginInstall +qall

## install zsh dotfiles
rm -rf ~/.zsh
mkdir ~/.zsh
ln -sf "$PWD/.zshrc" ~/.zshrc
ln -sf "$PWD/.zsh/aliases.zsh" ~/.zsh/aliases.zsh
ln -sf "$PWD/.zsh/exports.zsh" ~/.zsh/exports.zsh
ln -sf "$PWD/.zsh/functions.zsh" ~/.zsh/functions.zsh
git clone https://github.com/tarjoilija/zgen ~/.zsh/zgen
zsh -i -c exit

## install tmux dotfiles
ln -sf "$PWD/.tmux.conf" ~/.tmux.conf

## install taskwarrior dotfiles
ln -sf "$PWD/.taskrc" ~/.taskrc
