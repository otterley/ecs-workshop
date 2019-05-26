#!/bin/bash

set -ex

source _common.sh

export target_group_arn=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`FrontEndTargetGroup`].OutputValue' --output text)
export vpc=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`VpcId`].OutputValue' --output text)
export subnet_1=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`PrivateSubnetOne`].OutputValue' --output text)
export subnet_2=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`PrivateSubnetTwo`].OutputValue' --output text)
export subnet_3=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`PrivateSubnetThree`].OutputValue' --output text)
export security_group=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`ContainerSecurityGroup`].OutputValue' --output text)

cd ~/environment/ecsdemo-crystal
envsubst < ecs-params.yml.template >ecs-params.yml

ecs-cli compose --project-name ecsdemo-crystal-$C9_USER service up \
    --create-log-groups \
    --private-dns-namespace service \
    --enable-service-discovery \
    --cluster-config $CONFIG_NAME \
    --vpc $vpc
