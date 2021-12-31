#!/bin/bash

# Get the right directory
cd $(dirname $0)
echo Staging directory $(pwd)

. secrets.sh

if [ -d $TARGET_FOLDER_NAME ]; then
  echo "File exists"
  rm -rf $TARGET_FOLDER_NAME
fi;
mkdir $TARGET_FOLDER_NAME

tar -xzvf website.tar.gz -C $TARGET_FOLDER_NAME
if [ ! -d $TARGET_FOLDER_NAME.$(date -d "today" +"%Y%m%d%H%M") ]; then
  echo "Backing up to $TARGET_FOLDER_NAME.$(date -d "today" +"%Y%m%d%H%M")"
  mv  $SERVER_HOST_PATH/$TARGET_FOLDER_NAME $TARGET_FOLDER_NAME.$(date -d "today" +"%Y%m%d%H%M")
else
  echo "1 backup already exists"
  if [ ! -d $TARGET_FOLDER_NAME.$(date -d "today" +"%Y%m%d%H%M")-2 ]; then
    echo "backing up to $TARGET_FOLDER_NAME.$(date -d "today" +"%Y%m%d%H%M")-2"
    mv  $SERVER_HOST_PATH/$TARGET_FOLDER_NAME $TARGET_FOLDER_NAME.$(date -d "today" +"%Y%m%d%H%M")-2
  else
    echo "2 backups already exists"
  fi;
fi;
mv $TARGET_FOLDER_NAME $SERVER_HOST_PATH/$TARGET_FOLDER_NAME