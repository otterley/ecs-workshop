#!/bin/sh -ex

taskDefinition=$(aws cloudformation list-exports --query "Exports[?Name==\`$C9_USER:MessageTaskDefinition\`].Value" --output text)

aws ecs run-task --cluster $C9_USER --task-definition $taskDefinition
