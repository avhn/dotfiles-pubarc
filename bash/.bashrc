activate_func() {
  if [[ "$OSTYPE" == "msys" ]]; then
    ./venv/Scripts/activate.bat
  else
    source ./venv/bin/activate
  fi
}

# alias definitions below #
# python virtualenv
alias create='python3 -m virtualenv --python=python3 venv'
alias activate=activate_func

# confirm overwrite
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# editors
alias emacs='emacs -nw'
