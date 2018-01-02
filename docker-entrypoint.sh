#!/bin/bash

set -e

until mysqladmin ping -h$MYSQL_HOST --silent; do
  echo "waiting mysqld"
  sleep 1
done

./restore.sh

exec "$@"
