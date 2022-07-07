#!/bin/sh
set -e

shdir="$HOME/.sh"
mkdir -p "$shdir"

ln -f "$PWD/.sh/aliases.sh" "$shdir"/
ln -f "$PWD/.sh/functions.sh" "$shdir"/
ln -f "$PWD/.sh/z.sh" "$shdir"/
ln -f "$PWD/.kshrc" ~/.kshrc
ln -f "$PWD/.bashrc" ~/.bashrc
ln -f "$PWD/.profile" ~/.profile
ln -f "$PWD/.tmux.conf" ~/.tmux.conf
ln -f "$PWD/.vimrc" ~/.vimrc

# install fzf
if [ -d "$HOME/.fzf" ]
then
	echo "$HOME/.fzf already exists, skipping fzf installation"
else
	git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
	$HOME/.fzf/install
fi

# VIM
# install minpac for vim
# TODO: Maybe remove/depricate good old vim?
install_minpac() {
	if [ -d "$1" ]
	then
		echo "$1 already exists, skipping minpac installation"
	else
		echo "installing minpac"
		mkdir -p $(dirname "$1")
		git clone https://github.com/k-takata/minpac.git "$1"
	fi
}
vim_minpacdir="$HOME/.vim/pack/minpac"
install_minpac $vim_minpacdir

# NVIM
# make neovim compatible with my vimrc
mkdir -p ~/.config/nvim
ln -f "$PWD/init.lua" ~/.config/nvim/init.lua

git clone --depth=1 https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim


