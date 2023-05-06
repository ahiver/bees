#!/bin/bash

export WORKSPACE_DIR=~/workspace/bees


export SCRIPTS_DIR=$WORKSPACE_DIR/scripts
export PROJECTS_DIR=$WORKSPACE_DIR/projects
export CONFIGS_DIR=$WORKSPACE_DIR/configs
export TMP_DIR=$WORKSPACE_DIR/tmp

export BAGS_DIR=$WORKSPACE_DIR/bags
export CALIBRATIONS_DIR=$WORKSPACE_DIR/calibrations

export KALIBR_DIR=$PROJECTS_DIR/kalibr_ws
export ALLAN_VARIANCE_DIR=$PROJECTS_DIR/allan_variance_ws
export OPEN_VINS_DIR=$PROJECTS_DIR/bee_vins_ws
export USB_CAM_DIR=$PROJECTS_DIR/usb_cam_ws
export CERES_DIR=$PROJECTS_DIR/ceres_ws

export CALIBRATION_TARGET_PATH=$CONFIGS_DIR/april.yaml

export FCU_DEVICE=/dev/ttyACM0
export FCU_BAUD_RATE=912600

export CAMERA_MODEL=pinhole-radtan
export CAMERA_TOPIC=/usb_cam/image_raw
export IMU_TOPIC=/mavros/imu/data_raw
export VINS_DEVICE_CONFIG=bee
export VINS_SIMULATION_CONFIG=bee_sym
