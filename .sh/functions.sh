mkcd() {
	mkdir -p $1 && cd $1
}

sleepm() {
	sleep $(($1*60))
}

f() {
	sel=$(ls | fzy -l25)
	if [ -d "$sel" ]
	then
		cd "$sel"
	elif [ -f "$sel" ]
	then
		o "$sel"
	fi
}

fe() {
    # fe - Open the selected files with the default editor
    files=$(find * -type f | fzy | sed -e "s/\(.*\)/\'\1\'/")
    command="${EDITOR:-vis} $files"
    [ -n "$files" ] && eval $command
}

ff() {
	sel=$(find . | fzy -l25)
	if [ -d "$sel" ]
	then
		cd "$sel"
	elif [ -f "$sel" ]
	then
		o "$sel"
	fi
}

uni() {
	if [ -n "$1" ]
	then
		cd "$unic"/"$1"
	else
		cd "$uni"
	fi
}

pro() {
	if [ -n "$1" ]
	then
		cd "$pro"/"$1"
	else
		cd "$pro"
	fi
}
