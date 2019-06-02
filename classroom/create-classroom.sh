#!/bin/bash -e

defaultPassword=$(openssl rand 10 | base64 | sed -e 's/==$//')
createUsers=${CREATE_USERS:=true}

aws cloudformation deploy \
  --template-file classroom.yml \
  --stack-name ecs-clsrm-DO-NOT-DELETE \
  --parameter-overrides \
      DefaultPassword=${defaultPassword} \
      CreateUsers=${createUsers} \
  --capabilities CAPABILITY_NAMED_IAM
