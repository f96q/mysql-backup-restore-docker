#!/bin/bash

set -e

if aws s3 cp s3://$S3_BUCKET/$MYSQL_DATABASE.sql $MYSQL_DATABASE.sql; then
  mysql -h$MYSQL_HOST -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < $MYSQL_DATABASE.sql
fi
