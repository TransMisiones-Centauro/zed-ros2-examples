#!/usr/bin/env bash

xhost +si:localuser:root

docker run --gpus all -it --privileged --ipc=host --pid=host \
  -e NVIDIA_DRIVER_CAPABILITIES=all -e DISPLAY \
  -v /dev:/dev -v /tmp/.X11-unix/:/tmp/.X11-unix \
  zed-ros2-examples:latest \
  ros2 launch zed_display_rviz2 display_zed_cam.launch.py camera_model:=zed2
  
xhost -si:localuser:root
