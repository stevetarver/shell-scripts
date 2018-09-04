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

echo
echo 'How can you reliably find this script'\''s directory?'
echo

echo 'Get the absolute path to this script with:'
echo '  THIS_SCRIPT=$(readlink -f "$0")'
THIS_SCRIPT=$(readlink -f "$0")
echo "THIS_SCRIPT = '${THIS_SCRIPT}'"
echo

echo 'Get the directory this script lives in:'
echo '  THIS_SCRIPT_DIR=$(dirname "${THIS_SCRIPT}")'
THIS_SCRIPT_DIR=$(dirname "${THIS_SCRIPT}")
echo "THIS_SCRIPT_DIR = '${THIS_SCRIPT_DIR}'"
echo

echo "'echo' has problems with leading '\' and some '-'. Avoid that with printf:"
echo '  printf "%s\\n" "This script lives in $(dirname $(readlink -f $0))"'
printf "%s\\n" "This script lives in $(dirname $(readlink -f $0))"
echo

echo "Mac has a crappy readlink and stat - we can't be as robust as the above."
echo 'We can get close and just report improperly on symbolic links...'
echo 'if [ "$(uname -s)" = "Darwin" ]; then'
echo '    # If called through a symlink, this will point to the symlink'
echo '    THIS_SCRIPT_DIR="$( cd "$( dirname "${0}" )" && pwd )"'
echo '    echo "Mac says THIS_SCRIPT_DIR = '\''${THIS_SCRIPT_DIR}'\''"'
echo 'else'
echo '    THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))'
echo '    echo "Everyone else says THIS_SCRIPT_DIR = '\''${THIS_SCRIPT_DIR}'\''"'
echo 'fi'
if [ "$(uname -s)" = "Darwin" ]; then
    # If called through a symlink, this will point to the symlink
    THIS_SCRIPT_DIR="$( cd "$( dirname "${0}" )" && pwd )"
    echo "Mac says THIS_SCRIPT_DIR = '${THIS_SCRIPT_DIR}'"
else
    THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
    echo "Everyone else says THIS_SCRIPT_DIR = '${THIS_SCRIPT_DIR}'"
fi
