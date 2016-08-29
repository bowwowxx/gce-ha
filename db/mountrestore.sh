#!/bin/sh
psql -U postgres -d meta_development -c 'DROP SEQUENCE cloud_metadata_id_seq,metadata_id_seq,playlists_id_seq,singer_songships_id_seq,singers_id_seq,songs_id_seq CASCADE;'
psql -U postgres -d meta_development -c 'DROP TABLE cloud_metadata,metadata,playlists,schema_migrations,singer_songships,singers,songs CASCADE;'
pg_restore -U postgres -d meta_development < /tmp/meta_development.gz
rm -rf /tmp/meta_development.gz
