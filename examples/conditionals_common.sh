#!/bin/sh -e
#
# Common functions for "conditionals_*.sh" examples
#
#
# NOTES:
#   This file is intended to be sourced, not executed.
#   Also shows simple functions and concole character coloring
#

# Print to console with a standard prefix. If a second arg is provided,
# it should be a color code True|False: use '-e' to print properly
info() {
    echo -e "==== ${1}"
}

# Print a section divider to identify sections
bar() {
    info '================================================================================'
}

# Print a comment divider to separate section comments
divider() {
    info '--------------------------------------------------------------------------------'
}

# Colored strings for 'True', 'False' - so they can be used in info()
TRUE_STRING='\e[1m\e[92mTrue\e[0m'
FALSE_STRING='\e[1m\e[91mFalse\e[0m'

# Print a green 'True'
true() {
    echo -e "${TRUE_STRING}"
}

# Print a red 'False'
false() {
    echo -e "${FALSE_STRING}"
}
