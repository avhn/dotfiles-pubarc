# use clone of zsh
export ZSH=$HOME/.oh-my-zsh

# set environment
export LANG=en_US.UTF-8
export EDITOR="$(which emacs) -nw"
export GIT_EDITOR=$EDITOR
ZSH_THEME="robbyrussell"

# brew
export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# golang
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# GPG and SSH
export SSH_KEY_PATH="$HOME/.ssh/config"
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye

