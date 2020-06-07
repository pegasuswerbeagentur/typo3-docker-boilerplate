TYPO3 Docker Boilerplate: PHP/Apache/MySQL/phpMyAdmin/Mailhog
======================================================
- [TYPO3 Docker Boilerplate: PHP/Apache/MySQL/phpMyAdmin/Mailhog](#typo3-docker-boilerplate-phpapachemysqlphpmyadminmailhog)
- [Usage](#usage)
  - [Requirements](#requirements)
  - [Setup](#setup)
  - [Make commands](#make-commands)
    - [make init-project:](#make-init-project)
    - [make remote-backup](#make-remote-backup)
    - [make db-backup:](#make-db-backup)
    - [make db-restore:](#make-db-restore)
    - [make zip-project:](#make-zip-project)
# Usage
## Requirements
- docker
- docker-compose
- composer
- make
- ssh autentification via key with production host
  
## Setup
- create project folder and cd into it:
  - `[~]$ mkdir new-project`
  - `[~]$ cd new-project`
- clone git repository into current folder:
  - `[~/new-project]$ git clone https://github.com/pegasuswerbeagentur/typo3-docker-boilerplate.git .`
- set new git origin for the project to push the local repository to:
  - `[~/new-project]$ git remote set-url origin https://github.com/user/repo.git`
  - `[~/new-project]$ git push`   
- change default environment variable values in .env file to your needs:
  - set the php version (available: 7.2, 7.3, 7.4)
  - set ssh host and user of remote system
  - set set database connection of remote typo3 (found in LocalConfiguration.php on remote server)
- build docker containers:
  - `[~/new-project]$ sudo docker-compose up -d --build`
- cd into app folder:
  - `[~/new-project]$ cd app`
- run composer installation:
  - `[~/new-project/app]$ composer install` 
- open browser and set up TYPO3: http://localhost:8000

## Make commands
### make init-project:
Create a locally running copy of the production host via ssh connection:
- rsync contents of app folder from remote to local project
- connect to remote via ssh, make datebase dump and save it to local file
- stop all running docker containers
- build and start docker containers for project
- import database into docker container
- clear cache folders
- open http://localhost:8000 in google chrome

### make remote-backup
Create a backup of the production instance (files and db):
- create backup folder named with current date, time and project name in `./backup/remote/`
- connect to remote via ssh, make datebase dump and save it to local file
- zip database file
- rsync project files from remote to local backup folder
- zip files
  
### make db-backup:
- create typo3 database backup and save it to backup/database/db.sql

### make db-restore:
- import database from backup/database/db.sql  

### make zip-project:
- create zip file of the project and save it to backup/files/project.zip while maintaining symlinks
