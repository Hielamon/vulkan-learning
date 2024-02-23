# syntax=docker/dockerfile:1
# escape=\

# ubuntu:22.04
FROM ubuntu:jammy-20240212 AS VULKAN_UBUNTU_BASE

RUN apt update

# basic package layer
RUN <<EOT
    apt install -y sudo vim git g++ make gdb bash-completion
    apt install -y vulkan-tools libvulkan-dev vulkan-validationlayers-dev spirv-tools
    apt install -y libglfw3-dev libglm-dev
    apt install -y libxxf86vm-dev libxi-dev
    apt clean
EOT
