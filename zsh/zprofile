# zsh framework
export ZSH=$HOME/bin/oh-my-zsh
ZSH_THEME="robbyrussell"

# homebrew
export PATH="$HOME/bin/homebrew/bin:$HOME/bin/homebrew/sbin:$PATH"

# golang
export GOPATH="$HOME/bin/go"
export PATH="$GOPATH/bin:$PATH"

# gpg and ssh
if type gpg > /dev/null; then
	export SSH_KEY_PATH="$HOME/.ssh/config"
	export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
	export GPG_TTY=$(tty)
	gpgconf --launch gpg-agent
	gpg-connect-agent updatestartuptty /bye
fi

# defaults
export LANG=en_US.UTF-8
export EDITOR="$(which emacs) -nw"
export GIT_EDITOR=$EDITOR
