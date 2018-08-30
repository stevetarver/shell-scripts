#!/bin/sh -e
#
# Example of manual exit code checking
#
# Manually check called script exit code to allow 0, 4, but no others.
# This strategy provides immediate caller feedback by printing to stdout.
#
# USE:
#   ./ex_error_code_check_3.sh [EXIT_CODE]
#
#   EXIT_CODE, optional, default = 4. The exit code our called script will return.
#   Provide an exit code to test different legs of the exit code checking.
#
# NOTES:
#
# EXAMPLES:
#   ./exit_code_check_2.sh
#   echo $?
#   0
#
#   ./exit_code_check_2.sh 0
#   echo $?
#   0
#
#   ./exit_code_check_2.sh 1
#   echo $?
#   4
#
# EXIT CODES:
#   4 Unrecoverable error from script return_exit_code.sh
#
# CAVEATS:
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    cd ${THIS_SCRIPT_DIR}

    # Default exit code for the script we call is 4
    INTERNAL_CODE=4
    # Set called script exit code if user supplied one
    [ -n "${1}" ] && INTERNAL_CODE=${1}

    # Intentionally turn off default error checking for this script call
    set +e
    ./return_exit_code.sh ${INTERNAL_CODE}
    # capture the exit code - any operation will overwrite it - including set, test & echo
    EXIT_CODE=$?
    set -e
    # continue script execution with error checking on

    # provide blocks to handle each error code
    # Note: We *KNOW* we are working with integers so we do not wrap ${EXIT_CODE} with
    #       double quotes.
    if [ ${EXIT_CODE} -eq 0 ]; then
        # Do what ever with script success
        [ -n "no-op" ] # a benign operation returning 0
    elif [ ${EXIT_CODE} -eq 4 ]; then
        # Do what ever with script failure returning exit code 4
        [ -n "no-op" ] # a benign operation returning 0
    else
        exit 4
    fi
)
