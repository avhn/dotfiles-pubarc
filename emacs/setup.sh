#!/usr/bin/env bash
py3venv_dir=$HOME/.emacs.d/.py3venv

# copy files
cp -rf $(dirname $0)/.emacs.d $HOME

# create virtualenv
pip3 install virtualenv
python3 -m virtualenv --python=python3 $py3venv_dir

# set up emacs packages
emacs -nw --load $(dirname $0)/setup_packages.el

# set up elpy's python dependency packages
source $py3venv_dir/bin/activate
pip install jedi rope autopep8 yapf black flake8
deactivate

exit
