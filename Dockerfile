FROM stereolabs/zedbot:zed-ros2-wrapper_u22_cuda117_humble_

RUN cd ~/ros2_ws/src/ && git clone https://github.com/stereolabs/zed-ros2-examples.git

RUN apt-get update \
 && cd ~/ros2_ws \
 && rosdep install --from-paths src --ignore-src -r -y \
 && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-c"]

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
 && cd ~/ros2_ws \
 && . ./install/setup.sh \
 && colcon build --symlink-install --cmake-args=-DCMAKE_BUILD_TYPE=Release \
    --packages-skip zed_rgb_convert
    

