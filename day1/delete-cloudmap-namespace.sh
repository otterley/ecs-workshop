#!/bin/bash -ex

namespace=$(aws servicediscovery list-namespaces --query 'Namespaces[?Name==`service`].Id' --output text)
aws servicediscovery delete-namespace --id "$namespace"
