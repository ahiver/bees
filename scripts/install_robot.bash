#!/bin/bash

source ../env/setup.bash

# bash scripts executable
find ${WORKSPACE_DIR}/scripts -type f -name *.bash -print0 | xargs -0 chmod +x

./install/install_ros.bash
./install/install_open_vins.bash

# ROS Camera node for ov7251
rm -rf ${USB_CAM_DIR}
cd ${USB_CAM_DIR}
mkdir -p ${USB_CAM_DIR}/src
git clone <https://github.com/ai-are-better-than-humans/usb_cam.git
cd ${USB_CAM_DIR}
rosdep install -y --from-paths src --ignore-src
catkin_make