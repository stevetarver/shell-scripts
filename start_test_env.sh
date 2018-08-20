#!/bin/sh
#
# Stand up an Alpine container, mount this directory to /tmp,
# and sh into the container
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
   cd ${THIS_SCRIPT_DIR}

    # Create/start an  container
    docker run -it --rm \
        -v $(pwd):/tmp  \
        alpine:3.6      \
        sh
)
