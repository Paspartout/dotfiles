mkcd() {
	mkdir -p $1 && cd $1
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
