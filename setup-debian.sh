## user isolated setup which uses $HOME/bin, use chown -R and chmod -R go-rwx
## on home folder afterwards
cd $(dirname $0)
## TODO: add contrib and non-free to /etc/apt/sources.list
sudo apt update
sudo apt upgrade -y
# install drivers
sudo apt install linux-headers-amd64 linux-image-amd64 nvidia-driver
# set up fonts
sudo apt install fonts-noto
## TODO: set up linuxbrew/homebrew
sudo apt install curl
mkdir -p $HOME/bin/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/bin/homebrew
