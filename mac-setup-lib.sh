#!/bin/bash
# -*- coding: utf-8 -*-
#
# MaxOS shared library, will be sourced in any ``amazon-linux-setup-xxx.sh`` file

source unix-lib.sh
source detect-os.sh

if [ "$os_is_darwin" != "Y" ]; then
    print_colored_line $color_red "It is not a MacOS Machine, exit ..."
    exit 1
fi
