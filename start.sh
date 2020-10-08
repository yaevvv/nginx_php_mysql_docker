#!/bin/bash

sudo apt-get update -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
######################
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
#######################
docker-compose up -d
#######################
mkdir ./nginx/var/www/proxypage
cp wp.jpg ./nginx/var/www/proxypage
cp index.php ./nginx/var/www
cp testdomain.com_nginx.crt ./nginx/conf
cp testdomain.com_nginx.key ./nginx/conf
cp ssl ./nginx/conf
cp default.conf ./nginx/conf
docker stop nginx && docker start nginx

