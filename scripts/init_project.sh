#!/bin/bash
# IMPORTANT: run scripts from project root 
# import environment variables 
export $(grep -v '^#' .env | xargs)

# set color variables for output
GREEN='\033[0;32m' #red
NC='\033[0m' # No Color

printf "${GREEN}Starting to rsync remote files to local project...${NC}\n"
# rsync contents of app folder from remote to local project
rsync -chavzP --stats $SSH_USER@$SSH_HOST:$ABSOLUTE_PATH_TO_PROJECT_ROOT/app ./
printf "${GREEN}Rsync completed!${NC}\n"

printf "${GREEN}Dumping database from remote server to local file...${NC}\n"
# connect to remote via ssh, make datebase dump and save it to local file
ssh $SSH_USER@$SSH_HOST "mysqldump -v -u$LIVE_DB_USER -p"\"$LIVE_DB_PASSWORD\"" -h$LIVE_DB_HOST $LIVE_DB_NAME" > ./backup/database/live_db.sql
printf "${GREEN}Database dump completed!${NC}\n"

printf "${GREEN}Stopping all running docker containers...${NC}\n"
# stop all running docker containers
docker stop $(docker ps -aq)
printf "${GREEN}All running containers stopped!${NC}\n"

printf "${GREEN}Building docker containers for project...${NC}\n"
# build and start docker containers for project
docker-compose up -d --build
printf "${GREEN}Docker containers up and running!${NC}\n"

printf "${GREEN}Importing dumped database into database container, this may take a few minutes...${NC}\n"
# import database into docker container
docker exec -i mysql_$PROJECT_NAME mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < ./backup/database/live_db.sql 
printf "${GREEN}Database import complete!${NC}\n"

printf "${GREEN}Clearing cache folders...${NC}\n"
# clear cache folders
rm -rf ./app/var/* ./app/web/typo3temp/*

printf "${GREEN}Opening project in browser...${NC}\n"
# open project in google chrome
google-chrome http://localhost:8000 2>/dev/null
printf "${GREEN}Project initialization completed! Happy coding!!!${NC}\n"