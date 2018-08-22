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
    # Do stuff in the dir the script lives in without changing pwd
    # Know that we know our dir, constructing relative paths is easy
    # NOTE: the parens isolate the change by shifting into a subshell
)

# You could do directory insensitive things here, but have a good
# reason for not just putting them into a single paren block

(
    cd ${THIS_SCRIPT_DIR}/..
    # Do some stuff in my parent dir without changing pwd
    # Each directory change should be scoped with ( )
)
