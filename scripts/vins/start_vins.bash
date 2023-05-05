#!/bin/bash

source ../env/setup.bash

# TODO in separate terminals 
rosrun mavros mavros_node \_fcu_url:=/dev/ttyACM0:912600

cd $USB_CAM_DIR
source devel/setup.bash`
roslaunch usb_cam usb_cam-test.launch

cd ${OPEN_VINS_DIR}
source devel/setup.bash
roslaunch ov_msckf ${VINS_CONFIG}.launch config:=${VINS_CONFIG} verbosity:=DEBUG