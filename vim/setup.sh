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

cd $(dirname $0)
cat .vimrc > $HOME/.vimrc
git clone https://github.com/rafi/awesome-vim-colorschemes colors
cp -rf ./colors/colors $file/colors
rm -rf ./colors

echo "Success!"
