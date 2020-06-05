#############################
# MySQL
#############################
db-backup:
	sh ./scripts/db_backup.sh

db-restore:
	sh ./scripts/db_restore.sh

zip-project:
	sh ./scripts/zip_project.sh

init_project:
	sh ./scripts/init_project.sh