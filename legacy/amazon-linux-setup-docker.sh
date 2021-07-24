#!/bin/bash
# -*- coding: utf-8 -*-

source amazon-linux-setup-pyenv-lib.sh

# install docker, used for lambda deployment
yum_install_this_if_not_exists "docker"
yum_install_this_if_not_exists "systemctl"
systemctl start docker # run docker in background
