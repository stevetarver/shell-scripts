#!/bin/sh -e
#
# I remove the specified docker container and image
#
# This could be used during a build cycle to clean up build artifacts.
# Demonstrates checking for images and containers and conditionally
# removing them.
#
# USE:
#   ./SCRIPT.sh IMAGE_NAME [CONTAINER_NAME]
#
# CAVEATS:
# - OK to omit CONTAINER_NAME
# - We grep for containers that match CONTAINER_NAME to catch all containers
#   regardless of tag. You can take advantage of the grep matching, but ensure
#   you don't cast to wide a net.
# - We search for exact matches on IMAGE_NAME so './SCRIPT.sh alpine' will match
#   'alpine:latest' and 'alpine:3.6', but not 'alpine-bash:latest'.
#
THIS_SCRIPT_DIR=$(dirname $(readlink -f "${0}"))
(
    # docker commands are not directory sensitive - no cd ${THIS_SCRIPT_DIR} needed

    ECHO_PREFIX='===>'

    # Does caller want us to remove containers
    if [ -n "${CONTAINER_NAME}" ]; then
        # Does the container exist - note grep matching
        CONTAINERS=$(docker ps -a | grep ${CONTAINER_NAME} | cut -f1 -d' ')

        if [ -n "${CONTAINERS}" ]; then
            echo "${ECHO_PREFIX} Stopping and removing ${CONTAINER_NAME} containers"
            docker rm -f -v ${CONTAINERS}
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

    echo "${ECHO_PREFIX} Removing orphaned docker volumes"
    docker volume prune

    # TODO: clean up dangling images and volumes to keep the VM clean

    # see https://www.projectatomic.io/blog/2015/07/what-are-docker-none-none-images/
    # Currently, this casts too wide a net
    # DANGLING=$(docker images -q -f 'dangling=true')
    # if [ -n "${DANGLING}" ]; then
    #     echo "${ECHO_PREFIX} Removing dangling images"
    #     docker rmi -f ${DANGLING}
    # else
    #     echo "${ECHO_PREFIX} No dangling images exist"
    # fi
)
