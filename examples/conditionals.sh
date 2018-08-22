#!/bin/sh -e
#
# Example: examples of using the test built-in
#
# Provides a playground for various 'test' functions, allowing callers
# to supply their own input. See output comments for details on each
# example.
#
# NOTES:
#   Also shows simple functions and concole character coloring
#

# Print to console with a standard prefix, use '-e' to allow for char colors
info() {
    echo -e "==== ${1}"
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

THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    # Not directory sensitive

    info '========================================================'
    info 'String not empty tests'
    info
    info "'test -n arg' returns true (0) if string length is nonzero."
    info 'Use in Bourne scripts is usually:'
    info '  [ -n "${VAR}" ]'
    info
    info 'This works as expected for these strings:'
    info "  ${0} hello"
    info "  ${0} 'hello'"
    info "  ${0} ''"
    info "  ${0} \"\""
    info 'But fails semantically with null strings:'
    info "  ${0}"
    info '========================================================'

    RESULT=$([ "${1}x" != "x" ] && echo -e "${TRUE_STRING}" || echo -e "${FALSE_STRING}")
    info "The following test should all return ${RESULT}"

    info 'code: [ -n ${1} ] && true || false'
    [ -n ${1} ] && true || false
    info 'code: [ -n "${1}" ] && true || false'
    [ -n "${1}" ] && true || false

    info 'This code is semantically correct for empty and null strings'
    info 'code: [ "${1}x" != "x" ] && true || false'
    [ "${1}x" != "x" ] && true || false

    info '========================================================'
    info 'String empty tests'
    info
    info "'test -z arg' returns true (0) if string length is zero."
    info 'Use in Bourne scripts is usually:'
    info '  [ -z "${VAR}" ]'
    info
    info 'This works as expected for these strings:'
    info "  ${0} hello"
    info "  ${0} 'hello'"
    info "  ${0} ''"
    info "  ${0} \"\""
    info 'But fails semantically with null strings:'
    info "  ${0}"
    info '========================================================'

    RESULT=$([ "${1}x" = "x" ] && echo -e "${TRUE_STRING}" || echo -e "${FALSE_STRING}")
    info "The following test should all return ${RESULT}"

    info 'code: [ -z ${1} ] && true || false'
    [ -z ${1} ] && true || false
    info 'code: [ -z "${1}" ] && true || false'
    [ -z "${1}" ] && true || false

    info 'This code is semantically correct for empty and null strings'
    info 'code: [ "${1}x" = "x" ] && true || false'
    [ "${1}x" = "x" ] && true || false

    # Integers
)
