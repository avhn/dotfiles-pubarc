## user isolated setup which uses $HOME/bin, use chown -R and chmod -R go-rwx
## on home folder afterwards
## WARNING: config files are intended for macos and this script is not tested
## extensively, if you decide to use this be prepared to fix some things
cd $(dirname $0)
sudo apt install build-essential curl file git
# zsh
zsh ./zsh/setup.sh
source ./zsh/zprofile
source ./zsh/zshrc
# zprofile may not be initialized first by the os depending on the distro
# rearrange zshrc if needed by the following commands
#echo "source $HOME/.zprofile" > $HOME/.zshrc
#cat ./zsh/zshrc >> $HOME/.zshrc
# homebrew, emacs, gpg, go, npm etc.
mkdir -p $HOME/bin/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/bin/homebrew
brew install emacs gpg go npm python3.8
zsh ./emacs.d/setup.sh
