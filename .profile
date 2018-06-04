# Do I really need this here?
HISTSIZE=
HISTFILESIZE=

# Go
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$HOME/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

# Python
export PYTHONPATH=$PYTHONPATH:$HOME/.local/lib/python3.6

# Other PATH adjustments
export PATH=$HOME/bin:$PATH
export PATH=$HOME/uni/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export ANDROID_HOME=$HOME/Android

# Use vim as default editor
export VISUAL=vim
export EDITOR=$VISUAL

export PAGER=less
# TODO: Bash?
#export ENV=$HOME/.kshrc

# personal deamons/services
# TODO: consider running user runit
if [ -z "$SSH_AUTH_SOCK" ] ; then
	eval "$(ssh-agent -s)"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

