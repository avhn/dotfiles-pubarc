#!/bin/bash
cat .vimrc> $HOME/.vimrc

file="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
    file="$HOME/.vim"
elif [[ "$OSTYPE" == "msys"* ]]; then
    file="$HOME/vimfiles"
elif [[ "$file" == "unknown" ]]; then
	echo "OS not detected. Aborting!"
	exit
fi

mkdir $file
cp -r ./colors $file/colors

echo "Success!"