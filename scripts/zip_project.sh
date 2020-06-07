#!/bin/bash

# IMPORTANT: run scripts from project root 
# import environment variables 
export $(grep -v '^#' .env | xargs)

# create zip file of project (symlinks will be kept) and save it it backup/files/project.zip
zip -r -y - ./* >backup/files/project.zip