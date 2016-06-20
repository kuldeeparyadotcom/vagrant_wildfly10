#!/usr/bin/env bash

#Update repository and install Docker
sudo apt-get update
sudo apt-get install -y vim tree git
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo touch /etc/apt/sources.list.d/docker.list
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get purge lxc-docker
sudo apt-cache policy docker-engine
sudo apt-get update
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo apt-get -y install apparmor
sudo apt-get update
sudo apt-get -y install docker-engine
sudo service docker start
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker vagrant

#Build Docker image
cd /vagrant/Dockerfile
sudo docker build -t kuldeeparyadotcom/wildfly:snapshot .

#Run Wildfly
sudo docker run --name mywildfly -p 8080:8080 -p 9990:9990 -d kuldeeparyadotcom/wildfly:snapshot
