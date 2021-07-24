#!/bin/bash

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-redhat.sh

print_colored_line $color_cyan "Install c compiler for building python from source code ..."

# install c compiler so we can install Python from source
# reference: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
yum -y install gcc
yum -y install @development zlib-devel bzip2 bzip2-devel tar \
    readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel \
    findutils
