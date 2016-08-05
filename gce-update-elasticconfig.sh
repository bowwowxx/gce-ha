#!/bin/bash
filename=$1
tmp="tmp.yml"
els="\"pro-elastic-admin\""
for machine in $(gcloud compute instances list | grep elastic-group | awk {'print $1'}); do
        els=$els,\"$machine\"
        elsold=$elsold,\"$machine\"
done
echo $els

old=`cat $filename | grep discovery.zen.ping.unicast.host | awk -F'[' '{print $2}' | awk -F']' '{print $1}'`
echo $old
sed 's/discovery.zen.ping.unicast.hosts: \['"$old"'\]/discovery.zen.ping.unicast.hosts: \['"$els"'\]/' $filename > $tmp
mv $tmp $filename
