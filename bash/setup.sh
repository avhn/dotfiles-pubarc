#!/bin/bash
#!/bin/bash
# set up oh-my-bash
# symlink .bashrc & .bash_profile

DIR=$HOME
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    # assumes no error and accepts $USERNAME as the first arg.
    USERNAME=${1}
    if [[ "${#}" != 1 ]]; then
        echo 'No user specified.' >& 2
        exit 1
    fi
    DIR=/home/$USERNAME
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # MacOS
    # assume superuser
    DIR=$HOME
else
    echo "Unidentified OS." >& 2
    exit 1
fi

git clone https://github.com/ohmybash/oh-my-bash $DIR/.oh-my-bash
# create symlinks.
DIR_SCRIPT=$(dirname $0)

ln -sfn $DIR_SCRIPT/bashrc $DIR/.bashrc
ln -sfn $DIR_SCRIPT/bash_profile  $DIR/.bash_profile
