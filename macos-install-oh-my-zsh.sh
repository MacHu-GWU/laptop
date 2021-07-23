#!/bin/bash

# Reference: https://ohmyz.sh/
dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-macos.sh

print_colored_line $color_cyan "Install oh-my-zsh ..."

if [ -e ~/.oh-my-zsh/oh-my-zsh.sh ]
then
    print_colored_line $color_cyan "oh-my-zsh is already installed."
else
    print_colored_line $color_cyan "oh-my-zsh is NOT already installed! start install..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
