#!/bin/bash

set -ex

source _common.sh

cd ~/environment/ecsdemo-crystal
ecs-cli compose --project-name ecsdemo-crystal-$C9_USER service ps \
    --cluster-config $CONFIG_NAME
