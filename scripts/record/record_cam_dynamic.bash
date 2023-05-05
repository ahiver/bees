#!/bin/bash

if [ -z "$1" ]
then
      echo "Experiment name is not defined."
      exit 0
fi

source ../env/setup.bash

EXPERIMENT_NAME=$1
BAG_DIR=$BAGS_DIR/$EXPERIMENT_NAME
BAG_NAME=cam_dynamic.bag
BAG_PATH=$BAG_DIR/$BAG_NAME
echo Move camera in all DoFs. Press Ctrl+C to finish.
rosbag record --lz4 --output-name=$BAG_NAME $CAMERA_TOPIC
echo " Output path: ${BAG_PATH}"
mkdir -p $BAG_DIR
mv $BAG_NAME $BAG_DIR
