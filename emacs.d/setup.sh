cd $(dirname $0)
if [[ ! -f $HOME/.emacs.d && ! -d $HOME/.emacs.d ]]; then
    echo "Symlinking"
    ln -sfn $(pwd) $HOME/.emacs.d
else
    echo "Skipping symlink ($HOME/.emacs.d occupied)"
fi

# install golang.org's language server
if ! type go > /dev/null && ! $(brew install golang); then
    echo "Can't set up golang!"
    exit
fi
if ! go install golang.org/x/tools/gopls@latest; then
    echo "fatal"
    exit
fi

# use pandoc for markdown conversion
if ! type pandoc > /dev/null && ! $(brew install pandoc); then
        echo "Can't setup up pandoc!"
fi

# initial launch to install packages
emacs -nw --eval "(save-buffers-kill-emacs)"
echo "Done"
