#!/bin/bash

aws cloudformation deploy --template-file users.yml --stack-name ecs-workshop-base --capabilities CAPABILITY_NAMED_IAM
