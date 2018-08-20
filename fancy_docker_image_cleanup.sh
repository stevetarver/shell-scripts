#!/bin/sh -e
#
# I remove the specified docker container and image
#
# This could be used during a build cycle to clean up build artifacts.
# Demonstrates checking for images and containers and conditionally
# removing them.
#
# USE:
#   see help()
#
# CAVEATS:
# - We grep for containers created from IMAGE_NAME that match CONTAINER_NAME.
#   Because we use grep to find it, you can use any grep expression to match
#   multiple containers.
# - We search for exact matches on IMAGE_NAME so './SCRIPT.sh alpine' will match
#   'alpine:latest' and 'alpine:3.6', but not 'alpine-bash:latest'.
#
show_help () (
    echo "Remove docker image and, optionally, associated containers"
    echo
    echo "USE:"
    echo "  ${0} IMAGE_NAME [CONTAINER_NAME]"
    echo
    echo "  IMAGE_NAME:     'image:tag' for a single image, or 'image' to"
    echo "                  remove matching images regardless of tag."
    echo "  CONTAINER_NAME: container name using grep matching. Restricted to"
    echo "                  those created from IMAGE_NAME. Optional."
    echo
    echo "EXAMPLES:"
    echo
    echo "  ${0} alpine:3.6   remove the alpine:3.6 image"
    echo "  ${0} alpine       remove all 'alpine' images, e.g alpine:3.5, alpine:latest"
    echo
    exit 1
)

THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    # docker commands are not directory sensitive - no cd ${THIS_SCRIPT_DIR} needed

    ECHO_PREFIX='===>'
    IMAGE_NAME="${1}"
    CONTAINER_NAME="${2}"

    # Verify preconditions
    # Ensure user provided an IMAGE_NAME - don't want to accidentally delete everything
    [ "${IMAGE_NAME}x" = "x" ] && show_help

    # Does caller want us to remove containers
    if [ "${CONTAINER_NAME}x" != "x" ]; then
        # Does the container exist?
        CONTAINERS=$(docker ps -a -f "ancestor=${IMAGE_NAME}" | grep ${CONTAINER_NAME} | cut -f1 -d' ')

        if [ "${CONTAINERS}x" != "x" ]; then
            echo "${ECHO_PREFIX} Stopping and removing ${CONTAINER_NAME} containers"
            docker rm -fv ${CONTAINERS}
        else
            echo "${ECHO_PREFIX} No ${CONTAINER_NAME} containers running"
        fi
    fi

    IMAGES=$(docker images -q ${IMAGE_NAME} | uniq)

    if [ -n "${IMAGES}" ]; then
        echo "${ECHO_PREFIX} Removing ${IMAGE_NAME} images"
        docker rmi -f ${IMAGES}
    else
        echo "${ECHO_PREFIX} No ${IMAGE_NAME} images exist"
    fi

    # present prompt to user to allow them to opt out
    echo "${ECHO_PREFIX} Removing orphaned docker volumes"
    docker volume prune

    # TODO: clean up dangling images and volumes to keep the VM clean

    # see https://www.projectatomic.io/blog/2015/07/what-are-docker-none-none-images/
    # Currently, this casts too wide a net
    # DANGLING=$(docker images -q -f 'dangling=true')
    # if [ "${DANGLING}x" != "x" ]; then
    #     echo "${ECHO_PREFIX} Removing dangling images"
    #     docker rmi -f ${DANGLING}
    # else
    #     echo "${ECHO_PREFIX} No dangling images exist"
    # fi
)
