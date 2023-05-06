# bees

Update WORKSPACE_DIR in scripts/env/setup.bash to point directory bees was cloned to

# Setup Robot

## Install projects and dependencies

`chmod +x install_robot.bash`
`scripts/install_robot.bash`

## Install additional useful apps

`scripts/install/install_host_utils.bash`

## Add support of camera ov7982

`sudo nano /boot/firmware/config.txt\`

> Add dtoverlay=ov7251

`sudo reboot`

Check video0 device appeared after reboot:

`ls -l /dev/video*`

## Start ROS Nodes 

in case we use robot as ROS master

`scripts/start/start_master_robot.bash`

otherwise 

`scripts/start/start_robot.bash`

## Start Estimating device pose using Visual Odometry

TODO
`scripts/vins/start_vins.bash`

## Record rosbags with sensors data

`scripts/record/record*.bash`

# Setup Developer Host Machine

## Install projects and dependencies

`chmod +x install_host.bash`
`scripts/install_host.bash`

## Install additional useful apps

`scripts/install/install_device_utils.bash`

## Start ROS Nodes 

in case we use host as ROS master

`scripts/start/start_host_robot.bash`

otherwise 

`scripts/start/start_host.bash`

## Sensors Calibration

### Camera

`scripts/calibrate/calibrate_cam.bash`

### IMU

`scripts/calibrate/calibrate_imu.bash`

### Camera-IMU

`scripts/calibrate/calibrate_imu.bash`

## Simulation of Visual Odometry using recorded rosbags with sensor data

TODO
`scripts/vins/start_vins.bash`

## View Camera Stream online

`scripts/gui/view_camera.bash`

# Multi machine ROS setup examples

## Host is master

nano /etc/hosts

127.0.0.1 uNest
192.168.1.6 bee

nano ~/.bashrc

source /opt/ros/noetic/setup.bash
export ROS_MASTER_URI=http://127.0.0.1:11311
export ROS_IP=192.168.1.9
export ROS_HOSTNAME=uNest

source ~./bashrc

## Robot is slave

nano /etc/hosts

127.0.0.1 bee
192.168.1.9 uNest

nano ~/.bashrc

source /opt/ros/noetic/setup.bash
export ROS_MASTER_URI=http://192.168.1.3:11311
export ROS_IP=192.168.1.6
export ROS_HOSTNAME=bee

source ~./bashrc



