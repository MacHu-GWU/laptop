#!/bin/bash
# -*- coding: utf-8 -*-

source amazon-linux-setup-python-lib.sh

install_linux_deps
install_pyenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv install 3.6.8 -s # install python version
pyenv global 3.6.8 # set current python version

# install aws cli
pip install pip --upgrade
pip install virtualenv --upgrade
pip install superjson==0.0.13
pip install pathlib_mate==0.0.15
pip install configirl==0.0.4
