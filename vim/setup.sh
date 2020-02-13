#!/usr/bin/env bash

file="unknown"
if [[ "$OSTYPE" == "darwin"* ]] || [[ "$OSTYPE" == "linux-gnu" ]]; then
    file="$HOME/.vim"
elif [[ "$OSTYPE" == "msys"* ]]; then
    file="$HOME/vimfiles"
elif [[ "$file" == "unknown" ]]; then
	echo "OS not detected. Aborting!"
	exit
fi
mkdir $file

echo -ne " - Copying .vimrc\n"
cd $(dirname $0)
cat .vimrc > $HOME/.vimrc


echo -ne " - Cloning themes\n"
git submodule update --init colorschemes
cp -rf ./colorschemes/colors $file/colors

echo " - Success!"
