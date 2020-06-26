plugins=(
    gitfast
    osx 
    python 
    perl
)

## start alias block ##
# python3 virtualenv
alias create="python3 -m virtualenv --python=python3 venv"
alias activate="source ./venv/bin/activate"

# editor
alias emacs="emacs -nw"

# overwrite guards
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
## end alias block ##

HIST_STAMPS="dd.mm.yyyy"
DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh
