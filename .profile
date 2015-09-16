# Go
export GOPATH=~/.gocode
export PATH=$PATH:$GOPATH/bin

# Personal binaries/scripts
export PATH=$PATH:$HOME/bin

if [ -z $SSH_AGENT_PID ]
then
	eval $(ssh-agent)
fi

export VISUAL=vis
export EDITOR="$VISUAL"
export PAGER=less

# TODO: Probably move or remove
[ -n "$(command -v startx)" ] && \
[ -z "$SSH_CLIENT"] && [ -z "$SSH_TTY" ] && \
echo "Starting X in 5 seconds..." && \
sleep 5 && \
startx
