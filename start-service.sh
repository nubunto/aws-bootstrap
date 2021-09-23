#!/bin/bash -xe

source /home/ec2-user/.bash_profile
cd /home/ec2-user/app/release

REGION=`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq .region -r`

# query the instance metadata API to get the instance ID
export INSTANCE_ID=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
export STACK_NAME=`aws --region $REGION ec2 describe-tags \
    --filters "Name=resource-id,Values=${INSTANCE_ID}" \
              "Name=key,Values=aws:cloudformation:stack-name" \
    | jq -r ".Tags[0].Value"`

npm run start