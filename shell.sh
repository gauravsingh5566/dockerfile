#!/bin/bash
 git clone https://github.com/darkomni5566/angular-starter-master.git
cd angular-starter-master/
npm install
npm run build
mv dist/ /var/www/html/

#changed=0
#git remote update && git status -uno | grep -q 'Your branch is behind' && changed=1
#if [ $changed = 1 ]; then
#    git pull
#    npm install
#    npm run build
#    mv dist /var/www/html/
#    echo "Updated successfully";
#else
#    echo "Up-to-date"
#fi




