#!/bin/bash

PROJECT=es-source-db
SERVERS=elastic-api-group
ADMINNAME=pro-elastic-admin
#gcloud=/usr/bin/gcloud

#send api to admin server
gcloud compute copy-files /Users/andy/gitlab/OceanKTVCloud/goapi $ADMINNAME:/tmp
gcloud compute ssh $ADMINNAME --command "sudo mv -f /tmp/goapi /home/app/api"

#for machine in $(gcloud compute instances list --project=$PROJECT | grep $SERVERS | awk {'print $1'}); do
#    echo " server is $machine "
#    gcloud compute ssh $machine --command "sudo docker restart api"
#    ssh -o "StrictHostKeyChecking no" andy@$machine "sudo docker restart api"
#done
