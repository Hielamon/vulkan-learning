#!/bin/bash

set -e

Usage () {
    echo "Usage: vulkan-container.sh "
    echo "       -n | --name container name"
    echo "       -i | --image vulkan image"
    echo "       -p | --persist vulkan container"
}

# Transform long options to short ones
# for arg in "$@"; do
#   shift
#   case "$arg" in
#     "--name")                       set -- "$@" "-n" ;;
#     "--image")                      set -- "$@" "-i" ;;
#     "--ephemeral")                  set -- "$@" "-e" ;;
#     *)                              set -- "$@" "$arg"
#   esac
# done

# while [ $# -gt 0 ]
# do
#     unset OPTIND
#     unset OPTARG
#     while getopts n:i:e: option
#     do
#     case $option in
#         n) CONTAINER_NAME=$OPTARG
#             ;;
#         i) DOCKER_IMAGE=$OPTARG
#             ;;
#         e) EPHEMERAL_FLAG="--rm"
#             ;;
#         \?) Usage
#             exit 1
#             ;;
#     esac
#     done
    
#     shift $((OPTIND-1))
#     if [ $# -gt 0 ];
#     then
#         shift
#     fi
# done


CONTAINER_NAME="vulkan-dev"
DOCKER_IMAGE="hielamonboren/vulkan-learning:dev-latest"
PERSIST_FLAG="--rm"
USER_ID=$(id -u ${USER})
GROUP_ID=$(id -g ${USER})
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    -n|--name)
      CONTAINER_NAME="$2"
      shift
      shift
      ;;
    -i|--image)
      DOCKER_IMAGE="$2"
      shift
      shift
      ;;
    -p|--PERSIST)
      PERSIST_FLAG=""
      shift
      ;;
    *)
      Usage
      exit 1
      ;;
  esac
done


echo "CONTAINER_NAME : ${CONTAINER_NAME}"
echo "DOCKER_IMAGE : ${DOCKER_IMAGE}"
echo "PERSIST_FLAG : ${PERSIST_FLAG}"
echo "USER_ID : ${USER_ID}"
echo "GROUP_ID : ${GROUP_ID}"

COMMAND="docker run --uts=host -e CONTAINER=${CONTAINER_NAME} -e USER=${USER} -e TERM=xterm-256color -e COLORTERM=truecolor -e DISPLAY -e XAUTHORITY -e XDG_RUNTIME_DIR --runtime=nvidia --name ${CONTAINER_NAME} -it ${PERSIST_FLAG} --privileged -u ${USER_ID}:${GROUP_ID} -v /tmp/.X11-unix:/tmp/.X11-unix -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v /etc/shadow:/etc/shadow -v /etc/sudoers.d:/etc/sudoers.d -v /etc/sudoers:/etc/sudoers -v /run/user:/run/user --gpus=all,\"capabilities=compute,utility,graphics,display\"  --group-add sudo -v ${HOME}:${HOME} -w ${HOME} ${DOCKER_IMAGE} bash"

echo "COMMAND : ${COMMAND}"
${COMMAND}


