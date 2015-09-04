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
