#!/usr/bin/env bash

docker run --rm -it --privileged --ipc=host --pid=host \
  zed-ros2-examples:latest \
  bash

