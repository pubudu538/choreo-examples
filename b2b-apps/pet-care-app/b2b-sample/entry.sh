#!/bin/sh

set -e

echo "Starting entry.sh"
cp -R /home/app/wso2/* /home/app/opt
cd /home/app/opt
npx nx serve business-admin-app