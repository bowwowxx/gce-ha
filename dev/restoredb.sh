echo "start.." 
docker exec -it $i rm -rf /tmp/meta_development.gz
docker cp /tmp/meta_development.gz $i:/tmp/meta_development.gz
docker exec -it $i pg_restore -U postgres -x -c -d meta_development /tmp/meta_development.gz
rm -rf /tmp/meta_development.gz
echo "end.."docker 
