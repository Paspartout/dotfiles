# Go
export GOPATH=~/.gocode
export PATH=$PATH:$GOPATH/bin

# Use vis as default editor
export VISUAL=vis
export VIS_THEME=default-16
export EDITOR=$VISUAL

export PAGER=less

export PATH=$HOME/bin:$PATH
export ENV=$HOME/.kshrc

[ -z "$SSH_AGENT_PID" ] && eval $(ssh-agent)
