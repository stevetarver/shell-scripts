#!/bin/sh -e
#
# Identify this script's directory so we can reliably locate files in other dirs
#
# Works when called:
# - from the local directory
# - from any other directory
# - through a symbolic link
# - and the script is on your ${PATH}
#
# Use:
#   Every script should use this as a base:
#   THIS_SCRIPT_DIR=$(dirname $(readlink -f "$0"))
#   (
#       cd ${THIS_SCRIPT_DIR}
#   )
#
# See: script_template.sh
#

# Get the absolute path to this script
THIS_SCRIPT=$(readlink -f "$0")

# Get the directory this script lives in
THIS_SCRIPT_DIR=$(dirname "${THIS_SCRIPT}")

echo "This script lives in ${THIS_SCRIPT_DIR}"

# Avoid inconsistent behaviour with echo: in POSIX, echo has unspecified
# behavior if any of its arguments contain “\” or if its first argument is “-n”.
printf "%s\\n" "This script lives in $(dirname $(readlink -f $0))"
