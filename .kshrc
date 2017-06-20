# My personal kshrc file
#
# Some things were used from Yamagi's dotfiles. See:
# https://github.com/Yamagi/dotfiles/blob/master/.mkshrc

# settings
HISTFILE=~/.ksh_history
HISTSIZE=50000

# prompt
LDIRPATH=/tmp/LDIR

# TODO: fix prompt
prompt() {
	echo $PWD > $LDIRPATH
	typeset dir

	if [[ $PWD == $HOME* ]]
	then
		dir=${PWD#$HOME}
		dir=~$dir
	else
		dir=$PWD
	fi

	if [[ ${#dir} -gt 40 ]]
	then
		dir=../$(basename "$PWD")
	fi

	echo "[33m$dir[00m $ "
}


PS1='$(prompt)'
PS2='> '
PS3='? '
PS4='[$EPOCHREALTIME] '

set -o vi vi-tabcomplete

# source aliases, exports and functions
# TODO: Consider merging these on install/update into one file
# TODO: Consider using ~/.profile or ~/.exports as it's indipendent from shell
. ~/.sh/aliases.sh
. ~/.sh/functions.sh

[ -f "$LDIRPATH" ] && cd "$(cat $LDIRPATH)"
