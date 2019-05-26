#!/bin/bash

set -ex

source _common.sh

alb_url=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query 'Stacks[0].Outputs[?OutputKey==`ExternalUrl`].OutputValue' --output text)
echo "Open $alb_url in your browser"
