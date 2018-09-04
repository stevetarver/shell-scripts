#!/bin/sh -e
##############################################################
#  Copyright (c) 2018 Steve Tarver. All rights reserved.     #
#                                                            #
#  This work is licensed under the terms of the MIT license. #
#  For a copy, see <https://opensource.org/licenses/MIT>.    #
##############################################################
#
# Common validation functions
#
# All functions return a 0 (true) or 1 (false), they print nothing to stdout, stderr
#
# USE:
#   In the shell file you want to use these functions:
#   source validation.sh
#   . validation.sh
#
# NOTES:
# - This file is intended to be sourced, not executed.
# - For POSIX bracket expressions, see https://www.regular-expressions.info/posixbrackets.html
# - See http://regexlib.com for egrep patterns
#
# EXAMPLES:
#
# EXIT CODES:
#   0 true
#   1 false
#
# CAVEATS:
#

# Return true (0) if arg is not empty and an integer, false (1) otherwise.
is_int() {
    printf "%s" "${1}" | grep -qE '^(\+|-)?\d+$'
}

# Return true (0) if arg is not empty and a positive integer, false (1) otherwise
is_pos_int() {
    printf "%s" "${1}" | grep -qE '^(\+)?\d+$'
}

# Return true (0) if arg is not empty and a negative integer, false (1) otherwise
is_neg_int() {
    printf "%s" "${1}" | grep -qE '^-\d+$'
}

# Return true (0) if arg is null or empty string, false (1) otherwise
is_empty() {
    [ -z "${1}" ]
}

# Return true (0) if arg is null, empty, or spaces only string, false (1) otherwise
is_blank() {
    [ -z ${1} ]
}

# Return true (0) if arg contains some characters including spaces, false (1) otherwise
is_not_empty() {
    [ -n "${1}" ]
}

# Return true (0) if arg contains some characters other than spaces, false (1) otherwise
is_not_blank() {
    printf "%s" ${1} | grep -qE '^\S'
}

# Return true (0) if ${1} is in list ${2}, false (1) otherwise
# ${1} : a word
# ${2} : a word list like 'smoke integration regression'
is_enum() {
    local ENUM="${1}"
    # Remove enum from ${@}
    shift
    # The space following %s is important; it provides space delimited words.
    # Without it, "%s", you get 'debuginfowarnerror'
    is_not_blank "${ENUM}" && printf "%s " "${@}" | grep -qE "\b${ENUM}\b"
}
