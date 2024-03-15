#!/bin/sh

<<<<<<< HEAD
IMAGE_TAG="andwn/ym2017:latest"
=======
IMAGE_TAG="ym1202173-ca4sk5ll/ym1202173-ca4sk5ll:test1"
>>>>>>> 0c077de (Create build-rom.sh)
IMAGE_NAME="ym2017"
MARSDEV_REVISION="2017.09.12"

rm ym2017*.bin
docker build \
    --tag ${IMAGE_TAG} \
    --build-arg MARSDEV_REVISION=${MARSDEV_REVISION} \
    .
docker run \
    --volume "${PWD}:/src" \
    --rm \
    --name ${IMAGE_NAME} \
    ${IMAGE_TAG} \
    /bin/bash -c "make clean all"
GIT_REVISION=$(docker run \
    --volume "${PWD}:/src" \
    --rm \
    --name ${IMAGE_NAME} \
    ${IMAGE_TAG} \
    /bin/bash -c "git rev-parse HEAD")
mv ym2017.bin ym2017-${GIT_REVISION}.bin
