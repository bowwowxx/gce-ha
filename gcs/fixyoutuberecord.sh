#!/bin/sh

#dump db backup file to gcs
rm -rf /tmp/* 
docker exec -it postgresql rm -rf /tmp/*
docker exec -it postgresql /var/lib/postgresql/tools/mountdumpdb.sh
docker cp postgresql:/tmp/meta_development.gz /tmp
mv /tmp/meta_development.gz /tmp/meta_development_$(date '+%Y%m%d').gz
gsutil cp /tmp/meta_development_*.gz gs://metadatadb/dev

#check and upload youtube log to gcs
rm -rf /home/app/logs/*.log
/home/app/metadb/tools/checkyoutube >> /home/app/logs/$(date '+%Y%m%d').log
if [ ` ls -l /home/app/logs/$(date '+%Y%m%d').log | awk '{print $5}' ` -eq 0 ]; 
then mv /home/app/logs/$(date '+%Y%m%d').log /home/app/logs/$(date '+%Y%m%d').ok.log ;
fi
gsutil cp /home/app/logs/*.log gs://youtubelog/dev
