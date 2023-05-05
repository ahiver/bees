#!/bin/bash
source ../env/setup.bash

cd ${WORKSPACE_DIR}/open_vins_ws

rosrun image_view image_view image:=${CAMERA_TOPIC}_image_transport:=compressed
