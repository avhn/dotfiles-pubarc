#!/bin/bash
#
## pass legit username as first arg.
## install xcode seperately to get default devtools first
## user isolated macos setup
## uses $HOME/Applications instead of global /Applications folder.

function usage() {
    # TODO: Write usage.
    exit 1
}

# Make sure to run as root
if [[ ${UID} != 0 ]]; then
    # not root
    echo 'Please run as root.' >&2
    usage
fi

USERNAME=''
# Check username
if [ "${#}" != 1 ] | [ "$(id ${1})" == 0 ] | [ ! -d "/home/${1}" ]; then
    # there should be just one user specified
    # and user should have a valid home folder.
    echo 'Invalid user.'
    usage
fi
USERNAME=${1}

DIR="$(dirname $0)"
sudo $DIR/bash/setup.sh $USERNAME
source $DIR/bash/bash_profile
source $DIR/bash/bashrc
# homebrew, gpg, go, npm etc.
mkdir -p /home/${USERNAME}/brew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /home/${USERNAME}/brew
brew install gpg go npm python3
# powerline font for oh-my-bash agnoster theme
pip3 install --user powerline-status -y
# emacs
mkdir -p /home/${USERNAME}/Applications
brew cask install emacs --appdir=/home/${USERNAME}/Applications
bash $DIR/emacs.d/setup.sh $USERNAME
# vim
bash $DIR/vim/setup.sh $USERNAME
# symlink iCloud to $HOME/Cloud
ln -sfn /home/${USERNAME}/Library/Mobile\ Documents/com~apple~CloudDocs /home/${USERNAME}/Cloud
# isolate home folder
sudo chown -R $USERNAME /home/$USERNAME
sudo chmod -R go-rwx /home/$USERNAME
