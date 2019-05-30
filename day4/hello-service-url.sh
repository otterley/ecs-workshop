#!/bin/bash -e

url=$(aws cloudformation describe-stacks --stack-name ${C9_USER}-hello-service --query 'Stacks[0].Outputs[?OutputKey==`Url`].OutputValue' --output text)
echo "http://$url"
