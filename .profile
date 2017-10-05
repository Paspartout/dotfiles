# Go
export GOPATH=~/.gocode
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

# Other PATH adjustments
export PATH=$HOME/bin:$PATH
export PATH=$HOME/uni/bin:$PATH
export PATH=$HOME/opt/julia/bin:$PATH

# Use vim as default editor
export VISUAL=vim
export EDITOR=$VISUAL
export VIMRUNTIME=/usr/share/vim/vim80/

export PAGER=less
export ENV=$HOME/.kshrc

# personal deamons/services
# TODO: consider running user runit
if [ -z "$SSH_AUTH_SOCK" ] ; then
	eval "$(ssh-agent -s)"
fi

export XINITRC=/home/paspartout/.xinitrc
