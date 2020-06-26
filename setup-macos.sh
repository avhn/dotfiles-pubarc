## user isolated macos setup, uses $HOME/bin $HOME/Applications
## afterwards, isolate home folder with chown -R and chmod -R go-rwx
# zsh
zsh ./zsh/setup.sh
source ./zsh/.zprofile
source ./zsh/.zshrc
# homebrew, emacs, go, java, python3, npm, gpg etc.
mkdir -p $HOME/bin/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/bin/homebrew
brew install gpg emacs python3 go npm openjdk
sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
zsh ./emacs.d/setup.sh
mkdir -p $HOME/Applications
brew cask install emacs --appdir=$HOME/Applications
# symlink icloud to home folder
ln -sfn $HOME/Library/Mobile\ Documents/com~apple~CloudDocs $HOME/Cloud
# set up gpg vars for git

