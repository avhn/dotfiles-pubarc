git clone https://github.com/ohmybash/oh-my-bash $HOME/.oh-my-bash
cd $(dirname $0)
ln -sfn $(pwd)/bashrc $HOME/.bashrc
ln -sfn $(pwd)/bash_profile  $HOME/.bash_profile

