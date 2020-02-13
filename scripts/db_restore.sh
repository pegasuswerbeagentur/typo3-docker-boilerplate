# IMPORTANT: run scripts from project root 

# import environment variables 
export $(grep -v '^#' .env | xargs)

# read sql file and execute import in docker container
cat backup/database/db.sql | docker exec -i mysql_$PROJECT_NAME mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE -v