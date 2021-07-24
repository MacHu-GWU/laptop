#!/bin/bash

# Run this script with ``bash macos.sh`` on MacOS laptop. Don't do sudo!

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-macos.sh

if [ "$os_is_darwin" != "Y" ]
then
    print_colored_line $color_red "It is not a MacOS Machine, exit ..."
    exit 1
else
    print_colored_line $color_green "It is a MacOS Machine, continue ..."
fi

bash ${dir_here}/macos-install-homebrew.sh
bash ${dir_here}/macos-install-dev-tools.sh
bash ${dir_here}/macos-install-oh-my-zsh.sh
bash ${dir_here}/macos-install-pyenv.sh
bash ${dir_here}/macos-install-c-compiler.sh
bash ${dir_here}/macos-install-python.sh
