#!/bin/bash

# Get the right directory
cd $(dirname $0)/..
echo Flutter directory $(pwd)


. dev-scripts/secrets.sh

echo Publishing to $WEBSITE_HOST

#flutter build web --base-href="/mightymarks/"
cd build
#if [ -e web.tar.gz ]; then
#  echo "File exists"
#  rm web.tar.gz
#fi;
cd web
#tar -czvf ../web.tar.gz *

# scp ../web.tar.gz $WEBSITE_HOST:$SERVER_STAGING_PATH/website.tar.gz
cd ../..
scp dev-scripts/secrets.sh $WEBSITE_HOST:$SERVER_STAGING_PATH/
scp dev-scripts/server-publish.sh $WEBSITE_HOST:$SERVER_STAGING_PATH/

ssh $WEBSITE_HOST "$SERVER_STAGING_PATH/server-publish.sh"