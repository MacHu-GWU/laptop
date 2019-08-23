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
        print_colored_line $color_cyan "$1 is already installed in yum."
    else
        print_colored_line $color_cyan "$1 is NOT installed! start install $1:"
        yum -y install "$1"
        print_colored_line $color_green "success!"
    fi
}

install_linux_deps() {
    # install curl to make http request
    yum_install_this_if_not_exists "curl"
    # install jq to parse json
    yum_install_this_if_not_exists "jq"
}
