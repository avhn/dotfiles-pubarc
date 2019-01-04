#!/usr/bin/env bash
py3venv_dir=$HOME/.emacs.d/py3venv

# copy files
cp -rf $(dirname $0)/.emacs.d $HOME

# create virtualenv
pip3 install virtualenv
virtualenv --python=python3.7 $py3venv_dir

# install elpy packages
source $py3venv_dir/bin/activate
pip install jedi rope autopep8 yapf black flake8
deactivate

echo "* Don't forget to install elpy"
exit

# make emacs default text editor
#if [[ $OSTYPE == "darwin"* ]]; then
#  defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.emacs.3;}'
#fi
