#!/bin/bash

dir_here="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${dir_here}/source-amz-linux2.sh

if [ "$os_is_linux" != "Y" ]
then
    print_colored_line $color_red "It is not a Linux Machine, exit ..."
    exit 1
else
    print_colored_line $color_green "It is a Linux Machine, continue ..."
fi

bash ${dir_here}/amz-linux2-install-dev-tools.sh
su -c "bash ${dir_here}/amz-linux2-install-pyenv.sh" ec2-user
bash ${dir_here}/amz-linux2-install-c-compiler.sh
su -c "bash ${dir_here}/amz-linux2-install-python.sh" ec2-user
