#!/bin/bash
# -*- coding: utf-8 -*-

source amazon-linux-setup-pyenv-lib.sh

# install c compile so we can install Python from source
yum -y install gcc
yum -y install @development zlib-devel bzip2 bzip2-devel tar \
    readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel \
    findutils
