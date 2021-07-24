#!/bin/bash

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-redhat.sh

print_colored_line $color_cyan "Install common developer tools ..."

# install curl to make http request
yum_install_this_if_not_exists "curl"
# install wget to download files from web server
yum_install_this_if_not_exists "wget"
# install jq to parse json
yum_install_this_if_not_exists "jq"
# install git
yum_install_this_if_not_exists "git"
