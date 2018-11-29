#!/usr/bin/env bash

git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh

echo -e "Install 'powerlevel9k' theme with it? (y/n): "
read choice
if [[ $choice == "y" ]]; then
    git clone https://github.com/bhilburn/powerlevel9k ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    rcfile="macos.zshrc"
else
    rcfile="debian.zshrc"
fi
cd $(dirname $0)
cat $rcfile > ~/.zshrc

# change shell for user
chsh -s $(which zsh)
