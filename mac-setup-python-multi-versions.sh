#!/bin/bash
# -*- coding: utf-8 -*-
#
# Install python versions defined in config.PYTHON_VERSION_TO_INSTALL
# and make them available in your shell

source config.sh

for py_ver in ${PYTHON_VERSION_TO_INSTALL[@]}
do
    pyenv install ${py_ver} -s
done

pyenv global ${PYTHON_VERSION_TO_INSTALL}
