#!/bin/sh -e
#
# This line tells what I do
#
# This paragraph provides more details if necessary
#
# USE:
#   Show calling conventions here
#
# NOTES:
#   Note any assumptions, preconditions, side effects
#
# CAVEATS:
#   Any warnings for script use?
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    cd ${THIS_SCRIPT_DIR}
    # Do some stuff in this dir without changing pwd
)

(
    cd ${THIS_SCRIPT_DIR}/..
    # Do some stuff in my parent dir without changing pwd
    # Each directory change should be scoped with ( )
)
