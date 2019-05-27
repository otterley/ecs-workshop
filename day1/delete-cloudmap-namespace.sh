#!/bin/bash -ex

for namespace in $(aws servicediscovery list-namespaces --query 'Namespaces[?Name==`service`].Id' --output text); do
    aws servicediscovery delete-namespace --id "$namespace"
done
