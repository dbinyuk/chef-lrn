#!/bin/bash -e

cd ~/vms/svnhttp-chef_solo
vagrant reload --provision
pushd /tmp

if test -d ./myproject/; then
	rm -rf ./myproject/
	echo "Directory removed: ./myproject/"
fi
mkdir ./myproject/

echo "cloning repo"
svn co --username=admin --password=admin http://127.0.0.1:8080/svn/myproject/ && echo ok


echo Dima is clever > myproject/README.md
cd myproject/
svn status
svn add README.md
echo "committing"
svn commit -m 'README added'
echo SUCCESS
