export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)

STACK_NAME=ec2-base-$C9_USER
CONFIG_NAME=ecs-workshop
