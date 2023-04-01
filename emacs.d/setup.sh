#!/bin/bash
# assumes no error and accepts $USERNAME as the first arg.

USERNAME=${1}
if [[ "${#}" != 1 ]]; then
  echo 'No user specified.' >& 2
  exit 1
fi

EMACS_DIR=$(dirname $0)
# Symlink
if [[ ! -f /home/${USERNAME}/.emacs.d && ! -d /home/${USERNAME}/.emacs.d ]]; then
  echo "Symlinking"
  ln -sfn $EMACS_DIR /home/${USERNAME}/.emacs.d
else
  echo "Skipping symlink ($HOME/.emacs.d occupied)" >&2
  exit 1
fi

# install golang.org's language server
if ! type go > /dev/null && ! $(brew install golang); then
  echo "Can't set up golang!" >&2
  exit 1
elif ! go get golang.org/x/tools/gopls; then
  echo 'fatal' >&2
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
