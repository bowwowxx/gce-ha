#!/bin/sh
rm -f /tmp/meta_development.gz
pg_dump -U postgres -x -Fc meta_development > /tmp/meta_development.gz
