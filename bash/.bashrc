export EDITOR="$(which emacs) -nw"
export GIT_EDITOR=$EDITOR
export LANG=en_us.UTF-8
export SSH_KEY_PATH="$HOME/.ssh/config"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

## python virtualenv
alias create='python3 -m virtualenv --python=python3 venv'

activate_func() {
  if [[ "$OSTYPE" == "msys" ]]; then
    ./venv/Scripts/activate.bat
  else
    source ./venv/bin/activate
  fi
}
alias activate=activate_func

## confirm overwrite
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# editors
alias emacs='emacs -nw'

