#!/bin/bash

source ../env/setup.bash

# ROS
cd ${WORKSPACE}
wget -c <https://raw.githubusercontent.com/qboticslabs/ros_install_noetic/master/ros_install_noetic.sh> && chmod +x ./ros_install_noetic.sh && ./ros_install_noetic.sh

sudo -i

# MavRos
sudo apt-get install ros-noetic-mavros ros-noetic-mavros-extras
wget <https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
chmod a+x install_geographiclib_datasets.sh
./install_geographiclib_datasets.sh

# ROS plugin to support compressed video topics
sudo apt install ros-noetic-image-transport-plugins

# exit sudo
exit