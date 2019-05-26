#!/bin/bash

echo "Installing ecs-cli..."
sudo curl -so /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
sudo chmod +x /usr/local/bin/ecs-cli

echo "installing jq and gettext..."
sudo yum -q -y install jq gettext
