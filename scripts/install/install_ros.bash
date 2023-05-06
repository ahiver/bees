#!/bin/bash

source ${SCRIPTS_DIR}/env/setup.bash

# ROS
mkdir -p ${TMP_DIR}
pushd ${TMP_DIR}
# wget -c https://raw.githubusercontent.com/qboticslabs/ros_install_noetic/master/ros_install_noetic.sh && chmod +x ./ros_install_noetic.sh && ./ros_install_noetic.sh

# MavRos
sudo apt-get install ros-noetic-mavros ros-noetic-mavros-extras
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
chmod a+x install_geographiclib_datasets.sh
./install_geographiclib_datasets.sh

# ROS plugin to support compressed video topics
sudo apt install ros-noetic-image-transport-plugins

popd
rm -rf ${TMP_DIR}