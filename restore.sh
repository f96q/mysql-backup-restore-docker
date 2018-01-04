#!/bin/bash

set -e

if aws s3 cp s3://$S3_BUCKET/$MYSQL_DATABASE.sql.gz $MYSQL_DATABASE.sql.gz; then
  zcat $MYSQL_DATABASE.sql.gz | mysql -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE
fi
