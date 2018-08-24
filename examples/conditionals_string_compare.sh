#!/bin/sh -e
#
# Conditional test examples: string comparisons
#
# Provides a playground for various 'test' functions, allowing callers
# to supply their own input. See output comments for details on each
# example.
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    cd ${THIS_SCRIPT_DIR}
    source 'conditionals_common.sh'

    bar
    info 'Because of the buggy code examples, you may create files that may alter results.'
    info 'For each run, we will create a temp dir for that run and clean it up when complete.'
    info
    info 'CAVEATS:'
    info ' - If you use args like 1, 2, you will redirect output to stdout, stderr'
    info
    MY_TMP_DIR=$(mktemp -d)
    info "Created temp dir '${MY_TMP_DIR}' and changing to that dir"
    cd ${MY_TMP_DIR}
    pwd

    bar
    info 'String comparison tests'
    info
    info "USE: ${0} S1 S2"
    divider
    info '  s1 = s2    True if the strings s1 and s2 are identical.'
    info '  s1 != s2   True if the strings s1 and s2 are not identical.'
    info '  s1 < s2    True if string s1 comes before s2 based on the binary value of their characters.'
    info '  s1 > s2    True if string s1 comes after s2 based on the binary value of their characters.'
    info
    info '  In Bourne scripts, usually:'
    info '    [ "${S1}" '\''op'\'' "${S2}" ]'
    info
    info '  LESSONS:'
    info '  - ALWAYS surround the variable with doublequotes.'
    info '  - ALWAYS surround the operator with single quotes'
    info
    info '  Interesting edge cases: null, empty, and space strings.'
    info
    info '  CAVEATS:'
    info '  - If you do not surround the variable with doublequotes, null, empty, and'
    info '    space strings will produce "unknown operand", "out of range",'
    info '    "argument expected", "can''t create : nonexistent directory", etc.'
    info '  - If you do not surround the operator with single quotes, the <, > will'
    info '    be interpreted as redirection operators and =, != will have'
    info '    problems with null and empty strings. Better to have one rule that you'
    info '    apply consistently.'
    divider

    # todo: figure out if I want to show redirects unquoted

    RESULT=$([ "${1}" = "${2}" ] && echo -e "${TRUE_STRING}" || echo -e "${FALSE_STRING}")
    info "${RESULT} is the correct answer."
    info 'buggy  : [  ${1}  '\''='\''  ${2} ] && true || false'
    [  ${1}  '='  ${2} ] && true || false
    info 'buggy  : [ "${1}" '\''='\''  ${2} ] && true || false'
    [ "${1}" '='  ${2} ] && true || false
    info 'buggy  : [  ${1}  '\''='\'' "${2}" ] && true || false'
    [  ${1}  '=' "${2}" ] && true || false
    info 'correct: [ "${1}" '\''='\'' "${2}" ] && true || false'
    [ "${1}" '=' "${2}" ] && true || false

    divider

    RESULT=$([ "${1}" != "${2}" ] && echo -e "${TRUE_STRING}" || echo -e "${FALSE_STRING}")
    info "${RESULT} is the correct answer."
    info 'buggy  : [  ${1}  '\''!='\''  ${2} ] && true || false'
    [  ${1}  !=  ${2} ] && true || false
    info 'buggy  : [ "${1}" '\''!='\''  ${2} ] && true || false'
    [ "${1}" !=  ${2} ] && true || false
    info 'buggy  : [  ${1}  '\''!='\'' "${2}" ] && true || false'
    [  ${1}  != "${2}" ] && true || false
    info 'correct: [ "${1}" '\''!='\'' "${2}" ] && true || false'
    [ "${1}" != "${2}" ] && true || false

    divider

    RESULT=$([ "${1}" '>' "${2}" ] && echo -e "${TRUE_STRING}" || echo -e "${FALSE_STRING}")
    info "${RESULT} is the correct answer."
    info 'buggy  : [  ${1}  '\''>'\''  ${2} ] && true || false'
    [  ${1}  >  ${2} ] && true || false
    info 'buggy  : [ "${1}" '\''>'\''  ${2} ] && true || false'
    [ "${1}" '>'  ${2} ] && true || false
    info 'buggy  : [  ${1}  '\''>'\'' "${2}" ] && true || false'
    [  ${1}  '>' "${2}" ] && true || false
    info 'correct: [ "${1}" '\''>'\'' "${2}" ] && true || false'
    [ "${1}" '>' "${2}" ] && true || false

    bar
    info 'The following files were created in the temp directory'
    ls -la ${MY_TMP_DIR}

    info "Removing temp directory ${MY_TMP_DIR}"
    rm -rf ${MY_TMP_DIR}
    bar
)