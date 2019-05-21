#!/bin/bash

set -e

echo -e "username\tpassword"

for i in $(seq 1 10); do
    username="ecs-workshop-user-$i"
    password=$(openssl rand 10 | base64 | sed -e 's/==$//')
    aws iam create-login-profile --user-name "$username" --password "$password" --no-password-reset-required >/dev/null 2>&1 ||
        aws iam update-login-profile --user-name "$username" --password "$password" --no-password-reset-required >/dev/null 
    echo -e "${username}\t${password}"
done
