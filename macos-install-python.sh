#!/bin/bash

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-macos.sh

py_ver="3.9.6"

# install specific python version and set default python to the specific one
# https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-install
print_colored_line $color_cyan "Install specific python version, this step takes 3-5 minutes ..."
~/.pyenv/bin/pyenv install ${py_ver} -s # install python version
~/.pyenv/bin/pyenv global ${py_ver} # set current python version

# install and upgrade pip and virtualenv
print_colored_line $color_cyan "Install and upgrade pip and virtualenv ..."
~/.pyenv/versions/${py_ver}/bin/pip install pip --upgrade
~/.pyenv/versions/${py_ver}/bin/pip install virtualenv --upgrade

# rehash pyenv shims https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-rehash
~/.pyenv/bin/pyenv rehash
