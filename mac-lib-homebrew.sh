#!/bin/bash
# -*- coding: utf-8 -*-

source mac-lib.sh

# install Homebrew (if not installed)
#
#   usage: install brew
install_brew() {
    if this_command_exists "brew"; then
        echo "brew is already installed."
    else
        echo "brew is NOT installed! start install brew:"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

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
    if brew_installed_this_formula "$1"; then
        echo "$1 is already installed in brew."
    else
        echo "$1 is NOT installed! start install $1:"
        brew install "$1"
    fi
}