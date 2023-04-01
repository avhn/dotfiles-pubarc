#!/bin/bash
# set up oh-my-bash
git clone https://github.com/ohmybash/oh-my-bash $HOME/.oh-my-bash
# create symlinks.
DIR=$(dirname $0)
ln -sfn $DIR/bashrc $HOME/.bashrc
ln -sfn ${DIR}/bash_profile  $HOME/.bash_profile

