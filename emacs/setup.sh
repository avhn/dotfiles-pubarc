#!/usr/bin/env bash

mkdir $HOME/.emacs.d
cd $(dirname $0)
cp -rf .emacs.d $HOME/.emacs.d

# make emacs default text editor
#
#if [[ $OSTYPE == "darwin"* ]]; then
#  defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.emacs.3;}'
#fi
