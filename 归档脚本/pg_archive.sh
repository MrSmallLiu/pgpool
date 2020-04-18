#!/bin/bash
#source /home/postgres/.bash_profile

DATE=`date +%Y%m%d`
DIR="/data/pg_archive/archivedir/$DATE"
BACK="/data/pg_archive/archivedir/"`date -d '-10 day' +%Y%m%d`
if [ -d "$BACK" ]; then
    rm -rf $BACK
    echo "success rm $BACK" > /data/pg_archive/pg_archive_logs
else
    echo "the old backup file not exists!" > /data/pg_archive/pg_archive_logs
fi

(test -d $DIR || mkdir -p $DIR) && cp $1 $DIR/$2