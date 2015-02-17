# Used for spotifyd
sc () {
    echo $@ | socat - UNIX-CONNECT:/tmp/spotifyd 2>/dev/null
}
