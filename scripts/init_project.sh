# IMPORTANT: run scripts from project root 

# import environment variables 
export $(grep -v '^#' .env | xargs)

rsync -chavzP --stats $SSH_USER@$SSH_HOST:$ABSOLUTE_PATH_TO_PROJECT_ROOT/app ./

ssh $SSH_USER@$SSH_HOST "mysqldump -v -u$LIVE_DB_USER -p"\"$LIVE_DB_PASSWORD\"" -h$LIVE_DB_HOST $LIVE_DB_NAME" > ./backup/database/live_db.sql