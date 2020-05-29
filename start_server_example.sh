#!/usr/bin/env bash

GAMING_INSTANCE_NAME="YOUR GAMING RIG NAME GOES HERE"
LAUNCH_TEMPLATE="YOUR LAUNCH TEMPLATE ID GOES HERE"
AWS_REGION="YOUR AWS REGION GOES HERE"

ami=$(aws ec2 describe-images --filters Name=name,Values="$GAMING_INSTANCE_NAME" --output text --query 'Images[*].{ID:ImageId}' --region $AWS_REGION)

echo "Launching new instance with AMI id: $ami"
aws ec2 run-instances \
    --launch-template LaunchTemplateId=$LAUNCH_TEMPLATE,Version=1 --image-id $ami --region $AWS_REGION
