#!/bin/bash

# IMPORTANT: run scripts from project root 
# import environment variables 
export $(grep -v '^#' .env | xargs)

# set backup folder name to current date and time and append project name
FOLDER_PATH=./backup/remote/$(date +"%d-%m-%Y_%H_%M")_${PROJECT_NAME} 
# create backup folder
mkdir "$FOLDER_PATH"
# create db folder
mkdir "$FOLDER_PATH/DB"
# connect to remote via ssh, make datebase dump and save it to local file
ssh $SSH_USER@$SSH_HOST "mysqldump -v -u$LIVE_DB_USER -p"\"$LIVE_DB_PASSWORD\"" -h$LIVE_DB_HOST $LIVE_DB_NAME" > $FOLDER_PATH/DB/db.sql
# zip database dump
zip $FOLDER_PATH/DB/DB.sql.zip $FOLDER_PATH/DB/db.sql
# remove sql file
rm $FOLDER_PATH/DB/db.sql
# create site folder
mkdir "$FOLDER_PATH/Site"
# rsync contents of app folder from remote to local project
rsync -chavzP --stats $SSH_USER@$SSH_HOST:$ABSOLUTE_PATH_TO_PROJECT_ROOT/ $FOLDER_PATH/Site/
# zip files
zip -ry $FOLDER_PATH/site.zip $FOLDER_PATH/Site/*
# cleanup
rm -rf $FOLDER_PATH/Site/*
mv $FOLDER_PATH/site.zip $FOLDER_PATH/Site/site.zip
