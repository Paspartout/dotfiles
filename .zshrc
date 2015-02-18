# autostart tmux
ZSH_TMUX_AUTOSTART=true

# load zgen
source "${HOME}/.zsh/zgen/zgen.zsh"

# load personal customizations
source "${HOME}/.zsh/aliases.zsh"
source "${HOME}/.zsh/exports.zsh"
source "${HOME}/.zsh/functions.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/tmux

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen oh-my-zsh themes/simple

    # save all to init script
    zgen save
fi
