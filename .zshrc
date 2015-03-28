# autostart tmux if launched in ui terminal only
if [ $TERM = "rxvt-unicode-256color" ] 
    then
      ZSH_TMUX_AUTOSTART=true
fi

# load zgen
source "${HOME}/.zsh/zgen/zgen.zsh"

# load personal customizations
source "${HOME}/.zsh/aliases.zsh"
source "${HOME}/.zsh/exports.zsh"
source "${HOME}/.zsh/functions.zsh"

# reduce key timeout for entering vi normal mode
export KEYTIMEOUT=1
# enable backward search that gets disabled by vi mode
bindkey "^R" history-incremental-search-backward

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/fasd
    zgen oh-my-zsh plugins/taskwarrior
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/vi-mode

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen oh-my-zsh themes/simple

    # save all to init script
    zgen save
fi
