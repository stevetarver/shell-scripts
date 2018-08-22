#!/bin/sh
#
# Example: Using set's x flag; the command logger
#
# NOTES:
#   Command logging can be turned on with 'set -x' and off with 'set +x'
#
#   A shebang like '#!/bin/sh -ex' turns on command logging for the entire file,
#   unless explicitly disabled somewhere in the script. Setting the flag in this
#   script does not turn on command logging in the script we call - that is a
#   different sub-shell.
#
#   You could use a DEBUG environment variable to enable command logging like this:
#      [ "${DEBUG}x" != "x" ] && set -x
#   That could be useful while comparing script operation with and without command
#   logging, especially if several scripts are involved.
#
# USE:
#   ./set_x.sh
#
# CAVEATS:
#   Shebang omits -e, we are manually checking for errors
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    # no directory location required

    echo
    echo "  This script should print its first arg with a newline if an arg is provided."
    echo "  It should not print anything if the arg is not provided or that arg is the"
    echo "  empty string."
    echo
    echo "  BUG: This script does not reliably print its first arg."
    echo "  SUCCESS:"
    echo "    ./set_x.sh a  prints 'a'"
    echo "  FAILURE:"
    echo "    ./set_x.sh             prints a newline"
    echo "    ./set_x.sh ''          prints a newline"
    echo "    ./set_x.sh -e          prints a newline"
    echo "    ./set_x.sh '-e'        prints a newline"
    echo "    ./set_x.sh '-n hello'  prints 'sh: hello: unknown operand'"
    echo "    ./set_x.sh '-ne hello' prints 'sh: -n: out of range'"
    echo "  Executing the code with command logging on:"
    echo

    # To see why we shouldn't be using 'echo' here, see
    # http://www.etalabs.net/sh_tricks.html
    set -x
    if [ -n ${1} ]; then
        echo ${1}
    fi
    set +x

    echo
    echo "  This is better implementation that handles all the failure cases listed."
    echo "  See the blog for caveats about using 'echo'."
    echo "  Executing the code with command logging off:"
    echo

    if [ "${1}x" != "x" ]; then
        printf "%s\\n" "${1}"
    fi
)
