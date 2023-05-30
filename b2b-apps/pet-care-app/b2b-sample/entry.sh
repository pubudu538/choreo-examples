#!/bin/sh

set -e

echo "Starting entry.sh"
ls -al
ls /tmp
echo "Coping is starting..."
# cp -R /home/app/wso2/* /tmp/app

echo "Coping is  done"
# cd /tmp/app
cd /home/app/wso2
echo "Starting ...."
ls -al
npx nx serve business-admin-app