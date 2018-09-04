#!/bin/sh -e
#
# Common functions for "test_*.sh" examples: using the 'test' command.
#
# NOTES:
#   This file is intended to be sourced, not executed.
#
#   Notice the different use of THIS_SCRIPT_DIR - it allows locating our included
#   scripts but does not create a scope block (subshell) so that all the functions
#   we define are visible to those that source us.
#
# EXIT CODES:
#   None
#
# CAVEATS:
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
source ${THIS_SCRIPT_DIR}/../common/colors.sh

# Print to console with a standard prefix. If a second arg is provided,
# it should be a color code True|False: use '-e' to print properly
info() {
    stderr "==== ${1}"
}

# Print a section divider to identify sections
bar() {
    stderr '===================================================================================='
}

# Print a comment divider to separate section comments
divider() {
    stderr '------------------------------------------------------------------------------------'
}

# Print a green 'True'
true() {
    echo "$(green 'True ')"
}

# Print a red 'False'
false() {
    echo "$(red 'False')"
}

# Print whether true (0) or false (1) is the correct answer. Callers should evaluate the
# predicate and provide the return code to this function.
# e.g. correct_answer $([ -z "${1}" ]; echo "${?}")
correct_answer() {
    if [ "${1}" = "0" ]; then
        stderr "$(true)   is the correct answer."
    else
        stderr "$(false)   is the correct answer."
    fi
}