#!/bin/bash

source ../env/setup.bash

if [ -z "$1" ]
then
      echo "Experiment name is not defined."
      exit 0
fi

EXPERIMENT_NAME=$1
BAG_DIR=$BAGS_DIR/$EXPERIMENT_NAME
BAG_NAME=imu.bag
ALLAN_CONFIG_FILE=imu_allan.yaml
ALLAN_CONFIG_PATH=$BAG_DIR/$ALLAN_CONFIG_FILE
BAG_PATH=$BAG_DIR/$BAG_NAME
OUTPUT_DIR=$CALIBRATIONS_DIR/${EXPERIMENT_NAME}/imu
COOKED_BAG_PATH=${OUTPUT_DIR}/cooked_${BAG_NAME}

if [ ! -f "$ALLAN_CONFIG_PATH" ]
then
    echo "$ALLAN_CONFIG_PATH does not exist."
    exit 0
fi

mkdir -p ${OUTPUT_DIR}
source $ALLAN_VARIANCE_DIR/devel/setup.bash
pushd $OUTPUT_DIR
rosrun allan_variance_ros cookbag.py --input ${BAG_PATH} --output ${COOKED_BAG_PATH}
rosrun allan_variance_ros allan_variance . ${ALLAN_CONFIG_PATH}
rosrun allan_variance_ros analysis.py --data allan_variance.csv --config ${ALLAN_CONFIG_PATH}
popd