## user isolated macos setup, uses $HOME/bin $HOME/Applications
## afterwards, isolate home folder with chown -R and chmod -R go-rwx
## install xcode seperately to get default devtools first
cd $(dirname $0)
# zsh
zsh ./zsh/setup.sh
source ./zsh/zprofile
source ./zsh/zshrc
# homebrew, gpg, go, npm etc.
mkdir -p $HOME/bin/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/bin/homebrew
brew install gpg go npm
# emacs
mkdir -p $HOME/Applications
brew cask install emacs --appdir=$HOME/Applications
zsh ./emacs.d/setup.sh
# symlink icloud to home folder
ln -sfn $HOME/Library/Mobile\ Documents/com~apple~CloudDocs $HOME/Cloud
# openjdk
echo -n "Install openjdk? y/n: "
read install_openjdk
if [[ "$install_openjdk" == "y" ]]; then
  brew install openjdk
  if [[ ! $(sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk) ]]; then
    echo "Symlink jdk as root with the following command later: "
    echo "\tsudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk"
  fi
fi
