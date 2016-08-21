#!/bin/bash

# Update Ubuntu
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade


# Install Docker
curl -sSL https://get.docker.com/ | sudo sh
DOCKER_COMPOSE_VERSION=1.7.1
sudo curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Run Docker Compose
cd /criticalmaps/docker-compose
docker-compose -f docker-compose.yml up -d
