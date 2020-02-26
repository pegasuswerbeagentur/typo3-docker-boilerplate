TYPO3 Docker Boilerplate: PHP/Apache/MySQL/phpMyAdmin/Mailhog
======================================================
- [TYPO3 Docker Boilerplate: PHP/Apache/MySQL/phpMyAdmin/Mailhog](#typo3-docker-boilerplate-phpapachemysqlphpmyadminmailhog)
- [Usage](#usage)
  - [Requirements](#requirements)
  - [Setup](#setup)
  - [Make commands](#make-commands)
    - [make db-backup:](#make-db-backup)
    - [make db-restore:](#make-db-restore)
    - [make zip-project:](#make-zip-project)
# Usage
## Requirements
- docker
- docker-compose
- composer
- make
## Setup
- create project folder and cd into it:
  - `[~]$ mkdir new-project`
  - `[~]$ cd new-project`
- clone git repository into current folder:
  - `[~/new-project]$ git clone https://github.com/pegasuswerbeagentur/typo3-docker-boilerplate.git .`
- set new git origin for the project to push the local repository to:
  - `[~/new-project]$ git remote set-url origin https://github.com/user/repo.git`
  - `[~/new-project]$ git push`   
- change default environment variable values in .env file to your needs
- build docker containers:
  - `[~/new-project]$ sudo docker-compose up -d --build`
- cd into app folder:
  - `[~/new-project]$ cd app`
- run composer installation:
  - `[~/new-project/app]$ composer install` 
- open browser and set up TYPO3: https://localhost:8000


## Make commands
### make db-backup:
- create typo3 database backup and save it to backup/database/db.sql

### make db-restore:
- import database from backup/database/db.sql  

### make zip-project:
- create zip file of the project and save it to backup/files/project.zip
- maintains symlinks