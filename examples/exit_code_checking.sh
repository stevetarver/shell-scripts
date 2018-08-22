#!/bin/sh -e
#
# Example of manual exit code checking
#
# Manually check called script exit code to allow 0, 1, but no others.
#
#
# USE:
#   ./ex_error_code_checking.sh [EXIT_CODE]
#   EXIT_CODE is the what the test script will return and what we will
#   check. Default = 2. You can specify your own to test different scenarios.
#
# CAVEATS:
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    cd ${THIS_SCRIPT_DIR}

    # default exit code for the script we call is 2
    INTERNAL_CODE=2
    # set called script exit code if user supplied one
    [ "${1}x" = "x" ] && INTERNAL_CODE=${1}

    # intentionally turn off error check for this script call
    # - as tightly scoped as possible
    set +e
    return_exit_code.sh ${INTERNAL_CODE}
    set -e

    # capture the exit code - any operation will overwrite it - including test & echo
    EXIT_CODE=$?

    # provide blocks to handle each error code
    # Note: we are not following our standard pattern [ "${EXIT_CODE}x" = "x" ]
    #       because we *know* the value will exist AND we are *only* working
    #       with numbers.
    if [ ${EXIT_CODE} -eq 0 ]; then
        # Do what ever with script success
        echo "Script succeeded. Exit code: ${EXIT_CODE}"
    elif [ ${EXIT_CODE} -eq 1 ]; then
        # Do what ever with script failure returning exit code 1
        echo "Script failed, but we will continue processing. Exit code: ${EXIT_CODE}"
    else
        echo "Unrecoverable error. Exit code: ${EXIT_CODE}. Aborting"
        exit ${EXIT_CODE}
    fi

    # continue script execution with error checking on
)
