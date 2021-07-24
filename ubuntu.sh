#!/bin/bash

# Run this script with ``sudo bash amz-linux2.sh`` on Amazon Linux 2 EC2
# Some tools has to be installed with sudo. But pyenv related tools don't need sudo

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-redhat.sh

if [ "$os_is_linux" != "Y" ]
then
    print_colored_line $color_red "It is not a Linux Machine, exit ..."
    exit 1
else
    print_colored_line $color_green "It is a Linux Machine, continue ..."
fi

bash ${dir_here}/ubuntu-install-dev-tools.sh
su -c "bash ${dir_here}/ubuntu-install-pyenv.sh" ubuntu
bash ${dir_here}/ubuntu-install-c-compiler.sh
su -c "bash ${dir_here}/ubuntu-install-python.sh" ubuntu
