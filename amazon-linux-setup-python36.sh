#!/bin/bash
# -*- coding: utf-8 -*-

source unix-lib.sh
source amazon-linux-setup-python-lib.sh

install_pyenv_and_linux_deps

pyenv install 3.6.8 -s # install python version
pyenv global 3.6.8 # set current python version

# install aws cli
pip install pip --upgrade
pip install virtualenv --upgrade
pip install superjson==0.0.13
pip install pathlib_mate==0.0.15
pip install configirl==0.0.4

# install docker, used for lambda deployment
sudo yum -y install docker
sudo systemctl start docker # run docker in background
