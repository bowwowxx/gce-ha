#!/bin/sh
echo "start.." 
docker cp /tmp/meta_development.gz postgresql:/tmp/meta_development.gz
docker exec -it postgresql /var/lib/postgresql/tools/mountrestore.sh
echo "end.."docker 
