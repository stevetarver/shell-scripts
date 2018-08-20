#!/bin/sh
#
# Example: Using set's x flag; the command logger
#
# Command logging can be turned on with 'set -x' and off with 'set +x'
#
# #!/bin/sh -ex turns on command logging for the entire file, unless explicitly
# disabled. Setting the flag in this script does not turn on command logging
# in the script we call.
#
# You could use a DEBUG environment variable to enable command logging like this:
#   [ -n "${DEBUG}" ] && set -x
#
# USE:
#   ./ex_set_x.sh
#
# CAVEATS:
#  shebang omits -e; we are manually checking for errors
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    cd ${THIS_SCRIPT_DIR}

    # turn on cmd logging
    set -x
    return_exit_code.sh 1

    # capture the exit code - any operation will overwrite it
    EXIT_CODE=$?
    if [ ${EXIT_CODE} -ne 0 ]; then
        echo "Script failed with exit code: ${EXIT_CODE}"
    fi
    # disable cmd logging
    set +x
)
