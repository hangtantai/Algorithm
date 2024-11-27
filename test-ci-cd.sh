#!/bin/bash

set -e

echo "Checking out code..."
rm -rf /tmp/test-ci-cd
git clone . /tmp/test-ci-cd
cd /tmp/test-ci-cd

echo "Setting up Docker Buildx..."
docker buildx create --use

echo "Creating folder in VM..."
ssh -i $VM_SSH_KEY $VM_USERNAME@$VM_HOST "sudo mkdir -p /home/ubuntu/new-folder"

echo "CI/CD pipeline simulation completed successfully."