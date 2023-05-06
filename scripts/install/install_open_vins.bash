#!/bin/bash

source ../env/setup.bash

mkdir -p ${CERES_DIR}

pushd ${CERES_DIR}
# Ceres. Used by open_vins
git clone https://ceres-solver.googlesource.com/ceres-solver
cd ceres-solver
git checkout tags/2.0.0
cd ceres-solver
git checkout tags/${CERES_VERSION}
mkdir build && cd build
cmake ..
make
sudo make install
popd

# our open_vins fork
rm -rf ${OPEN_VINS_DIR}
mkdir -p ${OPEN_VINS_DIR}/src

pushd ${OPEN_VINS_DIR}/src
git clone https://github.com/ahiver/bee_vins.git
cd ${OPEN_VINS_DIR}
rosdep install -y --from-paths src --ignore-src
catkin_make
popd
