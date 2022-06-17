#!/bin/bash

set -e

# Clone the noobaa repository
git clone --depth=1 -b utkarsh-pro/feature/loadbalancer-cidr-control https://github.com/utkarsh-pro/noobaa-operator.git

cd noobaa-operator

# Build the assets
make gen && make gen-api && make

# Convert docker images to a tar file
docker save noobaa/noobaa-operator:5.12.0 > noobaa-operator.tar
docker save noobaa/noobaa-operator-catalog:5.12.0 > noobaa-operator-catalog.tar

# Upload the assets
mv noobaa-operator.tar $GITHUB_WORKSPACE/assets/noobaa-operator.tar
mv noobaa-operator-catalog.tar $GITHUB_WORKSPACE/assets/noobaa-operator-catalog.tar
mv output $GITHUB_WORKSPACE/assets/output