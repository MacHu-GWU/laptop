#!/bin/bash
# -*- coding: utf-8 -*-

source mac-setup-lib.sh
source mac-setup-homebrew-lib.sh

brew_install_this_if_not_exists "rbenv"

# rbenv
add_line_to 'export RBENV_ROOT="$HOME/.rbenv"' ~/.bash_profile
add_line_to 'export PATH="$RBENV_ROOT/bin:$PATH"' ~/.bash_profile
add_line_to 'eval "$(rbenv init -)"' ~/.bash_profile
