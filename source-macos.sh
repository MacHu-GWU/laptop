#!/bin/bash
# -*- coding: utf-8 -*-

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-unix-lib.sh
source ${dir_here}/source-detect-os.sh

# This script should be sourced to use
#
# test if a formula is installed in brew
#
#   usage: if brew_installed_this_formula "wget"; then ...
brew_installed_this_formula() {
    brew list -1 | grep -Fqx "$1"
}


# if a formula is not installed, brew install it
#
#   usage: brew_install_this_if_not_exists wget
brew_install_this_if_not_exists() {
    if brew_installed_this_formula "$1"
    then
        print_colored_line $color_cyan "$1 is already installed in brew."
    elif this_command_exists "$1"
    then
        print_colored_line $color_cyan "$1 is already installed in system."
    else
        print_colored_line $color_cyan "$1 is NOT installed! start install..."
        brew install "$1"
    fi
}
