#!/bin/bash

set -e

mysqldump -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE | gzip > $MYSQL_DATABASE.sql.gz
aws s3 cp $MYSQL_DATABASE.sql.gz s3://$S3_BUCKET/$MYSQL_DATABASE.sql.gz
