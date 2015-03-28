# Used for spotifyd
sc () {
    echo $@ | socat - UNIX-CONNECT:/tmp/spotifyd 2>/dev/null
}

BEEPFILE=~/.beep.mp3
ntfy () {
    notify-send "$1"
    mpv $BEEPFILE
    flite -voice slt -t "$1"
}

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
