#!/bin/bash

# Add repository (debian)
cd ~/Downloads && wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb
# select version
sudo dpkg-reconfigure mysql-apt-config
# Install
sudo apt update
sudo apt-get install mysql-client
sudo apt-get install mysql-server

# First login, allow with no password to root
# (there is an alternative where you set it to yourself)
sudo mysql -u root < mysql-first-login.sql
sudo service mysql restart

# Create test database
mysql -u root -p < mysql-create-test-db.sql

