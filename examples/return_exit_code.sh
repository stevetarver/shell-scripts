#!/bin/sh
#
# I apply the provided 'set' flags and exit with the provided code
#
# Provides output and exit codes for testing with other scripts
#
# USE:
#   see show_help()
#
# CAVEATS:
#   -e not on shebang - applied based on script args
#
show_help () (
    echo "Exit with the specified exit code, optionally turn on command logging"
    echo
    echo "USE:"
    echo "  ${0} EXIT_CODE [SET_ARGS]"
    echo
    echo "  EXIT_CODE:  The exit code to exit with (default 1)"
    echo "  SET_ARGS:   Args applied to 'set' prior to first command (optional)"
    echo "              E.g. -e, -x, -ex, +e, +x, +ex"
    echo "              No arg validation, you can pass anything."
    echo
    echo "EXAMPLES:"
    echo
    echo "  ${0}         Exit with code 1"
    echo "  ${0} 2       Exit with code 2"
    echo "  ${0} 2 -ex   Exit with code 2, turn on error checking, command logging"
    echo
    exit 2
)

# Apply 'set' args before commands are executed
[ "${2}x" != "x" ] && set ${2}

# Include directory locator to provide more interesting command logging
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    # Set default values
    EXIT_CODE=1
    [ "${1}x" != "x" ] && EXIT_CODE=${1}

    exit ${EXIT_CODE}
)
