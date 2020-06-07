#############################
# MySQL
#############################
db-backup:
	sh ./scripts/db_backup.sh

db-restore:
	sh ./scripts/db_restore.sh

zip-project:
	sh ./scripts/zip_project.sh

init-project:
	sh ./scripts/init_project.sh

remote-backup:
	sh ./scripts/backup_remote.sh
