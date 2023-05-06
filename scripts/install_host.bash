#!/bin/bash

source ./env/setup.bash

pushd $SCRIPTS_DIR

# bash scripts executable
find . -type f -name "*.bash" -print0 | xargs -0 chmod +x

./install/install_ros.bash
./install/install_open_vins.bash

popd

# kalibr. Camera-Imu calibration
mkdir -p ${KALIBR_DIR}/src

pushd ${KALIBR_DIR}/src
git clone https://github.com/ethz-asl/kalibr
cd ${KALIBR_DIR}
rosdep install -y --from-paths src --ignore-src
catkin_make
popd

# allan variance. Imu calibration.
mkdir -p ${ALLAN_VARIANCE_DIR}/src

pushd ${ALLAN_VARIANCE_DIR}/src
git clone https://github.com/ori-drs/allan_variance_ros.git
cd ${ALLAN_VARIANCE_DIR}
rosdep install -y --from-paths src --ignore-src
catkin_make
popd
