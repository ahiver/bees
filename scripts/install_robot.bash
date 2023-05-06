#!/bin/bash

source ./env/setup.bash

pushd $SCRIPTS_DIR

find . -type f -name *.bash -print0 | xargs -0 chmod +x

./install/install_ros.bash
./install/install_open_vins.bash

popd

# ROS Camera node for ov7251
mkdir -p ${USB_CAM_DIR}/src

pushd ${USB_CAM_DIR}/src
git clone <https://github.com/ai-are-better-than-humans/usb_cam.git
popd

pushd ${USB_CAM_DIR}
rosdep install -y --from-paths src --ignore-src
catkin_make
popd

