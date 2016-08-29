#!/bin/bash

PROJECT=es-source-db
SERVERS=elastic-api-group
gcloud=/usr/bin/gcloud

for machine in $($gcloud compute instances list --project=$PROJECT | grep $SERVERS | awk {'print $1'}); do
    echo " server is $machine "
    ssh -o "StrictHostKeyChecking no" andy@$machine "sudo docker restart api"
    #gcloud compute ssh $machine --command "sudo docker restart api"
done

