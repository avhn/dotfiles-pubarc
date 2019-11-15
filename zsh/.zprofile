# use clone of zsh
export ZSH=$HOME/.oh-my-zsh

# set environment
export LANG=en_US.UTF-8
export SSH_KEY_PATH=$HOME/.ssh/config
export EDITOR="$(which emacs) -nw"
export GIT_EDITOR=$EDITOR
ZSH_THEME="robbyrussell"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# brew
export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"
