#!/bin/bash

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-macos.sh

print_colored_line $color_cyan "Install c compiler for building python from source code ..."

# install c compiler so we can install Python from source
# reference: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
brew install openssl readline sqlite3 xz zlib
