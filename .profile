# Go
export GOPATH=~/.gocode
export PATH=$PATH:$GOPATH/bin

# Personal binaries/scripts
export PATH=$PATH:$HOME/bin

# vmtouch if script available
vmtf=~/.vmtouch
[ -x $vmtf ] && $vmtf &

if [ -z $SSH_AGENT_PID ]
then
	eval $(ssh-agent)
fi

export VISUAL=vis
export EDITOR="$VISUAL"
export PAGER=less
