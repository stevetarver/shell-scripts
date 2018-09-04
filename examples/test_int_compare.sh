#!/bin/sh -e
#
# Conditional test examples: number comparisons
#
# Provides a playground for various 'test' functions, allowing callers
# to supply their own input. See output comments for details on each
# example.
#
# EXIT CODES:
#   None
#
# CAVEATS:
#   None

# Print a green valid int msg
valid_int() {
    stderr "$(green 'Arg '${1}' ('${2}') is a valid integer.')"
}

# Print a red invalid int msg
invalid_int() {
    stderr "$(red 'Arg '${1}' ('${2}') is not a valid integer and should produce False in '\''correct'\'' code in every\\n      test. Invalid args will also produce 'sh' errors!')"
}

THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    cd ${THIS_SCRIPT_DIR}
    source test_common.sh

    bar
    info 'Integer comparison tests'
    info
    info "USE: ${0} N1 N2"
    info

    info "  n1 -eq n2  True if the integers n1 and n2 are algebraically equal."
    info "  n1 -ne n2  True if the integers n1 and n2 are not algebraically equal."
    info "  n1 -gt n2  True if the integer n1 is algebraically greater than the integer n2."
    info "  n1 -ge n2  True if the integer n1 is algebraically greater than or equal to the integer n2."
    info "  n1 -lt n2  True if the integer n1 is algebraically less than the integer n2."
    info "  n1 -le n2  True if the integer n1 is algebraically less than or equal to the integer n2."
    info
    info '  In Bourne scripts, usually:'
    info '    [ "${N1}" flag "${S2}" ]'
    info
    info 'NOTES:'
    info '- Interesting edge cases are null, empty, or space strings, valid strings,'
    info '  punctuation, and decimal numbers.'
    info
    info 'CAVEATS:'
    info '- You MUST always surround the variable with doublequotes.'
    info '  Otherwise, null, empty, and space strings will produce "unknown operand",'
    info '  "out of range", "argument expected", etc.'
    info '- Args must be integers - using invalid args should error with "bad number" and produce False.'
    info '  Do not use these comparisons unless you KNOW that both args are numbers.'
    info '  E.g. if you KNOW a command produces an integer, what happens when it has an error?'
    info '  Is that a string?'
    divider

    info 'Test that args are integers.'
    info
    info 'Use this code in a conditional:'
    info '  printf "%s" "${1}" | grep -qE '\''^(\+|-)?\d+$'\'''
    info
    info 'Use this code to get the string value of the exit code:'
    info '  IS_INT=$(printf "%s" "${1}" | grep -qE '\''^(\+|-)?\d+$'\''; echo $?)'
    info
    info 'This code is dense; let'\''s break it down:'
    info '  echo "${1}"    prints script arg one to stdout'
    info '  |              pipes stdout to the next command in the list'
    info '  grep -qE       q says don'\''t print anything, only return the exit code'
    info '                 E enables grep'\''s extended regex syntax'
    info '  '\''^(\+|-)?\d+$'\'' matches an optional +|-, any number of digits,'
    info '                 and ^..$ includes the whole string'
    info '  ;              terminates the first command chain in the list'
    info '  echo $?        prints the exit code from the last command to stdout'
    info '  $()            wraps the command list, executes list item, and returns stdout'
    info
    info 'Let'\''s test the code:'
    info

    info 'code   : echo "${1}" | grep -qE '\''^(\+|-)?\d+$'\'' && valid_int "1" "${1}" || invalid_int "1" "${1}"'
    echo "${1}" | grep -qE '^(\+|-)?\d+$' && valid_int "1" "${1}" || invalid_int "1" "${1}"
    info 'code   : echo "${2}" | grep -qE '\''^(\+|-)?\d+$'\'' && valid_int "2" "${2}" || invalid_int "2" "${2}"'
    echo "${2}" | grep -qE '^(\+|-)?\d+$' && valid_int "2" "${2}" || invalid_int "2" "${2}"

    divider

    stderr "$([  ${1}  -eq  ${2}  ] && true || false)"' : [  ${1}  -eq  ${2}  ]'
    stderr "$([ "${1}" -eq  ${2}  ] && true || false)"' : [ "${1}" -eq  ${2}  ]'
    stderr "$([  ${1}  -eq "${2}" ] && true || false)"' : [  ${1}  -eq "${2}" ]'
    stderr "$([ "${1}" -eq "${2}" ] && true || false)"' : [ "${1}" -eq "${2}" ]'
    correct_answer $([ "${1}" -eq "${2}" ]; echo "${?}")

    divider

    stderr "$([  ${1}  -ne  ${2}  ] && true || false)"' : [  ${1}  -ne  ${2}  ]'
    stderr "$([ "${1}" -ne  ${2}  ] && true || false)"' : [ "${1}" -ne  ${2}  ]'
    stderr "$([  ${1}  -ne "${2}" ] && true || false)"' : [  ${1}  -ne "${2}" ]'
    stderr "$([ "${1}" -ne "${2}" ] && true || false)"' : [ "${1}" -ne "${2}" ]'
    correct_answer $([ "${1}" -ne "${2}" ]; echo "${?}")

    divider

    stderr "$([  ${1}  -gt  ${2}  ] && true || false)"' : [  ${1}  -gt  ${2}  ]'
    stderr "$([ "${1}" -gt  ${2}  ] && true || false)"' : [ "${1}" -gt  ${2}  ]'
    stderr "$([  ${1}  -gt "${2}" ] && true || false)"' : [  ${1}  -gt "${2}" ]'
    stderr "$([ "${1}" -gt "${2}" ] && true || false)"' : [ "${1}" -gt "${2}" ]'
    correct_answer $([ "${1}" -gt "${2}" ]; echo "${?}")

    divider

    stderr "$([  ${1}  -ge  ${2}  ] && true || false)"' : [  ${1}  -ge  ${2}  ]'
    stderr "$([ "${1}" -ge  ${2}  ] && true || false)"' : [ "${1}" -ge  ${2}  ]'
    stderr "$([  ${1}  -ge "${2}" ] && true || false)"' : [  ${1}  -ge "${2}" ]'
    stderr "$([ "${1}" -ge "${2}" ] && true || false)"' : [ "${1}" -ge "${2}" ]'
    correct_answer $([ "${1}" -ge "${2}" ]; echo "${?}")

    divider

    stderr "$([  ${1}  -lt  ${2}  ] && true || false)"' : [  ${1}  -lt  ${2}  ]'
    stderr "$([ "${1}" -lt  ${2}  ] && true || false)"' : [ "${1}" -lt  ${2}  ]'
    stderr "$([  ${1}  -lt "${2}" ] && true || false)"' : [  ${1}  -lt "${2}" ]'
    stderr "$([ "${1}" -lt "${2}" ] && true || false)"' : [ "${1}" -lt "${2}" ]'
    correct_answer $([ "${1}" -lt "${2}" ]; echo "${?}")

    divider

    stderr "$([  ${1}  -le  ${2}  ] && true || false)"' : [  ${1}  -le  ${2}  ]'
    stderr "$([ "${1}" -le  ${2}  ] && true || false)"' : [ "${1}" -le  ${2}  ]'
    stderr "$([  ${1}  -le "${2}" ] && true || false)"' : [  ${1}  -le "${2}" ]'
    stderr "$([ "${1}" -le "${2}" ] && true || false)"' : [ "${1}" -le "${2}" ]'
    correct_answer $([ "${1}" -le "${2}" ]; echo "${?}")

    bar

)
