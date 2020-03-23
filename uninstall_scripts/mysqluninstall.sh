#!/bin/bash

echo "Removing mysql and everything and the databases and configuration and
stuff"

sudo service mysql stop
sudo apt-get remove --purge mysql-server mysql-client mysql-common
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get remove mysql-server mysql-client mysql-common
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get update
sudo rm -r /var/lib/mysql

