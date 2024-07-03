#!/usr/bin/env bash

xhost +si:localuser:root

docker run --gpus all -it --privileged --ipc=host --pid=host \
  -e NVIDIA_DRIVER_CAPABILITIES=all -e DISPLAY \
  -v /dev:/dev -v /tmp/.X11-unix/:/tmp/.X11-unix \
  -v ~/Desktop/CENTAURO/Perception/zed_data:/usr/local/zed/resources \
  zed-ros2-examples:latest \
  bash
  
xhost -si:localuser:root
