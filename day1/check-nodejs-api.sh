#!/bin/bash

set -ex

source _common.sh

cd ~/environment/ecsdemo-nodejs
ecs-cli compose --project-name ecsdemo-nodejs-$C9_USER service ps \
    --cluster-config $CONFIG_NAME
