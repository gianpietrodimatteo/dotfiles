#!/bin/bash

# Mongodb server (community database) installation

echo "If you get errors refer to the official instalation:"
echo "https://docs.mongodb.com/manual/installation/"

echo "Import public key:"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -


echo "Select your system for adding the correct reppository"
select opSystem in debian9 debian10 ubuntu16 ubuntu18 exit
do
  case $opSystem in
    debian9)
      echo "Installing for Debian 9 (stretch)"
echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
break
      ;;
    debian10)
      echo "Installing for Debian 10 (buster)"
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
break
      ;;
    ubuntu16)
      echo "Installing for Ubuntu 16.04 (xenial)"
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
break
      ;;
    ubuntu18)
      echo "Installing for Ubuntu 18.04 (bionic)"
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
break
      ;;
    *)
      echo "Error: Please try again (select 1..8)!"
      ;;
  esac
done

echo "Update repositories"
sudo apt-get update

echo "Install mongo"
sudo apt-get install -y mongodb-org

echo "Start and enable mongo"
sudo systemctl start mongod
sudo systemctl enable mongod
