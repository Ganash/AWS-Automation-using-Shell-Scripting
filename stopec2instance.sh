get_instance_id=$1

get_instance_status=$(aws ec2 describe-instances --instance-id ${get_instance_id} --query 'Reservations[*].Instances[].State[].Name' --output text)

if [ "${get_instance_status}" == "running" ]; then
        echo "${get_instance_id} Instance is Stopping"
       aws ec2 stop-instances --instance-ids ${get_instance_id}
else
   echo "${get_instance_id} may be already in stopped state"
fi
