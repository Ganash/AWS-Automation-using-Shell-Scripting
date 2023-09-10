#!/bin/bash

regval=$(aws ec2 describe-regions --query "Regions[].RegionName" --output text)

: '

echo "============= Describing AWS Regions ================="

for element in ${regval}; do
        echo "${element}"
done

echo "===================================================="

 '

echo "====================================== Describing AWS EC2 Instances as per Regions =================================================="

for element in ${regval}; do
        tempval=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --region ${element} --query 'Reservations[*].Instances[*].InstanceId' | awk 'FNR == 3 {print $1}' | sed 's/"//g')

        if [ -z "${tempval}" ]
        then
                echo "No Instances in ${element} region"
                #echo "${tempval} Instances found in ${element} region"
        else
                echo "${tempval} Instances found in ${element} region"
                #echo "No Instances in ${element} region"
        fi
done

echo "======================================================================================================================================"
