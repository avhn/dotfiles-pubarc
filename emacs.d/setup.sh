cd $(dirname $0)
if [[ ! -f $HOME/.emacs.d && ! -d $HOME/.emacs.d ]]; then
    echo "Symlinking files"
    ln -sfn $(pwd) $HOME/.emacs.d
else
    echo "Skipping symlink (there's already a file or directory exists at $HOME/.emacs.d)"
fi

# install golang.org's language server
if type go > /dev/null; then
   go get -u golang.org/x/tools/gopls
else
    echo "Golang binary not found in path"
fi

# use pandoc for markdown conversion
if ! type pandoc > /dev/null; then
    if [[ ! $OS_TYPE == "darwin"* ]] || [[ ! $(brew install pandoc) ]]; then
        echo "pandoc not installed, install for markdown support"
    fi
fi

# initial launch to install packages
emacs -nw --eval "(save-buffers-kill-emacs)"

echo "Done"
