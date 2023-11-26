#!/bin/bash
#
# set up oh-my-bash
# symlink .bashrc & .bash_profile

DIR=$HOME
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    # assumes no error and accepts $USERNAME as the first arg.
    USERNAME=${1}
    if [[ "${#}" != 1 ]]; then
        echo 'No user specified.' >& 2
        exit 1
    fi
    DIR=/home/$USERNAME
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # MacOS, ran by the sudoer user who utilizes
    # assume brew already installed
    which brew > /dev/null
    if [[ $? -eq 0 ]]; then
        BREW_PATH=$HOME/brew
        yes | brew update
        yes | brew install bash
        sudo chsh -s $BREW_PATH/bin/bash $(whoami)
        if [[ $? -ne 0 ]]; then
            echo "Could not change default shell to bash installed in ${$BREW_PATH/bin/bash}.\nProbably not superuser.\n" >&2
        fi
   else echo "brew not found in path." >&2; fi
else
    echo "Unidentified OS." >& 2
    exit 1
fi

git clone https://github.com/ohmybash/oh-my-bash $DIR/.oh-my-bash
# create symlinks.
DIR_SCRIPT=$(dirname $0)

ln -sfn $DIR_SCRIPT/bashrc $DIR/.bashrc
ln -sfn $DIR_SCRIPT/bash_profile  $DIR/.bash_profile
