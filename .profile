# Go
export GOPATH=~/.gocode
export PATH=$PATH:$GOPATH/bin

# Personal binaries/scripts
export PATH=$HOME/bin:$PATH

export VIS_THEME=default-16

if [ -z $SSH_AGENT_PID ]
then
	eval $(ssh-agent)
fi
export VISUAL=vis
export EDITOR="$VISUAL"
export PAGER=less

cron -f ~/.crontab &
