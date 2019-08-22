#!/bin/bash
# -*- coding: utf-8 -*-
#
# Amazon Linux shared library, will be sourced in any ``amazon-linux-setup-xxx.sh`` file

source unix-lib.sh
source detect-os.sh

if [ "$os_is_linux" != "Y" ]; then
    print_colored_line $color_red "It is not a Linux Machine, exit ..."
    exit 1
fi

# if a formula is not installed, brew install it
#
#   usage: brew_install_this_if_not_exists wget
yum_install_this_if_not_exists() {
    if this_command_exists "$1"; then
        print_colored_line $color_cyan "$1 is already installed in brew."
    else
        print_colored_line $color_cyan "$1 is NOT installed! start install $1:"
        sudo yum -y install "$1"
        print_colored_line $color_green "success!"
    fi
}

install_linux_deps() {
    # install curl to make http request
    yum_install_this_if_not_exists "curl"
    # install jq to parse json
    yum_install_this_if_not_exists "jq"

    # install pyenv
    curl -s https://pyenv.run | bash

    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    add_line_to 'export PYENV_ROOT="$HOME/.pyenv"' ~/.bash_profile
    add_line_to 'export PATH="$PYENV_ROOT/bin:$PATH"' ~/.bash_profile
    add_line_to 'eval "$(pyenv init -)"' ~/.bash_profile
    add_line_to 'eval "$(pyenv virtualenv-init -)"' ~/.bash_profile

    add_line_to 'export PYENV_ROOT="$HOME/.pyenv"' ~/.bashrc
    add_line_to 'export PATH="$PYENV_ROOT/bin:$PATH"' ~/.bashrc
    add_line_to 'eval "$(pyenv init -)"' ~/.bashrc
    add_line_to 'eval "$(pyenv virtualenv-init -)"' ~/.bashrc

    yum_install_this_if_not_exists "gcc"
    sudo yum -y install @development zlib-devel bzip2 bzip2-devel readline-devel \
        sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel findutils

    print_colored_line $color_green "Successfully installed pyenv, enter `$ bash` to reload your shell..."
}
