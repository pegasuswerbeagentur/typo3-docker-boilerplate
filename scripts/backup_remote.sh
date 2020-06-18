#!/bin/bash

# IMPORTANT: run scripts from project root 
# import environment variables 
export $(grep -v '^#' .env | xargs)

# set color variables for output
GREEN='\033[0;32m' #red
NC='\033[0m' # No Color

# set backup folder name to current date and time and append project name
FOLDER_PATH=./backup/remote/$(date +"%d-%m-%Y_%H_%M")_${PROJECT_NAME} 
# create backup folder
mkdir "$FOLDER_PATH"
# create db folder
mkdir "$FOLDER_PATH/DB"
printf "${GREEN}Dumping database from remote server to local file...${NC}\n"
# connect to remote via ssh, make datebase dump and save it to local file
ssh $SSH_USER@$SSH_HOST "mysqldump -v -u$LIVE_DB_USER -p"\"$LIVE_DB_PASSWORD\"" -h$LIVE_DB_HOST $LIVE_DB_NAME" > $FOLDER_PATH/DB/db.sql
printf "${GREEN}Database dump completed!${NC}\n"
# create site folder
mkdir "$FOLDER_PATH/Site"
printf "${GREEN}Starting to rsync remote files to local backup folder...${NC}\n"
# rsync contents of app folder from remote to local project
rsync -chavzP --stats $SSH_USER@$SSH_HOST:$ABSOLUTE_PATH_TO_PROJECT_ROOT/ $FOLDER_PATH/Site/
printf "${GREEN}Rsync completed!${NC}\n"
# zip database dump
cd $FOLDER_PATH/DB
pwd
zip db.sql.zip db.sql
# remove sql file
rm db.sql
# zip files
cd ../Site
zip -ry site.zip .
# cleanup
find . \! -name 'site.zip' -delete
printf "${GREEN}Backup complete. Please verify files!${NC}\n"
