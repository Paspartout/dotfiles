man() {
	env LESS_TERMCAP_mb=$'\E[01;31m' \
	LESS_TERMCAP_md=$'\E[01;38;5;74m' \
	LESS_TERMCAP_me=$'\E[0m' \
	LESS_TERMCAP_se=$'\E[0m' \
	LESS_TERMCAP_so=$'\E[38;5;246m' \
	LESS_TERMCAP_ue=$'\E[0m' \
	LESS_TERMCAP_us=$'\E[04;38;5;146m' \
	man "$@"
}

setbacklight() {
	sudo sh -c "echo $1 > /sys/class/backlight/acpi_video0/brightness"
}

DICTFILE=$HOME/.dict.tsv
dictcc() {
	grep "$*" <$DICTFILE
}

# formats code in suckless style
# source: http://lists.suckless.org/dev/1501/25023.html
slformat() {
	cp $1 $1.orig
	indent $1 -brs -nprs -npcs -i8 -fc1 -br -brf -nsaf -nsai -nsaw -ncs -nfca -il0 -ce -nss -c0 -cd0 -ut -o $1
	sed -E -i 's/([^\t]+)\t+\/\*/\1 \/*/g' $1 # space comments
	sed -i 's/switch (/switch(/g' $1 # simulate -nsas
}

mkcd() {
	mkdir -p $1 && cd $1
}

muson() {
	sudo sispmctl -o 1
	alsactl restore -f $HOME/.alsa/spdif.state
}

musoff() {
	sudo sispmctl -f 1
	alsactl restore -f $HOME/.alsa/default.state
}

svenable() {
	sudo ln -s /etc/sv/$1 /var/service/
}

svdisable() {
	sudo rm /var/service/$1
}

sleepm() {
	sleep $(($1*60))
}
