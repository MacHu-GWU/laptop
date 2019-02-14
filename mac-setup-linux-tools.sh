#!/bin/bash
# -*- coding: utf-8 -*-

source mac-lib.sh
source mac-lib-homebrew.sh

formulas_to_install="curl wget git"
formulas_to_install=($formulas_to_install)
for formula in ${formulas_to_install[@]}
do
    if this_command_exists "${formula}"; then
        echo "${formula} is already installed."
    else
        echo "${formula} is NOT installed! start install ${formula}:"
        brew install "${formula}"
    fi
done
