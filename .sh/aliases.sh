# shell independent aliases

# navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# my folders in ~
in="$HOME/in"
tt="$HOME/pim/tt"
dev="$HOME/dev"
lab="$HOME/dev/lab"
pro="$HOME/dev/pro"
repos="$HOME/dev/repos"
mus="$HOME/mus"
vid="$HOME/vid"
img="$HOME/img"
wrk="$HOME/wrk"
uni="$HOME/uni"
pim="$HOME/pim"
pubs="$HOME/pubs"
docs="$HOME/docs"

# cd shortcuts
alias in="cd $dl"
alias tt="cd $pim/tt"
alias dev="cd $dev"
alias lab="cd $lab"
alias pro="cd $pro"
alias repos="cd $repos"
alias mus="cd $mus"
alias vid="cd $vid"
alias img="cd $img"
alias wrk="cd $wrk"
alias uni="cd $uni"
alias pim="cd $pim"
alias pubs="cd $pubs"
alias docs="cd $docs"

alias tmp='cd /tmp'
alias j='cd $(cat /tmp/LDIR)'

# shortcuts for uni courses
for c in $uni/courses/*
do
	alias $(basename $c)="cd $c"
done


# ls
alias lc='ls | cols'
alias l='lc'
alias ll='ls -l'
alias la='ls -a'
alias lsd='ls -p | grep /'
alias lf='ls -p | grep -v /'

# xbps
# TODO: Add more package managers depending on os?
alias pkin='sudo xbps-install -uy'
alias pkug='sudo xbps-install -Syu'
alias pkrm='sudo xbps-remove'
alias pks='xbps-query -Rs'

# voidlinux

# sispmctl
alias son='sudo sispmctl -o'
alias soff='sudo sispmctl -f'

# git
# inspired and mostly copied form the oh-my-zsh plugin
alias g='git'

alias gst='git status'
alias gss='git status -s'

alias gd='git diff'
alias gdc='git diff --cached'
alias gdt='git diff-tree --no-commit-id --name-only -r'

alias gl='git pull'
alias gup='git pull --rebase'
alias gp='git push'
alias gupnp='git pull --rebase && git push'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcs='git commit -S'

alias gco='git checkout'
alias gcm='git checkout master'
alias gcb='git checkout -b'

alias gr='git remote'
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'

alias gb='git branch'
alias gba='git branch -a'
alias gbr='git branch --remote'

alias gcl='git clone'
alias gcp='git cherry-pick'

alias glg='git log --stat --max-count=10'
alias glgg='git log --graph --max-count=10'
alias glgga='git log --graph --decorate --all'
alias glo='git log --oneline --decorate --color'
alias glog='git log --oneline --decorate --color --graph'

alias ga='git add'
alias gaa='git add --all'

alias gm='git merge'

alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard && git clean -dfx'

alias gpoat='git push origin --all && git push origin --tags'

alias gsta='git stash'
alias gstas='git stash show --text'
alias gstap='git stash pop'
alias gstad='git stash drop'

# Will cd into the top of the current repository or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

# Will return the current branch name
# Usage example: git pull origin $(current_branch)
current_branch() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || \
	ref=$(git rev-parse --short HEAD 2> /dev/null) || return
	echo ${ref#refs/heads/}
}

current_repository() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || \
	ref=$(git rev-parse --short HEAD 2> /dev/null) || return
	echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
alias ggpur='git pull --rebase origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias gdmm='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
