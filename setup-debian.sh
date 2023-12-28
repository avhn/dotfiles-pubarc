#!/bin/bash
#
## pass legit username as first arg.
## user isolated setup which uses $HOME/bin,
## use sudo.

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

DIR=$(dirname $0)
# If you're using **UBUNTU**, add 'universe' repo for fira-code.
sudo apt-add-repository contrib non-free
sudo apt update
sudo apt upgrade -y
# set up bash
sudo apt install git
bash $DIR/bash/setup.sh $USERNAME
source $DIR/bash/bash_profile
source $DIR/bash/bashrc
# install drivers
sudo apt install linux-headers-amd64 linux-image-amd64 nvidia-driver
# set up fonts
sudo apt install fonts-noto fonts-firacode fonts-powerline
# set up linuxbrew/homebrew
sudo apt install curl
mkdir -p /home/$USERNAME/brew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /home/$USERNAME/brew
# python
sudo apt install python3-pip
## -- not necessary anymore with debian 12
#pip3 install virtualenv
## /usr/bin/python isn't available, link to python3
## -- not necessary anymore with debian 12
#sudo ln -s /usr/bin/python3 /usr/bin/python
# git
brew install diff-so-fancy node
# emacs
bash $DIR/emacs.d/setup.sh $USERNAME
# vim
bash $DIR/vim/setup.sh $USERNAME
# isolate
sudo chown -R $USERNAME /home/$USERNAME
sudo chmod -R go-rwx /home/$USERNAME

