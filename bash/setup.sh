#!/usr/bin/env bash
# -*- encoding: utf-8 -*-

cd $(dirname $0)
cat .bash_profile > ~/.bash_profile
cat .bashrc > ~/.bashrc
