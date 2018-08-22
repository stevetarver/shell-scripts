#!/bin/sh -e
#
# Stand up an Alpine container, mount this directory to /tmp,
# sh into the container, and create a subshell in our project directory.
#
# NOTES:
#   We (imperfectly) handle differences in readlink between mac (Darwin)
#   and Alpine.
#
#   If you need another shell connected to this container:
#     docker exec -it alpine-test sh -c 'cd /tmp; sh'
#
#   If you don't want the extra subshell I use for convenience to
#   dump you into /tmp, you can omit "-c 'cd /tmp; sh'" and
#   'cd /tmp'.
#
# CAVEATS:
#   Our directory locator will not reliably work on a mac when this
#   script is called through a symlink
#
# TODO:
#   Figure out a robust directory locator for a symlink on mac.
#   Researched readlink & stat & google and found no solution but
#   'brew install coreutils' and greadlink.
#
if [ "$(uname -s)" = "Darwin" ]; then
    # If called through a symlink, this will point to the symlink
    THIS_SCRIPT_DIR="$( cd "$( dirname "${0}" )" && pwd )"
else
    THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
fi
(
    cd ${THIS_SCRIPT_DIR}

    # Create/start our container, and run sh from /tmp
    docker run -it --rm     \
        --name alpine-test  \
        -v $(pwd):/tmp      \
        alpine:3.6          \
        sh -c 'cd /tmp; sh'
)
