#!/bin/bash
filename=/home/app/elastic/elasticsearch.yml
tmp="tmp.yml"
els="\"pro-elastic-admin\""
for machine in $(gcloud compute instances list | grep elastic-group | awk {'print $1'}); do
        els=$els,\"$machine\"
        elsold=$elsold,\"$machine\"
done
echo new $els

old=`cat $filename | grep discovery.zen.ping.unicast.host | awk -F'[' '{print $2}' | awk -F']' '{print $1}'`
echo old $old
sed 's/discovery.zen.ping.unicast.hosts: \['"$old"'\]/discovery.zen.ping.unicast.hosts: \['"$els"'\]/' $filename > $tmp

if [ "$(diff $filename $tmp)" != "" ]
then
  mv $tmp $filename
  cp -f $filename /home/app/elasticsearch.yml
  sed -i 's/index.store.type: memory/#index.store.type: memory/g' /home/app/elasticsearch.yml
  sed -i 's/node.master: true/node.master: false/g' /home/app/elasticsearch.yml
  rm -f $tmp
  echo "update config ok!"
fi

