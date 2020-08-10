#!/usr/bin/env bash

# Run this script to make a dump of the MySQL database.
#
# ./dump-docker-db.sh container_name db_pass db_name [filename.sql]
#
# Alternatively, place the parameters in a .env file (in this case all fields
# are required to be in the .env file)
#
# The .env file should look like this:
#
# DOCKER_CONTAINER_NAME=container_name
# MYSQL_USER=mysqlUser
# MYSQL_PASSWORD=mysqlPassword
# MYSQL_DATABASE=db_name
# DB_FILENAME=filename.sql
if [ -n "$1"  ]; then
    CONTAINER=$1
    MYSQL_USER=$2
    MYSQL_PASS=$3
    MYSQL_DB=$4
    if [ $5 ]; then
        DB_FILE=$5
    else
        # Get the current Year Month Day and seconds since Epoch to use as file name
        DATE=`date '+%Y-%m-%d-%s'`
        DB_FILE=${DATE}.sql
    fi

elif [ -f .env ]; then

    # Get environment variables
    set -a
    . .env
    set +a

    CONTAINER=$DOCKER_CONTAINER_NAME
    MYSQL_USER=$MYSQL_USER
    MYSQL_PASS=$MYSQL_PASSWORD
    MYSQL_DB=$MYSQL_DATABASE
    if [ -z "${DB_FILENAME}" ]; then
        # Get the current Year Month Day and seconds since Epoch to use as file name
        DATE=`date '+%Y-%m-%d-%s'`
        DB_FILE=${DATE}.sql
    else
        DB_FILE=$DB_FILENAME
    fi
else
    echo "No connection information provided."

fi

docker exec $CONTAINER sh -c "exec mysqldump -u'$MYSQL_USER' -p'$MYSQL_PASS' $MYSQL_DB" > $DB_FILE

