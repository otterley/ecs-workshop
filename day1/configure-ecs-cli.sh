#!/bin/bash

set -ex

source _common.sh

clustername=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`ClusterName`].OutputValue' --output text)
ecs-cli configure --region $AWS_REGION --cluster $clustername --default-launch-type EC2 --config-name $CONFIG_NAME
