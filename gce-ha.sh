#!/bin/bash
BASE_VM_NAME=elastic-ha
echo "Creating the $VM_NAME instance template based on the $BASE_VM_NAME-image image ..."
gcloud compute --project "es-source-db" instances create $BASE_VM_NAME --zone "asia-east1-a" --machine-type "n1-highcpu-2" --network "default" --maintenance-policy "MIGRATE" --scopes default="https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly" --tags "http-server","https-server" --image "/debian-cloud/debian-8-jessie-v20160718" --boot-disk-size "10" --boot-disk-type "pd-standard" --boot-disk-device-name "elastic-ha"
echo " "

# install haproxy
echo "Installing haproxy ..."
gcloud compute ssh $BASE_VM_NAME --command "sudo apt-get update && sudo apt-get -y install haproxy"
gcloud compute ssh $BASE_VM_NAME --command "sudo mkdir -p /opt/haproxy  && sudo cp -f /etc/haproxy/haproxy.cfg /opt/haproxy/haproxy.cfg.template"

# update haproxy.cfg.template file
echo "Updating haproxy config template ..."
gcloud compute ssh $BASE_VM_NAME --command \
'echo -e "\n\n# Listen for incoming traffic
listen http-lb *:80
    mode http
    balance roundrobin
    option httpclose
    option forwardfor" | sudo tee -a /opt/haproxy/haproxy.cfg.template'
echo " "

echo " you need to gcloud auth login(root)!"
