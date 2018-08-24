#!/bin/sh -e
#
# Conditional test examples: string empty
#
# Provides a playground for various 'test' functions, allowing callers
# to supply their own input. See output comments for details on each
# example.
#
# TL;DR: WRAP YOUR VARS WITH DOUBLEQUOTES
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    cd ${THIS_SCRIPT_DIR}
    source 'conditionals_common.sh'

    bar
    info 'Empty string tests - including buggy code.'
    info
    info "USE: ${0} VAR"
    divider
    info "  'test -z arg' returns true (0) if string length is zero."
    info "  'test -n arg' returns true (0) if string length is nonzero."
    info '  Use in Bourne scripts is usually:'
    info '    [ flag "${VAR}" ]'
    info
    info '  LESSON: ALWAYS surround the variable with doublequotes.'
    info
    info '  NOTES:'
    info '  - Interesting edge cases: null, empty, and space strings.'
    info
    info '  Without VAR wrapped in double quotes, the -n test returns the wrong value for:'
    info "    ${0}"
    info "    ${0} ''"
    info '  and the -z test returns the wrong value for:'
    info "    ${0} '  '"
    divider


    info 'buggy  : [ -n  ${1}  ] && true || false'
    [ -n ${1} ] && true || false
    info 'correct: [ -n "${1}" ] && true || false'
    [ -n "${1}" ] && true || false
    RESULT=$([ -n "${1}" ] && echo -e "${TRUE_STRING}" || echo -e "${FALSE_STRING}")
    info "${RESULT} is the correct answer."

    divider

    info 'buggy  : [ -z  ${1}  ] && true || false'
    [ -z ${1} ] && true || false
    info 'correct: [ -z "${1}" ] && true || false'
    [ -z "${1}" ] && true || false
    RESULT=$([ "${1}x" = "x" ] && echo -e "${TRUE_STRING}" || echo -e "${FALSE_STRING}")
    info "${RESULT} is the correct answer."

    bar
)
