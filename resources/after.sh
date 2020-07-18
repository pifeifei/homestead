#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.
#
# If you have user-specific configurations you would like
# to apply, you may also create user-customizations.sh,
# which will be run after this script.

# If you're not quite ready for Node 12.x
# Uncomment these lines to roll back to
# v11.x or v10.x

# Remove Node.js v12.x:
#sudo apt-get -y purge nodejs
#sudo rm -rf /usr/lib/node_modules/npm/lib
#sudo rm -rf //etc/apt/sources.list.d/nodesource.list

# Install Node.js v11.x
#curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
#sudo apt-get install -y nodejs

# Install Node.js v10.x
#curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
#sudo apt-get install -y nodejs

# composer 阿里云镜像源
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# php 扩展安装，时间可能会很长，国内慢
#sudo pecl channel-update pecl.php.net
#sudo pecl install swoole
#sudo pecl install inotify

# 阿里云镜像源
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/" /etc/apt/sources.list
sudo sed -i "s/security.ubuntu.com/mirrors.aliyun.com/" /etc/apt/sources.list
sudo apt-get clean

# nodejs 国内镜像源，使用 cnpm install xxx，原 npm install xxx 不受影响
sudo npm install -g cnpm --registry=https://registry.npm.taobao.org
