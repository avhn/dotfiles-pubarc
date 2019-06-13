#!/usr/bin/env bash
# -*- encoding: utf-8 -*-

cd $(dirname $0)
cat .bashrc > ~/.bashrc

# macOS starts bash with ~/.bash_profile
if [[ "$OSTYPE" == "darwin"* ]]; then
	ln -s ~/.bashrc ~/.bash_profile
fi
