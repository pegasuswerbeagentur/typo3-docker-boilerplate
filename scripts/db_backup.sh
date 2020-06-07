#!/bin/bash

# IMPORTANT: run scripts from project root 
# import environment variables 
export $(grep -v '^#' .env | xargs)

# read sql file and execute import in docker container
docker exec -i mysql_$PROJECT_NAME mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE -v > backup/database/db.sql
