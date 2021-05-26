#!/bin/sh

filename=$1
folder='/backup'

# Delete existing backup file.
rm ${folder}/${filename}.sql.gz > /dev/null 2>&1

# Mysql backup. Put proper database name, password.
docker exec www_docker_mariadb mysqldump -ucenterx -pWc~188,* centerx --single-transaction --quick --lock-tables=false > ${folder}/${filename}.sql

# gzip
gzip ${folder}/${filename}.sql

