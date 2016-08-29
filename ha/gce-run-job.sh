#!/bin/bash
BASE_VM_NAME=elastic-ha

# copy get_vms_ip
echo "copy get_vms_ip"
gcloud compute copy-files get-vms-ip $BASE_VM_NAME:/tmp
gcloud compute ssh $BASE_VM_NAME --command "sudo mkdir -p /opt/bin && sudo cp /tmp/get-vms-ip /opt/bin && sudo chmod +x /opt/bin/get-vms-ip"
echo " ok !"

# setup cron job to run each 2 minutes
echo "setup cron job for get_vm_ip"
gcloud compute ssh $BASE_VM_NAME --command 'echo "*/2 * * * * /opt/bin/get-vms-ip" | sudo tee /var/spool/cron/crontabs/root && sudo chmod 600 /var/spool/cron/crontabs/root'
echo " ok !"
