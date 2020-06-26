zsh ./zsh/setup.sh
mkdir -p $HOME/bin/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/bin/homebrew
brew install gpg emacs python3 go npm openjdk
ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
git submodule update --init emacs.d
zsh ./emacs.d/setup.sh
zsh ./vim/setup.sh
mkdir -p $HOME/.gnupg
cat gpg/gpg-agent.conf > $HOME/.gnupg/gpg-agent.conf
cat gpg/sshcontrol > $HOME/.gnupg/sshcontrol

mkdir -p $HOME/Applications
brew cask install emacs --appdir=$HOME/Applications
