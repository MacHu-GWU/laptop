#!/bin/bash

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-macos.sh

print_colored_line $color_cyan "Install common developer tools ..."

brew_install_this_if_not_exists jq
