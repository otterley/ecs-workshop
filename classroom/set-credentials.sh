#!/bin/bash

set -e

echo -e "username\tpassword\taws_access_key_id\taws_secret_access_key"

for i in $(seq 0 10); do
    username="ecs-workshop-user-$i"
    password=$(openssl rand 10 | base64 | sed -e 's/==$//')
    # Set console password
    aws iam update-login-profile --user-name "$username" --password "$password" --no-password-reset-required >/dev/null
    # Delete access keys first
    oldKeys=$(aws iam list-access-keys --user-name "$username" --query 'AccessKeyMetadata[].AccessKeyId' --output text)
    if [[ "$oldKeys" != None ]]; then
        for oldKey in $oldKeys; do
            aws iam delete-access-key --user-name "$username" --access-key-id "$oldKey"
        done
    fi
    creds=$(aws iam create-access-key --user-name "$username")
    accessKeyId=$(echo $creds | jq -r .AccessKey.AccessKeyId)
    secretAccessKey=$(echo $creds | jq -r .AccessKey.SecretAccessKey)
    echo -e "${username}\t${password}\t${accessKeyId}\t${secretAccessKey}"
done
