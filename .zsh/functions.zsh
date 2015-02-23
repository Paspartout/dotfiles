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
