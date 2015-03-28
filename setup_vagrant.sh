#!/bin/bash

echo "Installing node.js..."
wget -qO- http://nodejs.org/dist/v0.12.1/node-v0.12.1-linux-x64.tar.gz  | tar -C /usr/local --strip-components 1 -xzv

echo "Installing Gulp..."
npm install --global gulp
npm install --save-dev gulp

echo "Installing Mocha..."
npm install -g mocha

echo "Installing Webpack..."
npm install -g webpack

echo "Installing MongoDB..."
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
apt-get update
sudo apt-get install -y mongodb-org=2.6.5 mongodb-org-server=2.6.5 mongodb-org-shell=2.6.5 mongodb-org-mongos=2.6.5 mongodb-org-tools=2.6.5

echo "Installing golang..."
wget -qO- https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz | tar -C /usr/local/ -xzv
# Set PATH variable for Go
echo "export PATH=\$PATH:/usr/local/go/bin" > /etc/profile.d/golang.sh

echo "Installing bzr..."
apt-get install -y bzr

echo "Cloning tidepool-tools..."
pushd /tidepool
if [ -d "tools" ]; then
    echo "Skipping, because there is already a directory by that name."
else
    git clone https://github.com/tidepool-org/tools.git
fi
popd

echo "Doing initial checkout..."
cd /tidepool/tools
sh ./get_current_tidepool_repos.sh

# Add some convenient aliases for tidepool
echo "alias tidepool-runservers='cd /tidepool/ && . tools/runservers'" > /etc/profile.d/tidepool.sh
echo "alias tidepool-update='cd /tidepool/tools && sh ./update_current_tidepool_repos.sh'" >> /etc/profile.d/tidepool.sh
