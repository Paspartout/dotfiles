# aliases I use to be faster on the shell

# general
alias history='fc -l'

# TODO: Consider removing color for suckless sbase?
alias ls='/bin/ls --color'
alias la='ls -a'
alias l='ls -lha'

# tmux
alias tmux='tmux -2' # default to 256 color mode
alias tm='tmux'
alias tmn='tmux new -s'

# xbps
# TODO: Add more package managers depending on os?
alias pkin='sudo xbps-install -uy'
alias pkug='sudo xbps-install -Syu'
alias pkrm='sudo xbps-remove'
alias pks='xbps-query -Rs'

# voidlinux
alias zzz='sudo zzz'

# sispmctl
alias son='sudo sispmctl -o'
alias soff='sudo sispmctl -off'
alias muson='sudo sispmctl -o 1'
alias musoff='sudo sispmctl -f 1'

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

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcs='git commit -S'

alias gco='git checkout'
alias gcm='git checkout master'

alias gr='git remote'
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'
# TODO: Add more remote commands once understood

alias gb='git branch'
alias gba='git branch -a'
alias gbr='git branch --remote'

alias gcl='git config --list'
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
alias gsts='git stash show --text'
alias gstp='git stash pop'
alias gstd='git stash drop'

# Will cd into the top of the current repository or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

# Will return the current branch name
# Usage example: git pull origin $(current_branch)
function current_branch() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || \
	ref=$(git rev-parse --short HEAD 2> /dev/null) || return
	echo ${ref#refs/heads/}
}

function current_repository() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || \
	ref=$(git rev-parse --short HEAD 2> /dev/null) || return
	echo $(git remote -v | cut -d':' -f 2)
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
alias ggpur='git pull --rebase origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'

# Pretty log messages
function _git_log_prettily() {
	if ! [ -z $1 ]; then
		git log --pretty=$1
	fi
}
alias glp="_git_log_prettily"

# git annex
alias gax='git annex'
alias gaxra='git annex remote add'

alias gaxa='git annex add'
alias gaxg='git annex get'
alias gaxd='git annex drop'

alias gaxs='git annex sync'
alias gaxsc='git annex sync --content'

alias gaxul='git annex unlock'
alias gaxl='git annex lock'

alias gaxcpto='git annex copy --to'
alias gaxmvto='git annex move --to'

alias gaxunu='git annex unused'
alias gaxdun='git annex drop unused'
alias gaxfsck='git annex fsck'

# TODO: Add more git annex aliases

# utilites / one liners

# search for todo in all files but ignore .git
# TODO: Check posix/sbase compatibility of find -not -path
alias ftodo='find . -type f -not -path "./.git/*" | xargs grep TODO'

alias timesync='sudo sntp -S de.pool.ntp.org && sudo hwclock -w'

