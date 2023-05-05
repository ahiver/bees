#!/bin/bash

source ./env/setup.bash

# bash scripts executable
find ${WORKSPACE_DIR}/scripts -type f -name *.bash -print0 | xargs -0 chmod +x

./install/install_ros.bash
./install/install_open_vins.bash

# kalibr. Camera-Imu calibration
rm -rf ${KALIBR_DIR}
cd ${WORKSPACE_DIR}
mkdir -p ${KALIBR_DIR}/src
git clone https://github.com/ethz-asl/kalibr
cd ${KALIBR_DIR}
rosdep install -y --from-paths src --ignore-src
catkin_make

# allan variance. Imu calibration.
rm -rf ${ALLAN_VARIANCE_DIR}
cd ${WORKSPACE_DIR}
mkdir -p ${ALLAN_VARIANCE_DIR}/src
git clone https://github.com/ori-drs/allan_variance_ros.git
cd ${ALLAN_VARIANCE_DIR}
rosdep install -y --from-paths src --ignore-src
catkin_make
