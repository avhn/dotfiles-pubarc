#!/bin/bash
# assumes no error and accepts username as first arg for linux.
# works with linux-macos-windows.

file="unknown"
if [[ "$OSTYPE" == "darwin"* ]] || [[ "$OSTYPE" == "linux-gnu" ]]; then
  file=$HOME/.vim
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    USERNAME=${1}
    if [[ "${#}" != 1 ]]; then
        echo 'No user specified.' >& 2
        exit 1
    fi
    file="/home/${USERNAME}/.vim"
  fi
  echo 'Linking .vimrc'
  ln -sfn $(dirname $0)/vimrc /home/${USERNAME}/.vimrc
elif [[ "$OSTYPE" == "msys"* ]]; then
  file="$HOME/vimfiles"
  echo 'Linking .vimrc'  
  ln -sfn $(dirname $0)/vimrc /home/${USERNAME}/.vimrc
elif [[ "$file" == "unknown" ]]; then
  echo "OS not detected. Aborting!" >&2
  exit 1
else
  echo 'fatal' >&2
  exit 1
fi

if [[ ! -e $file ]]; then
  mkdir $file
elif [[ ! -d $file ]]; then
  echo "Non-dir file at ${file}, aborting." >&2
  exit 1
fi

echo 'Cloning and linking themes'
git submodule update --init colorschemes
ln -sfn $(dirname $0)/colorschemes/colors $file/colors

echo "Success"
