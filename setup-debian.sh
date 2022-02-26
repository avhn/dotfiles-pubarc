## user isolated setup which uses $HOME/bin, use chown -R and chmod -R go-rwx
## on home folder afterwards
cd $(dirname $0)
## TODO: add contrib and non-free to /etc/apt/sources.list (? universe ? for firacode)
sudo apt update
sudo apt upgrade -y
# set up bash
sudo apt install git
bash ./bash/setup.sh
source ./bash/bash_profile
source ./bash/bashrc
# install drivers
sudo apt install linux-headers-amd64 linux-image-amd64 nvidia-driver
# set up fonts
sudo apt install fonts-noto fonts-firacode
## set up linuxbrew/homebrew
sudo apt install curl
mkdir -p $HOME/brew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/brew
# python
sudo apt install python3-pip3
pip3 install virtualenv
# git
brew install diff-so-fancy
