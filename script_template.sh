#!/bin/sh
#
# This line tells what I do
#
# This paragraph provides more details if necessary
#
# USE:
#   show calling conventions here
#
# CAVEATS:
#   note any assumptions, preconditions, side effects
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
   cd ${THIS_SCRIPT_DIR}
   # do some stuff in this dir without changing pwd
)

(
   cd ${THIS_SCRIPT_DIR}/..
   # do some stuff in my parent dir without changing pwd
)
