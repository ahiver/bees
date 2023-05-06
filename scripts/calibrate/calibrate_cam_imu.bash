#!/bin/bash

source ../env/setup.bash

if [ -z "$1" ]
then
      echo "Experiment name is not defined."
      exit 0
fi

echo Make sure update_rate and rostopic im imu.yaml are correct.

EXPERIMENT_NAME=$1
BAG_DIR=$BAGS_DIR/$EXPERIMENT_NAME
BAG_NAME=cam_imu.bag
BAG_PATH=$BAG_DIR/$BAG_NAME
EXPERIMENT_DIR=$CALIBRATIONS_DIR/${EXPERIMENT_NAME}
CAM_CALIBRATION_PATH=$EXPERIMENT_DIR/cam/cam_static-camchain.yaml
IMU_CALIBRATION_PATH=$EXPERIMENT_DIR/imu/imu.yaml
OUTPUT_DIR=$EXPERIMENT_DIR/cam_imu

if [ ! -f "$CAM_CALIBRATION_PATH" ]
then
    echo "$CAM_CALIBRATION_PATH does not exist."
    exit 0
fi

if [ ! -f "$IMU_CALIBRATION_PATH" ]
then
    echo "$IMU_CALIBRATION_PATH does not exist."
    exit 0
fi

echo Target Path: ${CALIBRATION_TARGET_PATH}
echo Camera Model: ${CAMERA_MODEL}
echo state. Press Ctrl+C to finish.
mkdir -p $OUTPUT_DIR
source $KALIBR_DIR/devel/setup.bash
pushd $OUTPUT_DIR
rosrun kalibr kalibr_calibrate_imu_camera --target $CALIBRATION_TARGET_PATH --imu $IMU_CALIBRATION_PATH --imu-models calibrated --cam $CAM_CALIBRATION_PATH --bag $BAG_PATH
echo Output path: ${OUTPUT_DIR}
popd