# syntax=docker/dockerfile:1
# escape=\

# ubuntu:22.04
FROM ubuntu:jammy-20240212 AS VULKAN_UBUNTU_BASE

RUN <<EOT
    apt update
    apt install -y sudo
    apt install -y vulkan-tools
EOT
