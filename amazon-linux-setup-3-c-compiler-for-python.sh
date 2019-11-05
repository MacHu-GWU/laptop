#!/bin/bash
# -*- coding: utf-8 -*-

source amazon-linux-setup-pyenv-lib.sh

# install curl to make http request
yum_install_this_if_not_exists "curl"
# install jq to parse json
yum_install_this_if_not_exists "jq"
