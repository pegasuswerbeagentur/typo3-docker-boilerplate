TYPO3 Docker Boilerplate: PHP/Apache/MySQL/PMA/Mailhog
======================================================
- [TYPO3 Docker Boilerplate: PHP/Apache/MySQL/PMA/Mailhog](#typo3-docker-boilerplate-phpapachemysqlpmamailhog)
- [Usage](#usage)
  - [Setup](#setup)
  - [Make commands](#make-commands)
    - [make db-backup:](#make-db-backup)
    - [make db-restore:](#make-db-restore)
# Usage
## Setup
- clone git repository into current folder: `git clone https://github.com/pegasuswerbeagentur/typo3-docker-boilerplate.git`
- change default environment variable in .env file
- build docker containers: `docker-compose up -d --build`
- cd into app folder: `cd app`
- run `composer install`

## Make commands
### make db-backup:
- create typo3 database backup and save it to backup/database.db.sql

### make db-restore:
- import database from backup/database.db.sql  