#!/bin/bash

set -ex

source _common.sh

cd ~/environment/ecsdemo-frontend

ecs-cli compose --project-name ecsdemo-frontend-$C9_USER service down \
    --cluster-config $CONFIG_NAME
