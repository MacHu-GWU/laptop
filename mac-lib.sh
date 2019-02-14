#!/bin/bash
# -*- coding: utf-8 -*-

# test if a command is installed in your system
# usage:
#
#   if this_command_exists "brew"; then ...
this_command_exists() {
    if [ -x "$(command -v $1)" ]; then
        return 0
    else
        return 1
    fi
}


# Add a line to a file, if exact line not exists
# usage:
#
#   add_line_to 'echo "Welcome to Bash!"' ~/.bash_profile
add_line_to() {
    if ! grep -xq "$1" "$2"; then
        echo "$1" >> "$2"
    fi
}
