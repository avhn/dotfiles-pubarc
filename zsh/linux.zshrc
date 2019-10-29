# enable plugins
plugins=(
    gitfast
    python 
    perl
    jenv
)

## start aliases ##

# python3.* virtualenv
alias create="python3 -m virtualenv --python=python3 .venv"

function activate_func {
    if [[ "$OSTYPE" == "msys" ]]; then
	   ./.venv/Scripts/activate.bat
	else
		source ./.venv/bin/activate
	fi
}
alias activate=activate_func

# confirm overwrite
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

## end aliases ##

# Set time-stamp format
HIST_STAMPS="dd.mm.yyyy"

# Inserted zsh plugins, initialize
source $ZSH/oh-my-zsh.sh

# --------------- OTHER OPTIONS BELOW --------------- #
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

