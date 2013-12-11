#!/bin/bash -e

cd ~/vms/svnhttp-chef_solo
vagrant reload --provision
cd /tmp
[ -d myproject ] && rm -rf myproject
mkdir myproject

echo "*** cloning repo"
svn co --username=admin --password=admin http://127.0.0.1:8080/svn/myproject/
echo "new line" > myproject/README.md
cd myproject/
svn add README.md
echo "*** committing"
svn commit -m 'README added'
echo "*** SUCCESS"
