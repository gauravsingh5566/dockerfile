#!/bin/bash
cd angular-starter-master

changed=0
git remote update && git status -uno | grep -q 'Your branch is behind' && changed=1
if [ $changed = 1 ]; then
    git pull
    npm install
    npm run build
    mv dist /var/www/html/
    echo "Updated successfully";
else
    echo "Up-to-date"
fi
