#!/bin/sh -e
#
# This file contains bad shell syntax and is used to demonstrate
# debugging strategies.
#
# USE:
#   ./bad_syntax.sh
#
# NOTES:
#   Note any assumptions, preconditions, side effects
#
# EXAMPLES:
#   sh -n bad_syntax.sh - syntax check mode
#   sh -x bad_syntax.sh - command logging mode
#   sh -v bad_syntax.sh - verbose mode
#
# EXIT CODES:
#   Purely demonstrational
#
# CAVEATS:
#   None
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    # Not directory dependent

    if [ -eq "foo" ]then
        echo "echo"
    else
        echo "bar"
)
