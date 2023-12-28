#!/bin/bash
# for debian and macos
# assumes no error and accepts $USERNAME as the first arg.

HOME_DIR=$HOME
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    USERNAME=${1}
    if [[ "${#}" != 1 ]]; then
        echo 'No user specified.' >& 2
        exit 1
    fi
    HOME_DIR=/home/$USERNAME
fi

EMACS_DIR=$(dirname $(readlink -f $0))
# Symlink
if [[ ! -f $HOME_DIR/.emacs.d && ! -d $HOME_DIR/.emacs.d ]]; then
  echo "Symlinking"
  ln -sfn $EMACS_DIR $HOME_DIR/.emacs.d
else
  echo "Skipping symlink ($HOME_DIR/.emacs.d occupied)" >&2
  exit 1
fi

# install golang.org's language server
if ! type go > /dev/null && ! $(brew install go); then
  echo "Can't set up golang!" >&2
  exit 1
elif ! go install golang.org/x/tools/gopls@latest; then
  echo "Can't install golang language server, gopls!" >&2
  exit 1
fi

# use pandoc for markdown conversion
if ! type pandoc > /dev/null && ! $(brew install pandoc); then
  echo "Can't setup up pandoc!" >&2
  exit 1
fi

# initial launch to install packages
emacs -nw --eval "(save-buffers-kill-emacs)"
echo "Done"
