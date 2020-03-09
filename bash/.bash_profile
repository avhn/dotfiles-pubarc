export EDITOR="$(which emacs) -nw"
export GIT_EDITOR=$EDITOR
export LANG=en_us.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/config"

# brew
export PATH="$HOME/.brew/bin:$HOME/.brew/sbin:$PATH"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# golang
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
