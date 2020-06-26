git clone https://github.com/robbyrussell/oh-my-zsh $HOME/bin/oh-my-zsh

cd $(dirname $0)
ln -sfn $(pwd)/.zshrc $HOME/.zshrc
ln -sfn $(pwd)/.zprofile  $HOME/.zprofile

# change shell for user, do not use sudo
chsh -s /bin/zsh
