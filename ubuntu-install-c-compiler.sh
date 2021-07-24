#!/bin/bash

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-ubuntu.sh

print_colored_line $color_cyan "Install c compiler for building python from source code ..."

# install c compiler so we can install Python from source
# reference: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
apt-get install -y gcc
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev