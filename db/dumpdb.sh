echo "start.."
docker exec -it postgresql pg_dump -U postgres -x -Fc meta_development > /tmp/meta_development.gz
docker cp postgresql:/tmp/meta_development.gz /tmp
#scp /tmp/meta_development.gz andy@pro-postgresql:/tmp
docker exec -it postgresql rm -rf /tmp/meta_development.gz
#rm -rf /tmp/meta_development.gz
echo "end.."
