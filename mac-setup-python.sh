#!/bin/bash
# -*- coding: utf-8 -*-

source mac-setup-lib.sh
source mac-lib-homebrew.sh

brew_install_this_if_not_exists "pyenv"

# pyenv
add_line_to 'export PYENV_ROOT="$HOME/.pyenv"' ~/.bash_profile
add_line_to 'export PATH="$PYENV_ROOT/bin:$PATH"' ~/.bash_profile
add_line_to 'eval "$(pyenv init -)"' ~/.bash_profile
add_line_to 'eval "$(pyenv virtualenv-init -)"' ~/.bash_profile
