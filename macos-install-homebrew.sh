#!/bin/bash

# Reference: https://brew.sh/
dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-macos.sh

print_colored_line $color_cyan "Install homebrew ..."

if this_command_exists "brew"; then
    print_colored_line $color_cyan "brew is already installed."
else
    print_colored_line $color_cyan "brew is NOT installed! start install:"
    xcode-select --install
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

