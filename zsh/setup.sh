#!/usr/bin/env bash
# -*- encoding: utf-8 -*-
# You can use this script for debian based linux distros(WSL included) and macOS.
# Requirements are git, and brew if you're using macOS.

git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh

echo -e "Install 'powerlevel9k' theme with it? (y/n): "
read choice
if [[ $choice == "y" ]]; then
    git clone https://github.com/bhilburn/powerlevel9k ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install zsh
    rcfile="macos.zshrc"
else
    sudo apt-get install zsh
    rcfile="debian.zshrc"
fi
cd $(dirname $0)
cat $rcfile > ~/.zshrc

# change shell for "user"
# do not use sudo
chsh -s $(which zsh)
