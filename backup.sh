#!/bin/bash

timestamp=`date "+%Y-%m-%d"`
sql_gz_file="wikidb_backup-${timestamp}.sql.gz"
xml_gz_file="wikidb_backup-${timestamp}.xml.gz"

hostname="localhost"
userid="root"
dbname="eitcssa_wiki"
charset="utf8"

echo 'Input DB password'
# If to backup in xml way, comment out the following line and uncomment the next command.
mysqldump -h $hostname -u $userid -p --default-character-set=$charset $dbname | gzip > $(pwd)/$sql_gz_file
git add $(pwd)/$sql_gz_file
git commit -m 'backup on $(timestamp) '
git push
echo 'done'
