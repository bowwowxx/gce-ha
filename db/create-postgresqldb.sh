#!/bin/sh
docker stop postgresql
docker rm postgresql
docker run -d -p 5432:5432 -p 8000:5432 --name=postgresql -v /home/app/metadb:/var/lib/postgresql/ --restart=always -e POSTGRESQL_USER=postgres -e POSTGRESQL_PASS=zDH#2TRQ -e POSTGRESQL_DB=meta_development bowwow/posttgresql9.4
