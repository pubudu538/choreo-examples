#!/bin/sh

set -e

ls -al
echo "Starting entry.sh"
cp -R /home/app/wso2/* /tmp/app

echo "Copying is  done"
cd /tmp/app
echo "Starting ...."
ls -al
npx nx serve business-admin-app