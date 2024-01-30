# vulkan-learning

## docker setup
docker run --uts=host -e CONTAINER=vulkan-learning -e USER=hielamon -e TERM=xterm-256color -e COLORTERM=truecolor  --runtime=nvidia --name vulkan-learning --rm -it --privileged -u 1000:1000 -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v /etc/shadow:/etc/shadow -v /etc/sudoers.d:/etc/sudoers.d -v /etc/sudoers:/etc/sudoers --group-add sudo -v /home/hielamon:/home/hielamon -w /home/hielamon e34e831650c1 bash