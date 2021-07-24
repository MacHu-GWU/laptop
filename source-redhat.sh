#!/bin/bash
# -*- coding: utf-8 -*-

# This script should be sourced to use

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-unix-lib.sh
source ${dir_here}/source-detect-os.sh

# if a yum package is not installed, yum install it
#
#   usage: yum_install_this_if_not_exists git
yum_install_this_if_not_exists() {
    if this_command_exists "$1"; then
        print_colored_line $color_cyan "$1 is already installed in yum."
    else
        print_colored_line $color_cyan "$1 is NOT installed! start install $1:"
        yum -y install "$1"
        print_colored_line $color_green "success!"
    fi
}
