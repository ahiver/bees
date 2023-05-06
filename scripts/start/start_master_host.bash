#!/bin/bash

source ../env/setup.bash

roscore
pushd ${SCRIPTS_DIR}
./start/start_host.bash
popd
