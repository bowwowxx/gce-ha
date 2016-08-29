#!/bin/bash

PROJECT=es-source-db
SERVERS=elastic-group
gcloud=/usr/bin/gcloud

for machine in $($gcloud compute instances list --project=$PROJECT | grep $SERVERS | awk {'print $1'}); do
    echo " server is $machine "
    ssh -o "StrictHostKeyChecking no" andy@$machine "sudo docker restart elastic"
done

#sudo docker restart elastic
