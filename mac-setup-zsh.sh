#!/bin/bash
# -*- coding: utf-8 -*-

source mac-setup-homebrew-lib.sh

install_zsh_and_oh_my_zsh() {
    # install zsh shell
    if this_command_exists "zsh"; then
        print_colored_line $color_cyan "zsh is already installed."
    else
        print_colored_line $color_cyan "zsh is NOT installed! start install brew:"
        brew_install_this_if_not_exists "zsh"
    fi

    # install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_zsh_and_oh_my_zsh
