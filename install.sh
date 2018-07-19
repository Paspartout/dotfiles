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
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

# install minpac for vim
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
nvim_minpacdir="$HOME/.config/nvim/pack/minpac/opt/minpac"
install_minpac $vim_minpacdir
install_minpac $nvim_minpacdir

# make neovim compatible with my vimrc
mkdir -p ~/.config/nvim
ln -f "$PWD/init.vim" ~/.config/nvim/init.vim
