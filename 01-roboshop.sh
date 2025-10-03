#!/bin/bash


AMI_ID="ami-09c813fb71547fc4f"
SG_ID="sg-071f5060587c84be7"

for instance in $@
do


instance_ID=$(aws ec2 run-instances --image-id ami-09c813fb71547fc4f --instance-type t3.micro  --security-group-ids sg-071f5060587c84be7 --subnet-id subnet-0d6999ff7578a98c3 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=test}]')
  if
    IP=$(aws ec2 describe-instances --instance-ids i-052d69e9917798edd --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)
    else
     IP=$(aws ec2 describe-instances --instance-ids i-052d69e9917798edd --query 'Reservations[0].Instances[0].PrivateIpAddress' --output text)
    
    fi

    echo "$instance: $IP"
done 

