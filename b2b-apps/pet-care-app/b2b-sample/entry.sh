#!/bin/sh

set -e

ls -al
echo "Starting entry.sh"
cp -R /home/app/wso2/* /home/app/opt

echo "Copying is  done"
cd /home/app/opt
echo "Starting ...."
ls -al
npx nx serve business-admin-app