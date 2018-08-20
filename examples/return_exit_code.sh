#!/bin/sh -e
#
# I apply the provided 'set' flags and  exit with the provided code
#
# Provides output and exit codes for testing with other scripts
#
# USE:
#   ./return_exit_code.sh EXIT_CODE SET_FLAGS
#   ./return_exit_code.sh 2     # OK to omit 'set' flags
#   ./return_exit_code.sh 1 -ex # print debug output
#   ./return_exit_code.sh 1 +ex # prevent inheriting -ex from calling script
#
# CAVEATS:
#   -e not on shebang - applied based on script args
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    # if set applied here, the printed stack starts here
    # if set applied at the shebang, all executed commands are printed.
    [ -n "${2}" ] && set ${2}
    exit ${1}
)
