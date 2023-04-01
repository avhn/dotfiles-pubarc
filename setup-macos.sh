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
sudo $DIR/bash/setup.sh
source $DIR/bash/bash_profile
source $DIR/bash/bashrc
# homebrew, gpg, go, npm etc.
mkdir -p $HOME/brew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/brew
brew install gpg go npm
# emacs
mkdir -p $HOME/Applications
brew cask install emacs --appdir=$HOME/Applications
bash ./emacs.d/setup.sh
# symlink iCloud to $HOME/Cloud
ln -sfn $HOME/Library/Mobile\ Documents/com~apple~CloudDocs $HOME/Cloud
# isolate home folder
sudo chown -R $USERNAME /home/$USERNAME
sudo chmod -R go-rwx /home/$USERNAME
