#!/bin/bash
set -e
#here we saved files for backup
backupDir="backups"


#checking input data
scrDir="$( cd "$(dirname "$0")" ; pwd -P )"

if [[ ! $1 ]] 
    then
    echo  "Missing date of backup"
    exit 
fi

if [[ $2 ]] 
    then
    echo "Your input was not correct, try again "
    exit
fi

if [[ ! $1 =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ]]
  then 
  echo -e "Wrong date format, use DD-MM-YYYY"
  exit 
fi

if [[ ! -d /home/alexander/backups ]]
then 
mkdir backups
echo "We will create folder "backups" "
exit
fi


if [[ -d /home/alexander/backups/$1 ]];
then
  echo "Backup already exists there: uploads/$1"
  exit

  
  elif [[ ! -d /home/alexander/backups/$1 ]]; 
  then 
  echo "Creating backup directory..."
  cd ./backups
  mkdir -p "$1"  
fi

if [[ !  -e $1/dump.sql.gz ]];
then
echo "We do not have this backup, waiting ############### backup is in progres"

touch dump.sql

gzip --best dump.sql
mv dump.sql.gz "$1"
echo " application backup was created succesfully..."
echo "Backup is ready!"
fi








