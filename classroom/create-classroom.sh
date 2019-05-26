#!/bin/bash -e

defaultPassword=$(openssl rand 10 | base64 | sed -e 's/==$//')

aws cloudformation deploy \
  --template-file classroom.yml \
  --stack-name ecs-clsrm-DO-NOT-DELETE \
  --parameter-overrides DefaultPassword=${defaultPassword} \
  --capabilities CAPABILITY_NAMED_IAM
