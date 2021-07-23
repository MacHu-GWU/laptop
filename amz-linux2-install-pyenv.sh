#!/bin/bash

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-amz-linux2.sh

print_colored_line $color_cyan "Install python version manager - pyenv ..."

# install pyenv
if this_command_exists "pyenv"
then
    print_colored_line $color_cyan "pyenv is already installed."
else
    print_colored_line $color_cyan "pyenv is NOT installed! start install pyenv ..."
    curl -s https://pyenv.run | bash

    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init --path)"

    touch ~/.bashrc
    add_line_to 'export PYENV_ROOT="$HOME/.pyenv"' ~/.bashrc
    add_line_to 'export PATH="$PYENV_ROOT/bin:$PATH"' ~/.bashrc
    add_line_to 'eval "$(pyenv init --path)"' ~/.bashrc

    touch ~/.bash_profile
    add_line_to 'export PYENV_ROOT="$HOME/.pyenv"' ~/.bash_profile
    add_line_to 'export PATH="$PYENV_ROOT/bin:$PATH"' ~/.bash_profile
    add_line_to 'eval "$(pyenv init --path)"' ~/.bash_profile

    print_colored_line $color_green 'Successfully installed pyenv, enter "$ bash" to reload your shell...'
    print_colored_line $color_green 'type pyenv to test if it is successfully installed'
fi